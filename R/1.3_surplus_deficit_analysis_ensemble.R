# Calculate areas within ribbon plots

source("R/0_utilities.R")
source("R/1.2_data_processing_combined.R")

# ---------------------------------------------------------------------
# Compute surplus and deficit between historical and RCP 8.5 scenario

sur_def_et <- etqswesm_day_gcm_mean %>% 
  dplyr::filter(scenario %in% c("hist", "85")) %>% 
  dplyr::select(watershed, scenario, wyd, ET) %>%  
  spread(key=scenario, value=ET) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `85`,hist - `85`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `85`,`85` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(MAET_hist=sum(hist),
                   MAET_85=sum(`85`),
                   MAET_deficit=sum(deficit),
                   MAET_surplus=sum(surplus)) %>% 
  dplyr::mutate(MAET_diff = MAET_surplus - MAET_deficit)

sur_def_q <- etqswesm_day_gcm_mean %>% 
  dplyr::filter(scenario %in% c("hist", "85")) %>% 
  dplyr::select(watershed, scenario, wyd, Q) %>%  
  spread(key=scenario, value=Q) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `85`,hist - `85`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `85`,`85` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(MAQ_hist=sum(hist),
                   MAQ_85=sum(`85`),
                   MAQ_deficit=sum(deficit),
                   MAQ_surplus=sum(surplus)) %>% 
  dplyr::mutate(MAQ_diff = MAQ_surplus - MAQ_deficit)

sur_def_swe <- etqswesm_day_gcm_mean %>% 
  dplyr::filter(scenario %in% c("hist", "85")) %>% 
  dplyr::select(watershed, scenario, wyd, SWE) %>%  
  spread(key=scenario, value=SWE) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `85`,hist - `85`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `85`,`85` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(Mean_SWE_hist=mean(hist),
                   Mean_SWE_85=mean(`85`),
                   Mean_SWE_deficit=mean(deficit),
                   Mean_SWE_surplus=mean(surplus)) %>% 
  dplyr::mutate(Mean_SWE_diff = Mean_SWE_surplus - Mean_SWE_deficit)

sur_def_sm <- etqswesm_day_gcm_mean %>% 
  dplyr::filter(scenario %in% c("hist", "85")) %>% 
  dplyr::select(watershed, scenario, wyd, SM) %>%  
  spread(key=scenario, value=SM) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `85`,hist - `85`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `85`,`85` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(Mean_SM_hist=mean(hist),
                   Mean_SM_85=mean(`85`),
                   Mean_SM_deficit=mean(deficit),
                   Mean_SM_surplus=mean(surplus)) %>% 
  dplyr::mutate(Mean_SM_diff = Mean_SM_surplus - Mean_SM_deficit)


sur_def_et
sur_def_q
sur_def_swe

write_csv(sur_def_et, "output/et_surplus_deficit_85.csv")
write_csv(sur_def_q, "output/q_surplus_deficit_85.csv")
write_csv(sur_def_swe, "output/swe_surplus_deficit_85.csv")
write_csv(sur_def_sm, "output/sm_surplus_deficit_85.csv")


# ---------------------------------------------------------------------
# Compute surplus and deficit between historical and RCP 4.5 scenario

sur_def_et <- etqswesm_day_gcm_mean %>% 
  dplyr::filter(scenario %in% c("hist", "45")) %>% 
  dplyr::select(watershed, scenario, wyd, ET) %>%  
  spread(key=scenario, value=ET) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `45`,hist - `45`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `45`,`45` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(MAET_hist=sum(hist),
                   MAET_45=sum(`45`),
                   MAET_deficit=sum(deficit),
                   MAET_surplus=sum(surplus)) %>% 
  dplyr::mutate(MAET_diff = MAET_surplus - MAET_deficit)

sur_def_q <- etqswesm_day_gcm_mean %>% 
  dplyr::filter(scenario %in% c("hist", "45")) %>% 
  dplyr::select(watershed, scenario, wyd, Q) %>%  
  spread(key=scenario, value=Q) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `45`,hist - `45`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `45`,`45` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(MAQ_hist=sum(hist),
                   MAQ_45=sum(`45`),
                   MAQ_deficit=sum(deficit),
                   MAQ_surplus=sum(surplus)) %>% 
  dplyr::mutate(MAQ_diff = MAQ_surplus - MAQ_deficit)

sur_def_swe <- etqswesm_day_gcm_mean %>% 
  dplyr::filter(scenario %in% c("hist", "45")) %>% 
  dplyr::select(watershed, scenario, wyd, SWE) %>%  
  spread(key=scenario, value=SWE) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `45`,hist - `45`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `45`,`45` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(Mean_SWE_hist=mean(hist),
                   Mean_SWE_45=mean(`45`),
                   Mean_SWE_deficit=mean(deficit),
                   Mean_SWE_surplus=mean(surplus)) %>% 
  dplyr::mutate(Mean_SWE_diff = Mean_SWE_surplus - Mean_SWE_deficit)


