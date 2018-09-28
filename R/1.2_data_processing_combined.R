# VIC (ET, Q and SWE) Analysis
# 

source("R/0_utilities.R")
source("R/1.1_data_processing_american.R")
source("R/1.1_data_processing_tuolumne.R")
source("R/1.1_data_processing_kings.R")
source("R/1.1_data_processing_kern.R")


# ---------------------------------------------------------------------
# Data processing

# Function for transforming each list of watershed data to a tibble
consolidate_shed_data <- function(x){
  y <- x %>% 
    purrr::map(function(x)(mutate(x,year=year(Day), month=month(Day), day=day(Day)))) %>% 
    bind_rows(.id="type") %>% 
    separate(type, into=c("watershed","gcm","scenario")) %>% 
    mutate(season = case_when(
      (month==1)~"1",(month==2)~"1",(month==3)~"1",
      (month==4)~"2",(month==5)~"2",(month==6)~"2",
      (month==7)~"3",(month==8)~"3",(month==9)~"3",
      (month==10)~"4",(month==11)~"4",(month==12)~"4"
    ))
  return(y)
}

etqswe_american_d <- consolidate_shed_data(etqswe_american)
etqswe_tuolumne_d <- consolidate_shed_data(etqswe_tuolumne)
etqswe_kings_d <- consolidate_shed_data(etqswe_kings)
etqswe_kern_d <- consolidate_shed_data(etqswe_kern)

# Combine tibbles for each watershed to a single tibble
etqswe_d <- dplyr::bind_rows(etqswe_american_d,
                 etqswe_tuolumne_d,
                 etqswe_kings_d,
                 etqswe_kern_d)

# Add yearday (yd) and wateryearday (wyd) to tibble
etqswe_d <- etqswe_d %>% 
  dplyr::mutate(yd = date_to_yd(year=etqswe_d$year, month=etqswe_d$month, day=etqswe_d$day))
etqswe_d <- etqswe_d %>% 
  dplyr::mutate(wyd = mapply(date_to_wyd, year=etqswe_d$year, yd=etqswe_d$yd, wyd_start=274))

# Select only end of the century years for 4.5 and 8.5 scenarios
etqswe_d <- etqswe_d %>% 
  dplyr::filter(scenario == "hist" |
                  (scenario == 45 & year >= 2070) |
                  (scenario == 85 & year >= 2070))

# Group data by wateryearday
etqswe_day <- etqswe_d %>% 
  group_by(watershed, scenario, gcm, wyd) %>% 
  summarize(Q = mean(Q),
            ET = mean(ET),
            SWE = max(SWE))
etqswe_day_gcm_mean <- etqswe_day %>% 
  group_by(watershed, scenario, wyd) %>% 
  summarize(Q = mean(Q),   # For plotting mean line
            ET = mean(ET),
            SWE = mean(SWE))

# Change scenario and watershed columns to factor
scenario_levels <- c("hist", "45", "85")
etqswe_day$scenario <- factor(etqswe_day$scenario, levels = scenario_levels)
etqswe_day_gcm_mean$scenario <- factor(etqswe_day_gcm_mean$scenario, levels = scenario_levels)
shed_levels <- c("american", "tuolumne", "kings","kern")
etqswe_day$watershed <- factor(etqswe_day$watershed, levels = shed_levels)
etqswe_day_gcm_mean$watershed <- factor(etqswe_day_gcm_mean$watershed, levels = shed_levels)

