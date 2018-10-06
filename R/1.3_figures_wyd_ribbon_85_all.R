# Ribbon Plots - all watersheds - 85

source("R/0_utilities.R")
#source("R/1.2_data_processing_combined.R")

# ---------------------------------------------------------------------
# Plot setup

etqswe_day_gcm_mean_sub <- etqswe_day_gcm_mean %>% 
  # dplyr::filter(watershed %in% c("american","tuolumne",
  #                                "kings","kern")) %>% 
  dplyr::mutate(date = (as.Date("1999-10-1") + wyd - 1))

shed_id <- c(
  `american` = "American",
  `cosumnes` = "Cosumnes",
  `mokelumne` = "Mokelumne",
  `stan` = "Stanislaus",
  `tuolumne` = "Tuolumne",
  `merced` = "Merced",
  `sanjoaq` = "San Joaquin",
  `kings` = "Kings",
  `kaweah` = "Kaweah",
  `tule` = "Tule",
  `kern` = "Kern"
)

# Generate dataframe for ribbon
# For geom_ribbon, need ymin and ymax to be different columns
df_et_ribbon <- etqswe_day_gcm_mean_sub %>% 
  dplyr::filter(scenario != 45 & scenario != "85alt40pc") %>% 
  dplyr::select(-c(Q,SWE)) %>%   
  spread(key=scenario, value=ET) 
df_et_ribbon_def <- df_et_ribbon %>% 
  dplyr::filter(hist > `85`, wyd>200)
df_et_ribbon_pos <- df_et_ribbon %>% 
  dplyr::filter(hist < `85`, wyd<300)


# Generate dataframe for ribbon
# For geom_ribbon, need ymin and ymax to be different columns
df_q_ribbon <- etqswe_day_gcm_mean_sub %>% 
  dplyr::filter(scenario != 45 & scenario != "85alt40pc") %>% 
  dplyr::select(-c(ET,SWE)) %>%   
  spread(key=scenario, value=Q) 
df_q_ribbon_def <- df_q_ribbon %>% 
  dplyr::filter(hist > `85`, wyd>100)
df_q_ribbon_pos <- df_q_ribbon %>% 
  dplyr::filter(hist < `85`, wyd<300)


# Generate dataframe for ribbon
# For geom_ribbon, need ymin and ymax to be different columns
df_swe_ribbon_def <- etqswe_day_gcm_mean_sub %>% 
  dplyr::filter(scenario != 45 & scenario != "85alt40pc") %>% 
  dplyr::select(-c(ET,Q)) %>%   
  spread(key=scenario, value=SWE) %>% 
  dplyr::filter(hist > `85`, wyd>0)

# Generate dataframe for lines
df_line <- etqswe_day_gcm_mean_sub %>% 
  dplyr::filter(scenario != 45 & scenario != "85alt40pc")


# ---------------------------------------------------------------------
# Ribbon plots

# ET
x <- ggplot() +
  geom_ribbon(data=df_et_ribbon_def, aes(x=date, ymin=`85`, ymax=hist), fill="firebrick2") +
  geom_ribbon(data=df_et_ribbon_pos, aes(x=date, ymin=hist, ymax=`85`), fill="dodgerblue") +
  geom_line(data=df_line, aes(x=date, y=ET, color=scenario)) +
  scale_x_date(labels = date_format("%b")) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","8.5")) +
  labs(title = "Mean Daily ET", x = "Month", y = "ET (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
ggsave("output/mean_daily_et_ribbon_85_all.jpg", width = 6, height = 10)


# Q
x <- ggplot() +
  geom_ribbon(data=df_q_ribbon_def, aes(x=date, ymin=`85`, ymax=hist), fill="firebrick2") +
  geom_ribbon(data=df_q_ribbon_pos, aes(x=date, ymin=hist, ymax=`85`), fill="dodgerblue2") +
  geom_line(data=df_line, aes(x=date, y=Q, color=scenario)) +
  scale_x_date(labels = date_format("%b")) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","8.5")) +
  labs(title = "Mean Daily Streamflow", x = "Month", y = "Streamflow (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
ggsave("output/mean_daily_q_ribbon_85_all.jpg", width = 6, height = 10)


# SWE
x <- ggplot() +
  geom_ribbon(data=df_swe_ribbon_def, aes(x=date, ymin=`85`, ymax=hist), fill="red") +
  geom_line(data=df_line, aes(x=date, y=SWE, color=scenario)) +
  scale_x_date(labels = date_format("%b")) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","8.5")) +
  labs(title = "Mean Daily Snow Water Equivalent", x = "Month", y = "Snow Water Equivalent (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
ggsave("output/mean_daily_swe_ribbon_85_all.jpg", width = 6, height = 10)

