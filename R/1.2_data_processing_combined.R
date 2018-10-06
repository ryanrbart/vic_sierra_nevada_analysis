# VIC (ET, Q and SWE) Analysis
# 

source("R/0_utilities.R")
source("R/1.1_data_processing_american.R")
source("R/1.1_data_processing_cosumnes.R")
source("R/1.1_data_processing_mokelumne.R")
source("R/1.1_data_processing_stan.R")
source("R/1.1_data_processing_tuolumne.R")
source("R/1.1_data_processing_merced.R")
source("R/1.1_data_processing_sanjoaq.R")
source("R/1.1_data_processing_kings.R")
source("R/1.1_data_processing_kaweah.R")
source("R/1.1_data_processing_tule.R")
source("R/1.1_data_processing_kern.R")


# ---------------------------------------------------------------------
# Data processing

# Function for transforming each list of watershed data to a tibble
consolidate_shed_data <- function(x){
  y <- x %>% 
    purrr::map(function(x)(mutate(x,year=year(Day), month=month(Day), day=day(Day)))) %>% 
    bind_rows(.id="type") %>% 
    separate(type, into=c("watershed","gcm","scenario"))
  return(y)
}

etqswe_american_d <- consolidate_shed_data(etqswe_american)
etqswe_cosumnes_d <- consolidate_shed_data(etqswe_cosumnes)
etqswe_mokelumne_d <- consolidate_shed_data(etqswe_mokelumne)
etqswe_stan_d <- consolidate_shed_data(etqswe_stan)
etqswe_tuolumne_d <- consolidate_shed_data(etqswe_tuolumne)
etqswe_merced_d <- consolidate_shed_data(etqswe_merced)
etqswe_sanjoaq_d <- consolidate_shed_data(etqswe_sanjoaq)
etqswe_kings_d <- consolidate_shed_data(etqswe_kings)
etqswe_kaweah_d <- consolidate_shed_data(etqswe_kaweah)
etqswe_tule_d <- consolidate_shed_data(etqswe_tule)
etqswe_kern_d <- consolidate_shed_data(etqswe_kern)

# Combine tibbles for each watershed to a single tibble
etqswe_d <- dplyr::bind_rows(etqswe_american_d,
                             etqswe_cosumnes_d,
                             etqswe_mokelumne_d,
                             etqswe_stan_d,
                             etqswe_tuolumne_d,
                             etqswe_merced_d,
                             etqswe_sanjoaq_d,
                             etqswe_kings_d,
                             etqswe_kaweah_d,
                             etqswe_tule_d,
                             etqswe_kern_d)

# Add yearday (yd) and wateryearday (wyd) to tibble
etqswe_d <- etqswe_d %>% 
  dplyr::mutate(yd = date_to_yd(year=etqswe_d$year, month=etqswe_d$month, day=etqswe_d$day))
etqswe_d <- etqswe_d %>% 
  dplyr::mutate(wyd = mapply(date_to_wyd, year=etqswe_d$year, yd=etqswe_d$yd, wyd_start=274))

# Select only end of the century years for 4.5 and 8.5 scenarios
etqswe_d <- etqswe_d %>% 
  dplyr::filter(scenario == "hist" |
                  (scenario == "45" & year >= 2070) |
                  (scenario == "85" & year >= 2070) |
                  (scenario == "85alt40pc" & year >= 2070))

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
scenario_levels <- c("hist", "45", "85", "85alt40pc")
etqswe_day$scenario <- factor(etqswe_day$scenario, levels = scenario_levels)
etqswe_day_gcm_mean$scenario <- factor(etqswe_day_gcm_mean$scenario, levels = scenario_levels)
shed_levels <- c("american","cosumnes","mokelumne","stan",
                 "tuolumne","merced","sanjoaq","kings",
                 "kaweah","tule","kern")
etqswe_day$watershed <- factor(etqswe_day$watershed, levels = shed_levels)
etqswe_day_gcm_mean$watershed <- factor(etqswe_day_gcm_mean$watershed, levels = shed_levels)


