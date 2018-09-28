# Data import and processsing - American

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")


# ---------------------------------------------------------------------
# Import VIC data

# Import basin-averaged daily VIC data
etqswe_american_canesm2_hist <- readr::read_csv("../BasinAvg/American_CanESM2_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_american_canesm2_45 <- readr::read_csv("../BasinAvg/American_CanESM2_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_american_canesm2_85 <- readr::read_csv("../BasinAvg/American_CanESM2_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_american_ccsm4_hist <- readr::read_csv("../BasinAvg/American_CCSM4_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_american_ccsm4_45 <- readr::read_csv("../BasinAvg/American_CCSM4_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_american_ccsm4_85 <- readr::read_csv("../BasinAvg/American_CCSM4_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_american_cnrm_hist <- readr::read_csv("../BasinAvg/American_CNRM-CM5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_american_cnrm_45 <- readr::read_csv("../BasinAvg/American_CNRM-CM5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_american_cnrm_85 <- readr::read_csv("../BasinAvg/American_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_american_hadgemcc_hist <- readr::read_csv("../BasinAvg/American_HadGEM2-CC365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_american_hadgemcc_45 <- readr::read_csv("../BasinAvg/American_HadGEM2-CC365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_american_hadgemcc_85 <- readr::read_csv("../BasinAvg/American_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_american_hadgemec_hist <- readr::read_csv("../BasinAvg/American_HadGEM2-ES365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_american_hadgemec_45 <- readr::read_csv("../BasinAvg/American_HadGEM2-ES365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_american_hadgemec_85 <- readr::read_csv("../BasinAvg/American_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_american_miroc5_hist <- readr::read_csv("../BasinAvg/American_MIROC5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_american_miroc5_45 <- readr::read_csv("../BasinAvg/American_MIROC5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_american_miroc5_85 <- readr::read_csv("../BasinAvg/American_MIROC5_RCP85_Q_ET_SWE_2006-2099.csv")

# Observed values
etqswe_american_obs <- readr::read_csv("../BasinAvg/American_Obs_Q_ET_SWE_1950-2011.csv")

# Consolidate basin-averaged daily data to lists
etqswe_american <- list(
  american_canesm2_hist=etqswe_american_canesm2_hist,
  american_ccsm4_hist=etqswe_american_ccsm4_hist,
  american_cnrm_hist=etqswe_american_cnrm_hist,
  american_hadgemcc_hist=etqswe_american_hadgemcc_hist,
  american_hadgemec_hist=etqswe_american_hadgemec_hist,
  american_miroc5_hist=etqswe_american_miroc5_hist,
  american_canesm2_45=etqswe_american_canesm2_45,american_canesm2_85=etqswe_american_canesm2_85,
  american_ccsm4_45=etqswe_american_ccsm4_45,american_ccsm4_85=etqswe_american_ccsm4_85,
  american_cnrm_45=etqswe_american_cnrm_45,american_cnrm_85=etqswe_american_cnrm_85,
  american_hadgemcc_45=etqswe_american_hadgemcc_45,american_hadgemcc_85=etqswe_american_hadgemcc_85,
  american_hadgemec_45=etqswe_american_hadgemec_45,american_hadgemec_85=etqswe_american_hadgemec_85,
  american_miroc5_45=etqswe_american_miroc5_45,american_miroc5_85=etqswe_american_miroc5_85,
  american_magicalgcm_obs=etqswe_american_obs
)

