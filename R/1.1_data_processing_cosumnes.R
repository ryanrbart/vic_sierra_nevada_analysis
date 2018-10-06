# Data import and processsing - Cosumnes

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")


# ---------------------------------------------------------------------
# Import VIC data

# Import basin-averaged daily VIC data
etqswe_cosumnes_canesm2_hist <- readr::read_csv("../BasinAvg/Cosumnes_CanESM2_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_cosumnes_ccsm4_hist <- readr::read_csv("../BasinAvg/Cosumnes_CCSM4_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_cosumnes_cnrm_hist <- readr::read_csv("../BasinAvg/Cosumnes_CNRM-CM5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_cosumnes_hadgemcc_hist <- readr::read_csv("../BasinAvg/Cosumnes_HadGEM2-CC365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_cosumnes_hadgemec_hist <- readr::read_csv("../BasinAvg/Cosumnes_HadGEM2-ES365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_cosumnes_miroc5_hist <- readr::read_csv("../BasinAvg/Cosumnes_MIROC5_Historical_Q_ET_SWE_1950-2005.csv")


etqswe_cosumnes_canesm2_45 <- readr::read_csv("../BasinAvg/Cosumnes_CanESM2_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_cosumnes_ccsm4_45 <- readr::read_csv("../BasinAvg/Cosumnes_CCSM4_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_cosumnes_cnrm_45 <- readr::read_csv("../BasinAvg/Cosumnes_CNRM-CM5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_cosumnes_hadgemcc_45 <- readr::read_csv("../BasinAvg/Cosumnes_HadGEM2-CC365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_cosumnes_hadgemec_45 <- readr::read_csv("../BasinAvg/Cosumnes_HadGEM2-ES365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_cosumnes_miroc5_45 <- readr::read_csv("../BasinAvg/Cosumnes_MIROC5_RCP45_Q_ET_SWE_2006-2099.csv")


etqswe_cosumnes_canesm2_85 <- readr::read_csv("../BasinAvg/Cosumnes_CanESM2_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_cosumnes_ccsm4_85 <- readr::read_csv("../BasinAvg/Cosumnes_CCSM4_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_cosumnes_cnrm_85 <- readr::read_csv("../BasinAvg/Cosumnes_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_cosumnes_hadgemcc_85 <- readr::read_csv("../BasinAvg/Cosumnes_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_cosumnes_hadgemec_85 <- readr::read_csv("../BasinAvg/Cosumnes_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_cosumnes_miroc5_85 <- readr::read_csv("../BasinAvg/Cosumnes_MIROC5_RCP85_Q_ET_SWE_2006-2099.csv")


etqswe_cosumnes_canesm2_85alt40pc <- readr::read_csv("../BasinAvg/Cosumnes_CanESM2_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_cosumnes_ccsm4_85alt40pc <- readr::read_csv("../BasinAvg/Cosumnes_CCSM4_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_cosumnes_cnrm_85alt40pc <- readr::read_csv("../BasinAvg/Cosumnes_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_cosumnes_hadgemcc_85alt40pc <- readr::read_csv("../BasinAvg/Cosumnes_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_cosumnes_hadgemec_85alt40pc <- readr::read_csv("../BasinAvg/Cosumnes_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_cosumnes_miroc5_85alt40pc <- readr::read_csv("../BasinAvg/Cosumnes_MIROC5_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")


# Observed values
etqswe_cosumnes_obs <- readr::read_csv("../BasinAvg/Cosumnes_Obs_Q_ET_SWE_1950-2011.csv")

# Consolidate basin-averaged daily data to lists
etqswe_cosumnes <- list(
  cosumnes_canesm2_hist=etqswe_cosumnes_canesm2_hist,cosumnes_ccsm4_hist=etqswe_cosumnes_ccsm4_hist,
  cosumnes_cnrm_hist=etqswe_cosumnes_cnrm_hist,cosumnes_hadgemcc_hist=etqswe_cosumnes_hadgemcc_hist,
  cosumnes_hadgemec_hist=etqswe_cosumnes_hadgemec_hist,cosumnes_miroc5_hist=etqswe_cosumnes_miroc5_hist,
  
  cosumnes_canesm2_45=etqswe_cosumnes_canesm2_45,cosumnes_ccsm4_45=etqswe_cosumnes_ccsm4_45,
  cosumnes_cnrm_45=etqswe_cosumnes_cnrm_45,cosumnes_hadgemcc_45=etqswe_cosumnes_hadgemcc_45,
  cosumnes_hadgemec_45=etqswe_cosumnes_hadgemec_45,cosumnes_miroc5_45=etqswe_cosumnes_miroc5_45,
  
  cosumnes_canesm2_85=etqswe_cosumnes_canesm2_85,cosumnes_ccsm4_85=etqswe_cosumnes_ccsm4_85,
  cosumnes_cnrm_85=etqswe_cosumnes_cnrm_85,cosumnes_hadgemcc_85=etqswe_cosumnes_hadgemcc_85,
  cosumnes_hadgemec_85=etqswe_cosumnes_hadgemec_85,cosumnes_miroc5_85=etqswe_cosumnes_miroc5_85,
  
  cosumnes_canesm2_85alt40pc=etqswe_cosumnes_canesm2_85alt40pc,cosumnes_ccsm4_85alt40pc=etqswe_cosumnes_ccsm4_85alt40pc,
  cosumnes_cnrm_85alt40pc=etqswe_cosumnes_cnrm_85alt40pc,cosumnes_hadgemcc_85alt40pc=etqswe_cosumnes_hadgemcc_85alt40pc,
  cosumnes_hadgemec_85alt40pc=etqswe_cosumnes_hadgemec_85alt40pc,cosumnes_miroc5_85alt40pc=etqswe_cosumnes_miroc5_85alt40pc,
  
  cosumnes_magicalgcm_obs=etqswe_cosumnes_obs
)

