# Calculate areas within ribbon plots

source("R/0_utilities.R")
source("R/1.2_data_processing_combined.R")

# ---------------------------------------------------------------------
# Compute surplus and deficit between historical and RCP 8.5 scenario

sur_def_et <- etqswe_day_gcm_mean %>% 
  dplyr::filter(scenario != 45) %>% 
  dplyr::select(-c(Q,SWE)) %>%   
  spread(key=scenario, value=ET) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `85`,hist - `85`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `85`,`85` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(MAET_hist=sum(hist),
                   MAET_85=sum(`85`),
                   MAET_deficit=sum(deficit),
                   MAET_surplus=sum(surplus)) %>% 
  dplyr::mutate(MAET_diff = MAET_surplus - MAET_deficit)

sur_def_q <- etqswe_day_gcm_mean %>% 
  dplyr::filter(scenario != 45) %>% 
  dplyr::select(-c(ET,SWE)) %>%   
  spread(key=scenario, value=Q) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `85`,hist - `85`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `85`,`85` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(MAQ_hist=sum(hist),
                   MAQ_85=sum(`85`),
                   MAQ_deficit=sum(deficit),
                   MAQ_surplus=sum(surplus)) %>% 
  dplyr::mutate(MAQ_diff = MAQ_surplus - MAQ_deficit)

sur_def_swe <- etqswe_day_gcm_mean %>% 
  dplyr::filter(scenario != 45) %>% 
  dplyr::select(-c(ET,Q)) %>%   
  spread(key=scenario, value=SWE) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `85`,hist - `85`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `85`,`85` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(Mean_SWE_hist=mean(hist),
                   Mean_SWE_85=mean(`85`),
                   Mean_SWE_deficit=mean(deficit),
                   Mean_SWE_surplus=mean(surplus)) %>% 
  dplyr::mutate(Mean_SWE_diff = Mean_SWE_surplus - Mean_SWE_deficit)


sur_def_et
sur_def_q
sur_def_swe

write_csv(sur_def_et, "output/et_surplus_deficit.csv")
write_csv(sur_def_q, "output/q_surplus_deficit.csv")
write_csv(sur_def_swe, "output/swe_surplus_deficit.csv")



