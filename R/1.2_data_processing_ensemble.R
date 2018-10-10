# VIC (ET, Q SWE and Soil Moisture) Data Processing
# 

source("R/0_utilities.R")
source("R/1.1_data_processing_ensemble_sm.R")

# ---------------------------------------------------------------------

# Function for transforming each list of watershed data to a tibble
consolidate_shed_data <- function(x){
  y <- x %>% 
    purrr::map(function(x)(mutate(x,year=year(Day), month=month(Day), day=day(Day)))) %>% 
    dplyr::bind_rows(.id="type") %>% 
    tidyr::separate(type, into=c("junk","watershed","gcm","scenario")) %>% 
    dplyr::select(-c(junk, gcm))
  return(y)
}

etqswesm_d <- consolidate_shed_data(etqswesm)

# Add yearday (yd) and wateryearday (wyd) to tibble
etqswesm_d <- etqswesm_d %>% 
  dplyr::mutate(yd = date_to_yd(year=etqswesm_d$year, month=etqswesm_d$month, day=etqswesm_d$day))
etqswesm_d <- etqswesm_d %>% 
  dplyr::mutate(wyd = mapply(date_to_wyd, year=etqswesm_d$year, yd=etqswesm_d$yd, wyd_start=274))

# Select only end of the century years for 4.5 and 8.5 scenarios
etqswesm_d <- etqswesm_d %>% 
  dplyr::filter(scenario == "hist" |
                  (scenario == "45" & year >= 2070) |
                  (scenario == "85" & year >= 2070) |
                  (scenario == "85alt40pc" & year >= 2070))

# Group data by wateryearday
etqswesm_day_gcm_mean <- etqswesm_d %>% 
  group_by(watershed, scenario, wyd) %>% 
  summarize(Q = mean(Q),
            ET = mean(ET),
            SWE = mean(SWE),
            SM=mean(SM))


# Change scenario and watershed columns to factor
scenario_levels <- c("hist", "45", "85", "85alt40pc")
etqswesm_day_gcm_mean$scenario <- factor(etqswesm_day_gcm_mean$scenario, levels = scenario_levels)
shed_levels <- c("american","cosumnes","mokelumne","stan",
                 "tuolumne","merced","sanjoaq","kings",
                 "kaweah","tule","kern")
etqswesm_day_gcm_mean$watershed <- factor(etqswesm_day_gcm_mean$watershed, levels = shed_levels)



