# Data import and processsing - Mokelumne

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")


# ---------------------------------------------------------------------
# Import VIC data

# Import basin-averaged daily VIC data
etqswe_mokelumne_canesm2_hist <- readr::read_csv("../BasinAvg/Mokelumne_CanESM2_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_mokelumne_canesm2_45 <- readr::read_csv("../BasinAvg/Mokelumne_CanESM2_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_mokelumne_canesm2_85 <- readr::read_csv("../BasinAvg/Mokelumne_CanESM2_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_mokelumne_ccsm4_hist <- readr::read_csv("../BasinAvg/Mokelumne_CCSM4_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_mokelumne_ccsm4_45 <- readr::read_csv("../BasinAvg/Mokelumne_CCSM4_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_mokelumne_ccsm4_85 <- readr::read_csv("../BasinAvg/Mokelumne_CCSM4_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_mokelumne_cnrm_hist <- readr::read_csv("../BasinAvg/Mokelumne_CNRM-CM5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_mokelumne_cnrm_45 <- readr::read_csv("../BasinAvg/Mokelumne_CNRM-CM5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_mokelumne_cnrm_85 <- readr::read_csv("../BasinAvg/Mokelumne_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_mokelumne_hadgemcc_hist <- readr::read_csv("../BasinAvg/Mokelumne_HadGEM2-CC365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_mokelumne_hadgemcc_45 <- readr::read_csv("../BasinAvg/Mokelumne_HadGEM2-CC365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_mokelumne_hadgemcc_85 <- readr::read_csv("../BasinAvg/Mokelumne_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_mokelumne_hadgemec_hist <- readr::read_csv("../BasinAvg/Mokelumne_HadGEM2-ES365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_mokelumne_hadgemec_45 <- readr::read_csv("../BasinAvg/Mokelumne_HadGEM2-ES365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_mokelumne_hadgemec_85 <- readr::read_csv("../BasinAvg/Mokelumne_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_mokelumne_miroc5_hist <- readr::read_csv("../BasinAvg/Mokelumne_MIROC5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_mokelumne_miroc5_45 <- readr::read_csv("../BasinAvg/Mokelumne_MIROC5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_mokelumne_miroc5_85 <- readr::read_csv("../BasinAvg/Mokelumne_MIROC5_RCP85_Q_ET_SWE_2006-2099.csv")

# Observed values
etqswe_mokelumne_obs <- readr::read_csv("../BasinAvg/Mokelumne_Obs_Q_ET_SWE_1950-2011.csv")

# Consolidate basin-averaged daily data to lists
etqswe_mokelumne <- list(
  mokelumne_canesm2_hist=etqswe_mokelumne_canesm2_hist,
  mokelumne_ccsm4_hist=etqswe_mokelumne_ccsm4_hist,
  mokelumne_cnrm_hist=etqswe_mokelumne_cnrm_hist,
  mokelumne_hadgemcc_hist=etqswe_mokelumne_hadgemcc_hist,
  mokelumne_hadgemec_hist=etqswe_mokelumne_hadgemec_hist,
  mokelumne_miroc5_hist=etqswe_mokelumne_miroc5_hist,
  mokelumne_canesm2_45=etqswe_mokelumne_canesm2_45,mokelumne_canesm2_85=etqswe_mokelumne_canesm2_85,
  mokelumne_ccsm4_45=etqswe_mokelumne_ccsm4_45,mokelumne_ccsm4_85=etqswe_mokelumne_ccsm4_85,
  mokelumne_cnrm_45=etqswe_mokelumne_cnrm_45,mokelumne_cnrm_85=etqswe_mokelumne_cnrm_85,
  mokelumne_hadgemcc_45=etqswe_mokelumne_hadgemcc_45,mokelumne_hadgemcc_85=etqswe_mokelumne_hadgemcc_85,
  mokelumne_hadgemec_45=etqswe_mokelumne_hadgemec_45,mokelumne_hadgemec_85=etqswe_mokelumne_hadgemec_85,
  mokelumne_miroc5_45=etqswe_mokelumne_miroc5_45,mokelumne_miroc5_85=etqswe_mokelumne_miroc5_85,
  mokelumne_magicalgcm_obs=etqswe_mokelumne_obs
)

