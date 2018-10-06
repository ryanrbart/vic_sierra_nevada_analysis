# Data import and processsing - Kaweah

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")


# ---------------------------------------------------------------------
# Import VIC data

# Import basin-averaged daily VIC data
etqswe_kaweah_canesm2_hist <- readr::read_csv("../BasinAvg/Kaweah_CanESM2_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kaweah_ccsm4_hist <- readr::read_csv("../BasinAvg/Kaweah_CCSM4_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kaweah_cnrm_hist <- readr::read_csv("../BasinAvg/Kaweah_CNRM-CM5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kaweah_hadgemcc_hist <- readr::read_csv("../BasinAvg/Kaweah_HadGEM2-CC365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kaweah_hadgemec_hist <- readr::read_csv("../BasinAvg/Kaweah_HadGEM2-ES365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kaweah_miroc5_hist <- readr::read_csv("../BasinAvg/Kaweah_MIROC5_Historical_Q_ET_SWE_1950-2005.csv")


etqswe_kaweah_canesm2_45 <- readr::read_csv("../BasinAvg/Kaweah_CanESM2_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kaweah_ccsm4_45 <- readr::read_csv("../BasinAvg/Kaweah_CCSM4_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kaweah_cnrm_45 <- readr::read_csv("../BasinAvg/Kaweah_CNRM-CM5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kaweah_hadgemcc_45 <- readr::read_csv("../BasinAvg/Kaweah_HadGEM2-CC365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kaweah_hadgemec_45 <- readr::read_csv("../BasinAvg/Kaweah_HadGEM2-ES365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kaweah_miroc5_45 <- readr::read_csv("../BasinAvg/Kaweah_MIROC5_RCP45_Q_ET_SWE_2006-2099.csv")


etqswe_kaweah_canesm2_85 <- readr::read_csv("../BasinAvg/Kaweah_CanESM2_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kaweah_ccsm4_85 <- readr::read_csv("../BasinAvg/Kaweah_CCSM4_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kaweah_cnrm_85 <- readr::read_csv("../BasinAvg/Kaweah_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kaweah_hadgemcc_85 <- readr::read_csv("../BasinAvg/Kaweah_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kaweah_hadgemec_85 <- readr::read_csv("../BasinAvg/Kaweah_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kaweah_miroc5_85 <- readr::read_csv("../BasinAvg/Kaweah_MIROC5_RCP85_Q_ET_SWE_2006-2099.csv")


etqswe_kaweah_canesm2_85alt40pc <- readr::read_csv("../BasinAvg/Kaweah_CanESM2_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kaweah_ccsm4_85alt40pc <- readr::read_csv("../BasinAvg/Kaweah_CCSM4_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kaweah_cnrm_85alt40pc <- readr::read_csv("../BasinAvg/Kaweah_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kaweah_hadgemcc_85alt40pc <- readr::read_csv("../BasinAvg/Kaweah_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kaweah_hadgemec_85alt40pc <- readr::read_csv("../BasinAvg/Kaweah_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kaweah_miroc5_85alt40pc <- readr::read_csv("../BasinAvg/Kaweah_MIROC5_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")


# Observed values
etqswe_kaweah_obs <- readr::read_csv("../BasinAvg/Kaweah_Obs_Q_ET_SWE_1950-2011.csv")

# Consolidate basin-averaged daily data to lists
etqswe_kaweah <- list(
  kaweah_canesm2_hist=etqswe_kaweah_canesm2_hist,kaweah_ccsm4_hist=etqswe_kaweah_ccsm4_hist,
  kaweah_cnrm_hist=etqswe_kaweah_cnrm_hist,kaweah_hadgemcc_hist=etqswe_kaweah_hadgemcc_hist,
  kaweah_hadgemec_hist=etqswe_kaweah_hadgemec_hist,kaweah_miroc5_hist=etqswe_kaweah_miroc5_hist,
  
  kaweah_canesm2_45=etqswe_kaweah_canesm2_45,kaweah_ccsm4_45=etqswe_kaweah_ccsm4_45,
  kaweah_cnrm_45=etqswe_kaweah_cnrm_45,kaweah_hadgemcc_45=etqswe_kaweah_hadgemcc_45,
  kaweah_hadgemec_45=etqswe_kaweah_hadgemec_45,kaweah_miroc5_45=etqswe_kaweah_miroc5_45,
  
  kaweah_canesm2_85=etqswe_kaweah_canesm2_85,kaweah_ccsm4_85=etqswe_kaweah_ccsm4_85,
  kaweah_cnrm_85=etqswe_kaweah_cnrm_85,kaweah_hadgemcc_85=etqswe_kaweah_hadgemcc_85,
  kaweah_hadgemec_85=etqswe_kaweah_hadgemec_85,kaweah_miroc5_85=etqswe_kaweah_miroc5_85,
  
  kaweah_canesm2_85alt40pc=etqswe_kaweah_canesm2_85alt40pc,kaweah_ccsm4_85alt40pc=etqswe_kaweah_ccsm4_85alt40pc,
  kaweah_cnrm_85alt40pc=etqswe_kaweah_cnrm_85alt40pc,kaweah_hadgemcc_85alt40pc=etqswe_kaweah_hadgemcc_85alt40pc,
  kaweah_hadgemec_85alt40pc=etqswe_kaweah_hadgemec_85alt40pc,kaweah_miroc5_85alt40pc=etqswe_kaweah_miroc5_85alt40pc,
  
  kaweah_magicalgcm_obs=etqswe_kaweah_obs
)

