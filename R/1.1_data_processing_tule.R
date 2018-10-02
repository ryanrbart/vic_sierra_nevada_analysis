# Data import and processsing - Tule

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")


# ---------------------------------------------------------------------
# Import VIC data

# Import basin-averaged daily VIC data
etqswe_tule_canesm2_hist <- readr::read_csv("../BasinAvg/Tule_CanESM2_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_tule_canesm2_45 <- readr::read_csv("../BasinAvg/Tule_CanESM2_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_tule_canesm2_85 <- readr::read_csv("../BasinAvg/Tule_CanESM2_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_tule_ccsm4_hist <- readr::read_csv("../BasinAvg/Tule_CCSM4_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_tule_ccsm4_45 <- readr::read_csv("../BasinAvg/Tule_CCSM4_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_tule_ccsm4_85 <- readr::read_csv("../BasinAvg/Tule_CCSM4_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_tule_cnrm_hist <- readr::read_csv("../BasinAvg/Tule_CNRM-CM5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_tule_cnrm_45 <- readr::read_csv("../BasinAvg/Tule_CNRM-CM5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_tule_cnrm_85 <- readr::read_csv("../BasinAvg/Tule_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_tule_hadgemcc_hist <- readr::read_csv("../BasinAvg/Tule_HadGEM2-CC365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_tule_hadgemcc_45 <- readr::read_csv("../BasinAvg/Tule_HadGEM2-CC365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_tule_hadgemcc_85 <- readr::read_csv("../BasinAvg/Tule_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_tule_hadgemec_hist <- readr::read_csv("../BasinAvg/Tule_HadGEM2-ES365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_tule_hadgemec_45 <- readr::read_csv("../BasinAvg/Tule_HadGEM2-ES365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_tule_hadgemec_85 <- readr::read_csv("../BasinAvg/Tule_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_tule_miroc5_hist <- readr::read_csv("../BasinAvg/Tule_MIROC5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_tule_miroc5_45 <- readr::read_csv("../BasinAvg/Tule_MIROC5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_tule_miroc5_85 <- readr::read_csv("../BasinAvg/Tule_MIROC5_RCP85_Q_ET_SWE_2006-2099.csv")

# Observed values
etqswe_tule_obs <- readr::read_csv("../BasinAvg/Tule_Obs_Q_ET_SWE_1950-2011.csv")

# Consolidate basin-averaged daily data to lists
etqswe_tule <- list(
  tule_canesm2_hist=etqswe_tule_canesm2_hist,
  tule_ccsm4_hist=etqswe_tule_ccsm4_hist,
  tule_cnrm_hist=etqswe_tule_cnrm_hist,
  tule_hadgemcc_hist=etqswe_tule_hadgemcc_hist,
  tule_hadgemec_hist=etqswe_tule_hadgemec_hist,
  tule_miroc5_hist=etqswe_tule_miroc5_hist,
  tule_canesm2_45=etqswe_tule_canesm2_45,tule_canesm2_85=etqswe_tule_canesm2_85,
  tule_ccsm4_45=etqswe_tule_ccsm4_45,tule_ccsm4_85=etqswe_tule_ccsm4_85,
  tule_cnrm_45=etqswe_tule_cnrm_45,tule_cnrm_85=etqswe_tule_cnrm_85,
  tule_hadgemcc_45=etqswe_tule_hadgemcc_45,tule_hadgemcc_85=etqswe_tule_hadgemcc_85,
  tule_hadgemec_45=etqswe_tule_hadgemec_45,tule_hadgemec_85=etqswe_tule_hadgemec_85,
  tule_miroc5_45=etqswe_tule_miroc5_45,tule_miroc5_85=etqswe_tule_miroc5_85,
  tule_magicalgcm_obs=etqswe_tule_obs
)