sur_def_sm <- etqswesm_day_gcm_mean %>% 
  dplyr::filter(scenario %in% c("hist", "45")) %>% 
  dplyr::select(watershed, scenario, wyd, SM) %>%  
  spread(key=scenario, value=SM) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `45`,hist - `45`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `45`,`45` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(Mean_SM_hist=mean(hist),
                   Mean_SM_45=mean(`45`),
                   Mean_SM_deficit=mean(deficit),
                   Mean_SM_surplus=mean(surplus)) %>% 
  dplyr::mutate(Mean_SM_diff = Mean_SM_surplus - Mean_SM_deficit)


sur_def_et
sur_def_q
sur_def_swe

write_csv(sur_def_et, "output/et_surplus_deficit_45.csv")
write_csv(sur_def_q, "output/q_surplus_deficit_45.csv")
write_csv(sur_def_swe, "output/swe_surplus_deficit_45.csv")
write_csv(sur_def_sm, "output/sm_surplus_deficit_45.csv")


# ---------------------------------------------------------------------
# Compute surplus and deficit between historical and RCP 8.5alt40pc scenario

sur_def_et <- etqswesm_day_gcm_mean %>% 
  dplyr::filter(scenario %in% c("hist", "85alt40pc")) %>% 
  dplyr::select(watershed, scenario, wyd, ET) %>%  
  spread(key=scenario, value=ET) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `85alt40pc`,hist - `85alt40pc`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `85alt40pc`,`85alt40pc` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(MAET_hist=sum(hist),
                   MAET_85alt40pc=sum(`85alt40pc`),
                   MAET_deficit=sum(deficit),
                   MAET_surplus=sum(surplus)) %>% 
  dplyr::mutate(MAET_diff = MAET_surplus - MAET_deficit)

sur_def_q <- etqswesm_day_gcm_mean %>% 
  dplyr::filter(scenario %in% c("hist", "85alt40pc")) %>% 
  dplyr::select(watershed, scenario, wyd, Q) %>%  
  spread(key=scenario, value=Q) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `85alt40pc`,hist - `85alt40pc`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `85alt40pc`,`85alt40pc` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(MAQ_hist=sum(hist),
                   MAQ_85alt40pc=sum(`85alt40pc`),
                   MAQ_deficit=sum(deficit),
                   MAQ_surplus=sum(surplus)) %>% 
  dplyr::mutate(MAQ_diff = MAQ_surplus - MAQ_deficit)

sur_def_swe <- etqswesm_day_gcm_mean %>% 
  dplyr::filter(scenario %in% c("hist", "85alt40pc")) %>% 
  dplyr::select(watershed, scenario, wyd, SWE) %>%  
  spread(key=scenario, value=SWE) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `85alt40pc`,hist - `85alt40pc`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `85alt40pc`,`85alt40pc` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(Mean_SWE_hist=mean(hist),
                   Mean_SWE_85alt40pc=mean(`85alt40pc`),
                   Mean_SWE_deficit=mean(deficit),
                   Mean_SWE_surplus=mean(surplus)) %>% 
  dplyr::mutate(Mean_SWE_diff = Mean_SWE_surplus - Mean_SWE_deficit)

sur_def_sm <- etqswesm_day_gcm_mean %>% 
  dplyr::filter(scenario %in% c("hist", "85alt40pc")) %>% 
  dplyr::select(watershed, scenario, wyd, SM) %>%  
  spread(key=scenario, value=SM) %>% 
  dplyr::mutate(deficit = dplyr::if_else(hist > `85alt40pc`,hist - `85alt40pc`, 0)) %>% 
  dplyr::mutate(surplus = dplyr::if_else(hist < `85alt40pc`,`85alt40pc` - hist, 0)) %>% 
  dplyr::group_by(watershed) %>% 
  dplyr::summarize(Mean_SM_hist=mean(hist),
                   Mean_SM_85alt40pc=mean(`85alt40pc`),
                   Mean_SM_deficit=mean(deficit),
                   Mean_SM_surplus=mean(surplus)) %>% 
  dplyr::mutate(Mean_SM_diff = Mean_SM_surplus - Mean_SM_deficit)

sur_def_et
sur_def_q
sur_def_swe

write_csv(sur_def_et, "output/et_surplus_deficit_85alt40pc.csv")
write_csv(sur_def_q, "output/q_surplus_deficit_85alt40pc.csv")
write_csv(sur_def_swe, "output/swe_surplus_deficit_85alt40pc.csv")
write_csv(sur_def_sm, "output/sm_surplus_deficit_85alt40pc.csv")

