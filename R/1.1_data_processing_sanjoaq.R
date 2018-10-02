# Data import and processsing - Sanjoaq

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")


# ---------------------------------------------------------------------
# Import VIC data

# Import basin-averaged daily VIC data
etqswe_sanjoaq_canesm2_hist <- readr::read_csv("../BasinAvg/Sanjoan_CanESM2_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_sanjoaq_canesm2_45 <- readr::read_csv("../BasinAvg/Sanjoan_CanESM2_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_sanjoaq_canesm2_85 <- readr::read_csv("../BasinAvg/Sanjoan_CanESM2_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_sanjoaq_ccsm4_hist <- readr::read_csv("../BasinAvg/Sanjoan_CCSM4_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_sanjoaq_ccsm4_45 <- readr::read_csv("../BasinAvg/Sanjoan_CCSM4_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_sanjoaq_ccsm4_85 <- readr::read_csv("../BasinAvg/Sanjoan_CCSM4_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_sanjoaq_cnrm_hist <- readr::read_csv("../BasinAvg/Sanjoan_CNRM-CM5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_sanjoaq_cnrm_45 <- readr::read_csv("../BasinAvg/Sanjoan_CNRM-CM5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_sanjoaq_cnrm_85 <- readr::read_csv("../BasinAvg/Sanjoan_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_sanjoaq_hadgemcc_hist <- readr::read_csv("../BasinAvg/Sanjoan_HadGEM2-CC365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_sanjoaq_hadgemcc_45 <- readr::read_csv("../BasinAvg/Sanjoan_HadGEM2-CC365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_sanjoaq_hadgemcc_85 <- readr::read_csv("../BasinAvg/Sanjoan_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_sanjoaq_hadgemec_hist <- readr::read_csv("../BasinAvg/Sanjoan_HadGEM2-ES365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_sanjoaq_hadgemec_45 <- readr::read_csv("../BasinAvg/Sanjoan_HadGEM2-ES365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_sanjoaq_hadgemec_85 <- readr::read_csv("../BasinAvg/Sanjoan_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_sanjoaq_miroc5_hist <- readr::read_csv("../BasinAvg/Sanjoan_MIROC5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_sanjoaq_miroc5_45 <- readr::read_csv("../BasinAvg/Sanjoan_MIROC5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_sanjoaq_miroc5_85 <- readr::read_csv("../BasinAvg/Sanjoan_MIROC5_RCP85_Q_ET_SWE_2006-2099.csv")

# Observed values
etqswe_sanjoaq_obs <- readr::read_csv("../BasinAvg/Sanjoan_Obs_Q_ET_SWE_1950-2011.csv")

# Consolidate basin-averaged daily data to lists
etqswe_sanjoaq <- list(
  sanjoaq_canesm2_hist=etqswe_sanjoaq_canesm2_hist,
  sanjoaq_ccsm4_hist=etqswe_sanjoaq_ccsm4_hist,
  sanjoaq_cnrm_hist=etqswe_sanjoaq_cnrm_hist,
  sanjoaq_hadgemcc_hist=etqswe_sanjoaq_hadgemcc_hist,
  sanjoaq_hadgemec_hist=etqswe_sanjoaq_hadgemec_hist,
  sanjoaq_miroc5_hist=etqswe_sanjoaq_miroc5_hist,
  sanjoaq_canesm2_45=etqswe_sanjoaq_canesm2_45,sanjoaq_canesm2_85=etqswe_sanjoaq_canesm2_85,
  sanjoaq_ccsm4_45=etqswe_sanjoaq_ccsm4_45,sanjoaq_ccsm4_85=etqswe_sanjoaq_ccsm4_85,
  sanjoaq_cnrm_45=etqswe_sanjoaq_cnrm_45,sanjoaq_cnrm_85=etqswe_sanjoaq_cnrm_85,
  sanjoaq_hadgemcc_45=etqswe_sanjoaq_hadgemcc_45,sanjoaq_hadgemcc_85=etqswe_sanjoaq_hadgemcc_85,
  sanjoaq_hadgemec_45=etqswe_sanjoaq_hadgemec_45,sanjoaq_hadgemec_85=etqswe_sanjoaq_hadgemec_85,
  sanjoaq_miroc5_45=etqswe_sanjoaq_miroc5_45,sanjoaq_miroc5_85=etqswe_sanjoaq_miroc5_85,
  sanjoaq_magicalgcm_obs=etqswe_sanjoaq_obs
)

