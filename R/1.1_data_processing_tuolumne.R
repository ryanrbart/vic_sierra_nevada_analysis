# Data import and processsing - Tuolumne

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")


# ---------------------------------------------------------------------
# Import VIC data

# Import basin-averaged daily VIC data
etqswe_tuolumne_canesm2_hist <- readr::read_csv("../BasinAvg/Tuolumne_CanESM2_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_tuolumne_ccsm4_hist <- readr::read_csv("../BasinAvg/Tuolumne_CCSM4_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_tuolumne_cnrm_hist <- readr::read_csv("../BasinAvg/Tuolumne_CNRM-CM5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_tuolumne_hadgemcc_hist <- readr::read_csv("../BasinAvg/Tuolumne_HadGEM2-CC365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_tuolumne_hadgemec_hist <- readr::read_csv("../BasinAvg/Tuolumne_HadGEM2-ES365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_tuolumne_miroc5_hist <- readr::read_csv("../BasinAvg/Tuolumne_MIROC5_Historical_Q_ET_SWE_1950-2005.csv")


etqswe_tuolumne_canesm2_45 <- readr::read_csv("../BasinAvg/Tuolumne_CanESM2_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_tuolumne_ccsm4_45 <- readr::read_csv("../BasinAvg/Tuolumne_CCSM4_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_tuolumne_cnrm_45 <- readr::read_csv("../BasinAvg/Tuolumne_CNRM-CM5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_tuolumne_hadgemcc_45 <- readr::read_csv("../BasinAvg/Tuolumne_HadGEM2-CC365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_tuolumne_hadgemec_45 <- readr::read_csv("../BasinAvg/Tuolumne_HadGEM2-ES365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_tuolumne_miroc5_45 <- readr::read_csv("../BasinAvg/Tuolumne_MIROC5_RCP45_Q_ET_SWE_2006-2099.csv")


etqswe_tuolumne_canesm2_85 <- readr::read_csv("../BasinAvg/Tuolumne_CanESM2_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_tuolumne_ccsm4_85 <- readr::read_csv("../BasinAvg/Tuolumne_CCSM4_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_tuolumne_cnrm_85 <- readr::read_csv("../BasinAvg/Tuolumne_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_tuolumne_hadgemcc_85 <- readr::read_csv("../BasinAvg/Tuolumne_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_tuolumne_hadgemec_85 <- readr::read_csv("../BasinAvg/Tuolumne_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_tuolumne_miroc5_85 <- readr::read_csv("../BasinAvg/Tuolumne_MIROC5_RCP85_Q_ET_SWE_2006-2099.csv")


etqswe_tuolumne_canesm2_85alt40pc <- readr::read_csv("../BasinAvg/Tuolumne_CanESM2_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_tuolumne_ccsm4_85alt40pc <- readr::read_csv("../BasinAvg/Tuolumne_CCSM4_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_tuolumne_cnrm_85alt40pc <- readr::read_csv("../BasinAvg/Tuolumne_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_tuolumne_hadgemcc_85alt40pc <- readr::read_csv("../BasinAvg/Tuolumne_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_tuolumne_hadgemec_85alt40pc <- readr::read_csv("../BasinAvg/Tuolumne_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_tuolumne_miroc5_85alt40pc <- readr::read_csv("../BasinAvg/Tuolumne_MIROC5_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")


# Observed values
etqswe_tuolumne_obs <- readr::read_csv("../BasinAvg/Tuolumne_Obs_Q_ET_SWE_1950-2011.csv")

# Consolidate basin-averaged daily data to lists
etqswe_tuolumne <- list(
  tuolumne_canesm2_hist=etqswe_tuolumne_canesm2_hist,tuolumne_ccsm4_hist=etqswe_tuolumne_ccsm4_hist,
  tuolumne_cnrm_hist=etqswe_tuolumne_cnrm_hist,tuolumne_hadgemcc_hist=etqswe_tuolumne_hadgemcc_hist,
  tuolumne_hadgemec_hist=etqswe_tuolumne_hadgemec_hist,tuolumne_miroc5_hist=etqswe_tuolumne_miroc5_hist,
  
  tuolumne_canesm2_45=etqswe_tuolumne_canesm2_45,tuolumne_ccsm4_45=etqswe_tuolumne_ccsm4_45,
  tuolumne_cnrm_45=etqswe_tuolumne_cnrm_45,tuolumne_hadgemcc_45=etqswe_tuolumne_hadgemcc_45,
  tuolumne_hadgemec_45=etqswe_tuolumne_hadgemec_45,tuolumne_miroc5_45=etqswe_tuolumne_miroc5_45,
  
  tuolumne_canesm2_85=etqswe_tuolumne_canesm2_85,tuolumne_ccsm4_85=etqswe_tuolumne_ccsm4_85,
  tuolumne_cnrm_85=etqswe_tuolumne_cnrm_85,tuolumne_hadgemcc_85=etqswe_tuolumne_hadgemcc_85,
  tuolumne_hadgemec_85=etqswe_tuolumne_hadgemec_85,tuolumne_miroc5_85=etqswe_tuolumne_miroc5_85,
  
  tuolumne_canesm2_85alt40pc=etqswe_tuolumne_canesm2_85alt40pc,tuolumne_ccsm4_85alt40pc=etqswe_tuolumne_ccsm4_85alt40pc,
  tuolumne_cnrm_85alt40pc=etqswe_tuolumne_cnrm_85alt40pc,tuolumne_hadgemcc_85alt40pc=etqswe_tuolumne_hadgemcc_85alt40pc,
  tuolumne_hadgemec_85alt40pc=etqswe_tuolumne_hadgemec_85alt40pc,tuolumne_miroc5_85alt40pc=etqswe_tuolumne_miroc5_85alt40pc,
  
  tuolumne_magicalgcm_obs=etqswe_tuolumne_obs
)

