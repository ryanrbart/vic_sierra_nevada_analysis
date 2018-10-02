# Data import and processsing - Stan

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")


# ---------------------------------------------------------------------
# Import VIC data

# Import basin-averaged daily VIC data
etqswe_stan_canesm2_hist <- readr::read_csv("../BasinAvg/Stan_CanESM2_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_stan_canesm2_45 <- readr::read_csv("../BasinAvg/Stan_CanESM2_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_stan_canesm2_85 <- readr::read_csv("../BasinAvg/Stan_CanESM2_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_stan_ccsm4_hist <- readr::read_csv("../BasinAvg/Stan_CCSM4_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_stan_ccsm4_45 <- readr::read_csv("../BasinAvg/Stan_CCSM4_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_stan_ccsm4_85 <- readr::read_csv("../BasinAvg/Stan_CCSM4_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_stan_cnrm_hist <- readr::read_csv("../BasinAvg/Stan_CNRM-CM5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_stan_cnrm_45 <- readr::read_csv("../BasinAvg/Stan_CNRM-CM5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_stan_cnrm_85 <- readr::read_csv("../BasinAvg/Stan_CNRM-CM5_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_stan_hadgemcc_hist <- readr::read_csv("../BasinAvg/Stan_HadGEM2-CC365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_stan_hadgemcc_45 <- readr::read_csv("../BasinAvg/Stan_HadGEM2-CC365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_stan_hadgemcc_85 <- readr::read_csv("../BasinAvg/Stan_HadGEM2-CC365_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_stan_hadgemec_hist <- readr::read_csv("../BasinAvg/Stan_HadGEM2-ES365_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_stan_hadgemec_45 <- readr::read_csv("../BasinAvg/Stan_HadGEM2-ES365_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_stan_hadgemec_85 <- readr::read_csv("../BasinAvg/Stan_HadGEM2-ES365_RCP85_Q_ET_SWE_2006-2099.csv")

etqswe_stan_miroc5_hist <- readr::read_csv("../BasinAvg/Stan_MIROC5_Historical_Q_ET_SWE_1950-2005.csv")
etqswe_stan_miroc5_45 <- readr::read_csv("../BasinAvg/Stan_MIROC5_RCP45_Q_ET_SWE_2006-2099.csv")
etqswe_stan_miroc5_85 <- readr::read_csv("../BasinAvg/Stan_MIROC5_RCP85_Q_ET_SWE_2006-2099.csv")

# Observed values
etqswe_stan_obs <- readr::read_csv("../BasinAvg/Stan_Obs_Q_ET_SWE_1950-2011.csv")

# Consolidate basin-averaged daily data to lists
etqswe_stan <- list(
  stan_canesm2_hist=etqswe_stan_canesm2_hist,
  stan_ccsm4_hist=etqswe_stan_ccsm4_hist,
  stan_cnrm_hist=etqswe_stan_cnrm_hist,
  stan_hadgemcc_hist=etqswe_stan_hadgemcc_hist,
  stan_hadgemec_hist=etqswe_stan_hadgemec_hist,
  stan_miroc5_hist=etqswe_stan_miroc5_hist,
  stan_canesm2_45=etqswe_stan_canesm2_45,stan_canesm2_85=etqswe_stan_canesm2_85,
  stan_ccsm4_45=etqswe_stan_ccsm4_45,stan_ccsm4_85=etqswe_stan_ccsm4_85,
  stan_cnrm_45=etqswe_stan_cnrm_45,stan_cnrm_85=etqswe_stan_cnrm_85,
  stan_hadgemcc_45=etqswe_stan_hadgemcc_45,stan_hadgemcc_85=etqswe_stan_hadgemcc_85,
  stan_hadgemec_45=etqswe_stan_hadgemec_45,stan_hadgemec_85=etqswe_stan_hadgemec_85,
  stan_miroc5_45=etqswe_stan_miroc5_45,stan_miroc5_85=etqswe_stan_miroc5_85,
  stan_magicalgcm_obs=etqswe_stan_obs
)

