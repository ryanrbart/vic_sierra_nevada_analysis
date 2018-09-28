# Utilities


# ---------------------------------------------------------------------
# Libraries

library(tidyverse)
library(lubridate)
library(beepr)



# ---------------------------------------------------------------------
# Files and Directories


# ---------------------------------------------------------------------
# Functions


date_to_yd = function(year, month, day){
  yd <- year %>%
    paste(., month, day) %>% 
    lubridate::ymd() %>% 
    lubridate::yday()
  return(yd)
}

date_to_wyd <- function(year, yd, wyd_start){
  
  # Compute wateryear day for leap year when wateryear start is after Feb 29
  if (year %% 4 == 0 && wyd_start >= 60) {
    if (yd >= (wyd_start + 1)){
      wyd = yd - wyd_start
    } else {
      wyd = yd + (365 - wyd_start + 1)
    }
    
    # Compute wateryear day for leap year when wateryear start is before Feb 29
  } else if (year %% 4 == 0 && wyd_start < 60) {
    if (yd < wyd_start){
      wyd = yd + (365 - wyd_start + 1)
    }
    if (yd >= wyd_start && yd < 60){
      wyd = yd - wyd_start + 1
    }
    if (yd >= 60){
      wyd = yd - (wyd_start-1)
    }
    
    # Compute wateryear day during the year following a leap year when start is before Feb 29
  } else if (year %% 4 == 1 && wyd_start < 60 && yd < wyd_start) {
    wyd = yd + (365 - wyd_start + 2)
    
    # Compute wateryear day for a normal year
  } else {
    if (yd >= wyd_start){
      wyd = yd - (wyd_start - 1)
    } else {
      wyd = yd + (365 - wyd_start + 1)
    }
  }
  
  return(wyd)
}


