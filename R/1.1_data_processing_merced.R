# Data import and processsing - Merced

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")


# ---------------------------------------------------------------------
# Import VIC data

# Import basin-averaged daily VIC data
etqswe_merced_canesm2_hist <- readr::read_csv("../BasinAvg/Merced_CanESM2_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_merced_canesm2_45 <- readr::read_csv("../BasinAvg/Merced_CanESM2_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_merced_canesm2_85 <- readr::read_csv("../BasinAvg/Merced_CanESM2_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_merced_ccsm4_hist <- readr::read_csv("../BasinAvg/Merced_CCSM4_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_merced_ccsm4_45 <- readr::read_csv("../BasinAvg/Merced_CCSM4_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_merced_ccsm4_85 <- readr::read_csv("../BasinAvg/Merced_CCSM4_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_merced_cnrm_hist <- readr::read_csv("../BasinAvg/Merced_CNRM-CM5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_merced_cnrm_45 <- readr::read_csv("../BasinAvg/Merced_CNRM-CM5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_merced_cnrm_85 <- readr::read_csv("../BasinAvg/Merced_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_merced_hadgemcc_hist <- readr::read_csv("../BasinAvg/Merced_HadGEM2-CC365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_merced_hadgemcc_45 <- readr::read_csv("../BasinAvg/Merced_HadGEM2-CC365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_merced_hadgemcc_85 <- readr::read_csv("../BasinAvg/Merced_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_merced_hadgemec_hist <- readr::read_csv("../BasinAvg/Merced_HadGEM2-ES365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_merced_hadgemec_45 <- readr::read_csv("../BasinAvg/Merced_HadGEM2-ES365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_merced_hadgemec_85 <- readr::read_csv("../BasinAvg/Merced_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_merced_miroc5_hist <- readr::read_csv("../BasinAvg/Merced_MIROC5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_merced_miroc5_45 <- readr::read_csv("../BasinAvg/Merced_MIROC5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_merced_miroc5_85 <- readr::read_csv("../BasinAvg/Merced_MIROC5_RCP85_Q_ET_SWE_2006-2099.csv")

# Observed values
etqswe_merced_obs <- readr::read_csv("../BasinAvg/Merced_Obs_Q_ET_SWE_1950-2011.csv")

# Consolidate basin-averaged daily data to lists
etqswe_merced <- list(
  merced_canesm2_hist=etqswe_merced_canesm2_hist,
  merced_ccsm4_hist=etqswe_merced_ccsm4_hist,
  merced_cnrm_hist=etqswe_merced_cnrm_hist,
  merced_hadgemcc_hist=etqswe_merced_hadgemcc_hist,
  merced_hadgemec_hist=etqswe_merced_hadgemec_hist,
  merced_miroc5_hist=etqswe_merced_miroc5_hist,
  merced_canesm2_45=etqswe_merced_canesm2_45,merced_canesm2_85=etqswe_merced_canesm2_85,
  merced_ccsm4_45=etqswe_merced_ccsm4_45,merced_ccsm4_85=etqswe_merced_ccsm4_85,
  merced_cnrm_45=etqswe_merced_cnrm_45,merced_cnrm_85=etqswe_merced_cnrm_85,
  merced_hadgemcc_45=etqswe_merced_hadgemcc_45,merced_hadgemcc_85=etqswe_merced_hadgemcc_85,
  merced_hadgemec_45=etqswe_merced_hadgemec_45,merced_hadgemec_85=etqswe_merced_hadgemec_85,
  merced_miroc5_45=etqswe_merced_miroc5_45,merced_miroc5_85=etqswe_merced_miroc5_85,
  merced_magicalgcm_obs=etqswe_merced_obs
)

