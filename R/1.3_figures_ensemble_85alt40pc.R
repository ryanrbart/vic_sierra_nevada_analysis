# Ribbon Plots - 85alt40pc

source("R/0_utilities.R")
#source("R/1.2_data_processing_ensemble.R")

# ---------------------------------------------------------------------
# Plot setup

etqswesm_day_gcm_mean_sub <- etqswesm_day_gcm_mean %>% 
  dplyr::filter(watershed %in% c("american","tuolumne",
                                 "kings","kern")) %>% 
  dplyr::mutate(date = (as.Date("1999-10-1") + wyd - 1))

shed_id <- c(
  `american` = "American",
  `tuolumne` = "Tuolumne",
  `kings` = "Kings",
  `kern` = "Kern"
)

# Generate dataframe for ribbon - ET
df_et_ribbon <- etqswesm_day_gcm_mean_sub %>% 
  dplyr::filter(scenario %in% c("hist", "85alt40pc")) %>% 
  dplyr::select(watershed, scenario, date, wyd, ET) %>%  
  spread(key=scenario, value=ET) 
df_et_ribbon_def <- df_et_ribbon %>% 
  dplyr::filter(hist > `85alt40pc`, wyd>200)
df_et_ribbon_pos1 <- df_et_ribbon %>% 
  dplyr::filter(hist < `85alt40pc`, wyd<270)
df_et_ribbon_pos2 <- df_et_ribbon %>% 
  dplyr::filter(hist < `85alt40pc`, wyd>280)

# Generate dataframe for ribbon - Q
df_q_ribbon <- etqswesm_day_gcm_mean_sub %>% 
  dplyr::filter(scenario %in% c("hist", "85alt40pc")) %>% 
  dplyr::select(watershed, scenario, date, wyd, Q) %>%  
  spread(key=scenario, value=Q) 
df_q_ribbon_def <- df_q_ribbon %>% 
  dplyr::filter(hist > `85alt40pc`, wyd>100)
df_q_ribbon_pos <- df_q_ribbon %>% 
  dplyr::filter(hist < `85alt40pc`, wyd<300)

# Generate dataframe for ribbon - SWE
df_swe_ribbon_def <- etqswesm_day_gcm_mean_sub %>% 
  dplyr::filter(scenario %in% c("hist", "85alt40pc")) %>% 
  dplyr::select(watershed, scenario, date, wyd, SWE) %>%  
  spread(key=scenario, value=SWE) %>% 
  dplyr::filter(hist > `85alt40pc`, wyd>0)

# Generate dataframe for ribbon - SM
df_sm_ribbon <- etqswesm_day_gcm_mean_sub %>% 
  dplyr::filter(scenario %in% c("hist", "85alt40pc")) %>% 
  dplyr::select(watershed, scenario, date, wyd, SM) %>%   
  spread(key=scenario, value=SM) 
df_sm_ribbon_def <- df_sm_ribbon %>% 
  dplyr::filter(hist > `85alt40pc`, wyd>100)
df_sm_ribbon_pos <- df_sm_ribbon %>% 
  dplyr::filter(hist < `85alt40pc`, wyd<300)

# Generate dataframe for lines
df_line <- etqswesm_day_gcm_mean_sub %>% 
  dplyr::filter(scenario %in% c("hist", "85alt40pc"))


# ---------------------------------------------------------------------
# Ribbon plots

# ET
x <- ggplot() +
  geom_ribbon(data=df_et_ribbon_def, aes(x=date, ymin=`85alt40pc`, ymax=hist), fill="firebrick2") +
  geom_ribbon(data=df_et_ribbon_pos1, aes(x=date, ymin=hist, ymax=`85alt40pc`), fill="dodgerblue") +
  geom_ribbon(data=df_et_ribbon_pos2, aes(x=date, ymin=hist, ymax=`85alt40pc`), fill="dodgerblue") +
  geom_line(data=df_line, aes(x=date, y=ET, color=scenario)) +
  scale_x_date(labels = date_format("%b")) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","8.5")) +
  labs(title = "Mean Daily ET", x = "Month", y = "ET (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
ggsave("output/mean_daily_et_ribbon_85alt40pc.jpg", width = 6, height = 5)


# Q
x <- ggplot() +
  geom_ribbon(data=df_q_ribbon_def, aes(x=date, ymin=`85alt40pc`, ymax=hist), fill="firebrick2") +
  geom_ribbon(data=df_q_ribbon_pos, aes(x=date, ymin=hist, ymax=`85alt40pc`), fill="dodgerblue2") +
  geom_line(data=df_line, aes(x=date, y=Q, color=scenario)) +
  scale_x_date(labels = date_format("%b")) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","8.5")) +
  labs(title = "Mean Daily Streamflow", x = "Month", y = "Streamflow (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
ggsave("output/mean_daily_q_ribbon_85alt40pc.jpg", width = 6, height = 5)


# SWE
x <- ggplot() +
  geom_ribbon(data=df_swe_ribbon_def, aes(x=date, ymin=`85alt40pc`, ymax=hist), fill="red") +
  geom_line(data=df_line, aes(x=date, y=SWE, color=scenario)) +
  scale_x_date(labels = date_format("%b")) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","8.5")) +
  labs(title = "Mean Daily Snow Water Equivalent", x = "Month", y = "Snow Water Equivalent (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
ggsave("output/mean_daily_swe_ribbon_85alt40pc.jpg", width = 6, height = 5)


# SM
x <- ggplot() +
  geom_ribbon(data=df_sm_ribbon_def, aes(x=date, ymin=`85alt40pc`, ymax=hist), fill="firebrick2") +
  geom_ribbon(data=df_sm_ribbon_pos, aes(x=date, ymin=hist, ymax=`85alt40pc`), fill="dodgerblue2") +
  geom_line(data=df_line, aes(x=date, y=SM, color=scenario)) +
  scale_x_date(labels = date_format("%b")) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","8.5")) +
  labs(title = "Mean Daily Soil Moisture", x = "Month", y = "Soil Moisture (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
ggsave("output/mean_daily_sm_ribbon_85alt40pc.jpg", width = 6, height = 5)






