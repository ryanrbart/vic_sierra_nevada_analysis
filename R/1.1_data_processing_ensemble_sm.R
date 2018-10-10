# Data import and processsing - Ensemble soil moisture

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")


# ---------------------------------------------------------------------
# Import basin-averaged daily GCM-Ensemble VIC data

etqswesm <- list(
  # American
  etqswesm_american_ensemble_hist = readr::read_csv("../BasinAvg/American_Ensemble_Historical_Q_ET_SWE_1950-2005.csv"),
  etqswesm_american_ensemble_45 = readr::read_csv("../BasinAvg/American_Ensemble_RCP45_Q_ET_SWE_2006-2099.csv"),
  etqswesm_american_ensemble_85 = readr::read_csv("../BasinAvg/American_Ensemble_RCP85_Q_ET_SWE_2006-2099.csv"),
  etqswesm_american_ensemble_85alt40pc = readr::read_csv("../BasinAvg/American_Ensemble_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv"),
  
  # Cosumnes
  etqswesm_cosumnes_ensemble_hist = readr::read_csv("../BasinAvg/Cosumnes_Ensemble_Historical_Q_ET_SWE_1950-2005.csv"),
  etqswesm_cosumnes_ensemble_45 = readr::read_csv("../BasinAvg/Cosumnes_Ensemble_RCP45_Q_ET_SWE_2006-2099.csv"),
  etqswesm_cosumnes_ensemble_85 = readr::read_csv("../BasinAvg/Cosumnes_Ensemble_RCP85_Q_ET_SWE_2006-2099.csv"),
  etqswesm_cosumnes_ensemble_85alt40pc = readr::read_csv("../BasinAvg/Cosumnes_Ensemble_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv"),
  
  # Mokelumne
  etqswesm_mokelumne_ensemble_hist = readr::read_csv("../BasinAvg/Mokelumne_Ensemble_Historical_Q_ET_SWE_1950-2005.csv"),
  etqswesm_mokelumne_ensemble_45 = readr::read_csv("../BasinAvg/Mokelumne_Ensemble_RCP45_Q_ET_SWE_2006-2099.csv"),
  etqswesm_mokelumne_ensemble_85 = readr::read_csv("../BasinAvg/Mokelumne_Ensemble_RCP85_Q_ET_SWE_2006-2099.csv"),
  etqswesm_mokelumne_ensemble_85alt40pc = readr::read_csv("../BasinAvg/Mokelumne_Ensemble_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv"),
  
  # Stan
  etqswesm_stan_ensemble_hist = readr::read_csv("../BasinAvg/Stan_Ensemble_Historical_Q_ET_SWE_1950-2005.csv"),
  etqswesm_stan_ensemble_45 = readr::read_csv("../BasinAvg/Stan_Ensemble_RCP45_Q_ET_SWE_2006-2099.csv"),
  etqswesm_stan_ensemble_85 = readr::read_csv("../BasinAvg/Stan_Ensemble_RCP85_Q_ET_SWE_2006-2099.csv"),
  etqswesm_stan_ensemble_85alt40pc = readr::read_csv("../BasinAvg/Stan_Ensemble_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv"),
  
  # Tuolumne
  etqswesm_tuolumne_ensemble_hist = readr::read_csv("../BasinAvg/Tuolumne_Ensemble_Historical_Q_ET_SWE_1950-2005.csv"),
  etqswesm_tuolumne_ensemble_45 = readr::read_csv("../BasinAvg/Tuolumne_Ensemble_RCP45_Q_ET_SWE_2006-2099.csv"),
  etqswesm_tuolumne_ensemble_85 = readr::read_csv("../BasinAvg/Tuolumne_Ensemble_RCP85_Q_ET_SWE_2006-2099.csv"),
  etqswesm_tuolumne_ensemble_85alt40pc = readr::read_csv("../BasinAvg/Tuolumne_Ensemble_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv"),
  
  # Merced
  etqswesm_merced_ensemble_hist = readr::read_csv("../BasinAvg/Merced_Ensemble_Historical_Q_ET_SWE_1950-2005.csv"),
  etqswesm_merced_ensemble_45 = readr::read_csv("../BasinAvg/Merced_Ensemble_RCP45_Q_ET_SWE_2006-2099.csv"),
  etqswesm_merced_ensemble_85 = readr::read_csv("../BasinAvg/Merced_Ensemble_RCP85_Q_ET_SWE_2006-2099.csv"),
  etqswesm_merced_ensemble_85alt40pc = readr::read_csv("../BasinAvg/Merced_Ensemble_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv"),
  
  # SanJoaq
  etqswesm_sanjoaq_ensemble_hist = readr::read_csv("../BasinAvg/SanJoan_Ensemble_Historical_Q_ET_SWE_1950-2005.csv"),
  etqswesm_sanjoaq_ensemble_45 = readr::read_csv("../BasinAvg/SanJoan_Ensemble_RCP45_Q_ET_SWE_2006-2099.csv"),
  etqswesm_sanjoaq_ensemble_85 = readr::read_csv("../BasinAvg/SanJoan_Ensemble_RCP85_Q_ET_SWE_2006-2099.csv"),
  etqswesm_sanjoaq_ensemble_85alt40pc = readr::read_csv("../BasinAvg/SanJoan_Ensemble_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv"),
  
  # Kings
  etqswesm_kings_ensemble_hist = readr::read_csv("../BasinAvg/Kings_Ensemble_Historical_Q_ET_SWE_1950-2005.csv"),
  etqswesm_kings_ensemble_45 = readr::read_csv("../BasinAvg/Kings_Ensemble_RCP45_Q_ET_SWE_2006-2099.csv"),
  etqswesm_kings_ensemble_85 = readr::read_csv("../BasinAvg/Kings_Ensemble_RCP85_Q_ET_SWE_2006-2099.csv"),
  etqswesm_kings_ensemble_85alt40pc = readr::read_csv("../BasinAvg/Kings_Ensemble_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv"),
  
  # Kaweah
  etqswesm_kaweah_ensemble_hist = readr::read_csv("../BasinAvg/Kaweah_Ensemble_Historical_Q_ET_SWE_1950-2005.csv"),
  etqswesm_kaweah_ensemble_45 = readr::read_csv("../BasinAvg/Kaweah_Ensemble_RCP45_Q_ET_SWE_2006-2099.csv"),
  etqswesm_kaweah_ensemble_85 = readr::read_csv("../BasinAvg/Kaweah_Ensemble_RCP85_Q_ET_SWE_2006-2099.csv"),
  etqswesm_kaweah_ensemble_85alt40pc = readr::read_csv("../BasinAvg/Kaweah_Ensemble_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv"),
  
  # Tule
  etqswesm_tule_ensemble_hist = readr::read_csv("../BasinAvg/Tule_Ensemble_Historical_Q_ET_SWE_1950-2005.csv"),
  etqswesm_tule_ensemble_45 = readr::read_csv("../BasinAvg/Tule_Ensemble_RCP45_Q_ET_SWE_2006-2099.csv"),
  etqswesm_tule_ensemble_85 = readr::read_csv("../BasinAvg/Tule_Ensemble_RCP85_Q_ET_SWE_2006-2099.csv"),
  etqswesm_tule_ensemble_85alt40pc = readr::read_csv("../BasinAvg/Tule_Ensemble_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv"),
  
  # Kern
  etqswesm_kern_ensemble_hist = readr::read_csv("../BasinAvg/Kern_Ensemble_Historical_Q_ET_SWE_1950-2005.csv"),
  etqswesm_kern_ensemble_45 = readr::read_csv("../BasinAvg/Kern_Ensemble_RCP45_Q_ET_SWE_2006-2099.csv"),
  etqswesm_kern_ensemble_85 = readr::read_csv("../BasinAvg/Kern_Ensemble_RCP85_Q_ET_SWE_2006-2099.csv"),
  etqswesm_kern_ensemble_85alt40pc = readr::read_csv("../BasinAvg/Kern_Ensemble_RCP85_Q_ET_SWE_2006-2099_40PC_Conductence.csv")
)



