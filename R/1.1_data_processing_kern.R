# Data import and processsing - Kern

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")


# ---------------------------------------------------------------------
# Import VIC data

# Import basin-averaged daily VIC data
etqswe_kern_canesm2_hist <- readr::read_csv("../BasinAvg/Kern_CanESM2_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kern_ccsm4_hist <- readr::read_csv("../BasinAvg/Kern_CCSM4_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kern_cnrm_hist <- readr::read_csv("../BasinAvg/Kern_CNRM-CM5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kern_hadgemcc_hist <- readr::read_csv("../BasinAvg/Kern_HadGEM2-CC365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kern_hadgemec_hist <- readr::read_csv("../BasinAvg/Kern_HadGEM2-ES365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kern_miroc5_hist <- readr::read_csv("../BasinAvg/Kern_MIROC5_Historical_Q_ET_SWE_1950-2005.csv")


etqswe_kern_canesm2_45 <- readr::read_csv("../BasinAvg/Kern_CanESM2_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kern_ccsm4_45 <- readr::read_csv("../BasinAvg/Kern_CCSM4_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kern_cnrm_45 <- readr::read_csv("../BasinAvg/Kern_CNRM-CM5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kern_hadgemcc_45 <- readr::read_csv("../BasinAvg/Kern_HadGEM2-CC365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kern_hadgemec_45 <- readr::read_csv("../BasinAvg/Kern_HadGEM2-ES365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kern_miroc5_45 <- readr::read_csv("../BasinAvg/Kern_MIROC5_RCP45_Q_ET_SWE_2006-2099.csv")


etqswe_kern_canesm2_85 <- readr::read_csv("../BasinAvg/Kern_CanESM2_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kern_ccsm4_85 <- readr::read_csv("../BasinAvg/Kern_CCSM4_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kern_cnrm_85 <- readr::read_csv("../BasinAvg/Kern_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kern_hadgemcc_85 <- readr::read_csv("../BasinAvg/Kern_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kern_hadgemec_85 <- readr::read_csv("../BasinAvg/Kern_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kern_miroc5_85 <- readr::read_csv("../BasinAvg/Kern_MIROC5_RCP85_Q_ET_SWE_2006-2099.csv")


etqswe_kern_canesm2_85alt40pc <- readr::read_csv("../BasinAvg/Kern_CanESM2_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kern_ccsm4_85alt40pc <- readr::read_csv("../BasinAvg/Kern_CCSM4_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kern_cnrm_85alt40pc <- readr::read_csv("../BasinAvg/Kern_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kern_hadgemcc_85alt40pc <- readr::read_csv("../BasinAvg/Kern_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kern_hadgemec_85alt40pc <- readr::read_csv("../BasinAvg/Kern_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kern_miroc5_85alt40pc <- readr::read_csv("../BasinAvg/Kern_MIROC5_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")


# Observed values
etqswe_kern_obs <- readr::read_csv("../BasinAvg/Kern_Obs_Q_ET_SWE_1950-2011.csv")

# Consolidate basin-averaged daily data to lists
etqswe_kern <- list(
  kern_canesm2_hist=etqswe_kern_canesm2_hist,kern_ccsm4_hist=etqswe_kern_ccsm4_hist,
  kern_cnrm_hist=etqswe_kern_cnrm_hist,kern_hadgemcc_hist=etqswe_kern_hadgemcc_hist,
  kern_hadgemec_hist=etqswe_kern_hadgemec_hist,kern_miroc5_hist=etqswe_kern_miroc5_hist,
  
  kern_canesm2_45=etqswe_kern_canesm2_45,kern_ccsm4_45=etqswe_kern_ccsm4_45,
  kern_cnrm_45=etqswe_kern_cnrm_45,kern_hadgemcc_45=etqswe_kern_hadgemcc_45,
  kern_hadgemec_45=etqswe_kern_hadgemec_45,kern_miroc5_45=etqswe_kern_miroc5_45,
  
  kern_canesm2_85=etqswe_kern_canesm2_85,kern_ccsm4_85=etqswe_kern_ccsm4_85,
  kern_cnrm_85=etqswe_kern_cnrm_85,kern_hadgemcc_85=etqswe_kern_hadgemcc_85,
  kern_hadgemec_85=etqswe_kern_hadgemec_85,kern_miroc5_85=etqswe_kern_miroc5_85,
  
  kern_canesm2_85alt40pc=etqswe_kern_canesm2_85alt40pc,kern_ccsm4_85alt40pc=etqswe_kern_ccsm4_85alt40pc,
  kern_cnrm_85alt40pc=etqswe_kern_cnrm_85alt40pc,kern_hadgemcc_85alt40pc=etqswe_kern_hadgemcc_85alt40pc,
  kern_hadgemec_85alt40pc=etqswe_kern_hadgemec_85alt40pc,kern_miroc5_85alt40pc=etqswe_kern_miroc5_85alt40pc,
  
  kern_magicalgcm_obs=etqswe_kern_obs
)

