# Data import and processsing - Kings

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")


# ---------------------------------------------------------------------
# Import VIC data

# Import basin-averaged daily VIC data
etqswe_kings_canesm2_hist <- readr::read_csv("../BasinAvg/Kings_CanESM2_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kings_ccsm4_hist <- readr::read_csv("../BasinAvg/Kings_CCSM4_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kings_cnrm_hist <- readr::read_csv("../BasinAvg/Kings_CNRM-CM5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kings_hadgemcc_hist <- readr::read_csv("../BasinAvg/Kings_HadGEM2-CC365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kings_hadgemec_hist <- readr::read_csv("../BasinAvg/Kings_HadGEM2-ES365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_kings_miroc5_hist <- readr::read_csv("../BasinAvg/Kings_MIROC5_Historical_Q_ET_SWE_1950-2005.csv")


etqswe_kings_canesm2_45 <- readr::read_csv("../BasinAvg/Kings_CanESM2_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kings_ccsm4_45 <- readr::read_csv("../BasinAvg/Kings_CCSM4_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kings_cnrm_45 <- readr::read_csv("../BasinAvg/Kings_CNRM-CM5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kings_hadgemcc_45 <- readr::read_csv("../BasinAvg/Kings_HadGEM2-CC365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kings_hadgemec_45 <- readr::read_csv("../BasinAvg/Kings_HadGEM2-ES365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_kings_miroc5_45 <- readr::read_csv("../BasinAvg/Kings_MIROC5_RCP45_Q_ET_SWE_2006-2099.csv")


etqswe_kings_canesm2_85 <- readr::read_csv("../BasinAvg/Kings_CanESM2_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kings_ccsm4_85 <- readr::read_csv("../BasinAvg/Kings_CCSM4_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kings_cnrm_85 <- readr::read_csv("../BasinAvg/Kings_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kings_hadgemcc_85 <- readr::read_csv("../BasinAvg/Kings_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kings_hadgemec_85 <- readr::read_csv("../BasinAvg/Kings_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099.csv")
etqswe_kings_miroc5_85 <- readr::read_csv("../BasinAvg/Kings_MIROC5_RCP85_Q_ET_SWE_2006-2099.csv")


etqswe_kings_canesm2_85alt40pc <- readr::read_csv("../BasinAvg/Kings_CanESM2_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kings_ccsm4_85alt40pc <- readr::read_csv("../BasinAvg/Kings_CCSM4_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kings_cnrm_85alt40pc <- readr::read_csv("../BasinAvg/Kings_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kings_hadgemcc_85alt40pc <- readr::read_csv("../BasinAvg/Kings_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kings_hadgemec_85alt40pc <- readr::read_csv("../BasinAvg/Kings_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
etqswe_kings_miroc5_85alt40pc <- readr::read_csv("../BasinAvg/Kings_MIROC5_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")


# Observed values
etqswe_kings_obs <- readr::read_csv("../BasinAvg/Kings_Obs_Q_ET_SWE_1950-2011.csv")

# Consolidate basin-averaged daily data to lists
etqswe_kings <- list(
  kings_canesm2_hist=etqswe_kings_canesm2_hist,kings_ccsm4_hist=etqswe_kings_ccsm4_hist,
  kings_cnrm_hist=etqswe_kings_cnrm_hist,kings_hadgemcc_hist=etqswe_kings_hadgemcc_hist,
  kings_hadgemec_hist=etqswe_kings_hadgemec_hist,kings_miroc5_hist=etqswe_kings_miroc5_hist,
  
  kings_canesm2_45=etqswe_kings_canesm2_45,kings_ccsm4_45=etqswe_kings_ccsm4_45,
  kings_cnrm_45=etqswe_kings_cnrm_45,kings_hadgemcc_45=etqswe_kings_hadgemcc_45,
  kings_hadgemec_45=etqswe_kings_hadgemec_45,kings_miroc5_45=etqswe_kings_miroc5_45,
  
  kings_canesm2_85=etqswe_kings_canesm2_85,kings_ccsm4_85=etqswe_kings_ccsm4_85,
  kings_cnrm_85=etqswe_kings_cnrm_85,kings_hadgemcc_85=etqswe_kings_hadgemcc_85,
  kings_hadgemec_85=etqswe_kings_hadgemec_85,kings_miroc5_85=etqswe_kings_miroc5_85,
  
  kings_canesm2_85alt40pc=etqswe_kings_canesm2_85alt40pc,kings_ccsm4_85alt40pc=etqswe_kings_ccsm4_85alt40pc,
  kings_cnrm_85alt40pc=etqswe_kings_cnrm_85alt40pc,kings_hadgemcc_85alt40pc=etqswe_kings_hadgemcc_85alt40pc,
  kings_hadgemec_85alt40pc=etqswe_kings_hadgemec_85alt40pc,kings_miroc5_85alt40pc=etqswe_kings_miroc5_85alt40pc,
  
  kings_magicalgcm_obs=etqswe_kings_obs
)

