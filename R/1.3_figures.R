# Data import and processsing - Kings

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")
source("R/1.2_data_processing_combined.R")

# ---------------------------------------------------------------------
# Plot setup

shed_id <- c(
  `american` = "American",
  `tuolumne` = "Tuolumne",
  `kings` = "Kings",
  `kern` = "Kern"
)

# ---------------------------------------------------------------------
# Line plots

# Streamflow

# Individual GCM
etqswe_day_tmp <- etqswe_day %>% 
  # dplyr::filter(gcm == "canesm2")
  # dplyr::filter(gcm == "ccsm4")
  # dplyr::filter(gcm == "cnrm")
  dplyr::filter(gcm == "hadgemcc")
  # dplyr::filter(gcm == "hadgemec")
  # dplyr::filter(gcm == "miroc5")

x <- ggplot(data=etqswe_day_tmp) +
  geom_line(aes(x=wyd, y=Q, color=scenario)) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","4.5","8.5")) +
  labs(title = "Mean Daily Streamflow", x = "Wateryear Day", y = "Streamflow (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
#ggsave("output/mean_daily_streamflow.jpg", width = 6, height = 5)


# Average of all GCMs
x <- ggplot(data=etqswe_day_gcm_mean) +
  geom_line(aes(x=wyd, y=Q, color=scenario)) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","4.5","8.5")) +
  labs(title = "Mean Daily Streamflow", x = "Wateryear Day", y = "Streamflow (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
#ggsave("output/mean_daily_streamflow.jpg", width = 6, height = 5)


# ----
# ET

# Individual GCM
etqswe_day_tmp <- etqswe_day %>% 
  # dplyr::filter(gcm == "canesm2")
  # dplyr::filter(gcm == "ccsm4")
  # dplyr::filter(gcm == "cnrm")
  dplyr::filter(gcm == "hadgemcc")
  # dplyr::filter(gcm == "hadgemec")
  # dplyr::filter(gcm == "miroc5")

x <- ggplot(data=etqswe_day_tmp) +
  geom_line(aes(x=wyd, y=ET, color=scenario)) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","4.5","8.5")) +
  labs(title = "Mean Daily ET", x = "Wateryear Day", y = "ET (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
#ggsave("output/mean_daily_et.jpg", width = 6, height = 5)


# Average of all GCMs
x <- ggplot(data=etqswe_day_gcm_mean) +
  geom_line(aes(x=wyd, y=ET, color=scenario)) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","4.5","8.5")) +
  labs(title = "Mean Daily ET", x = "Wateryear Day", y = "ET (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
#ggsave("output/mean_daily_et.jpg", width = 6, height = 5)



# ---------------------------------------------------------------------
# Ribbon plots

# Generate dataframe for ribbon
# For geom_ribbon, need ymin and ymax to be different columns
df_et_ribbon <- etqswe_day_gcm_mean %>% 
  dplyr::filter(scenario != 45) %>% 
  dplyr::select(-c(Q,SWE)) %>%   
  spread(key=scenario, value=ET) %>% 
  dplyr::filter(hist > `85`, wyd>200)

# Generate dataframe for ribbon
# For geom_ribbon, need ymin and ymax to be different columns
df_q_ribbon <- etqswe_day_gcm_mean %>% 
  dplyr::filter(scenario != 45) %>% 
  dplyr::select(-c(ET,SWE)) %>%   
  spread(key=scenario, value=Q) %>% 
  dplyr::filter(hist > `85`, wyd>100)

# Generate dataframe for ribbon
# For geom_ribbon, need ymin and ymax to be different columns
df_swe_ribbon <- etqswe_day_gcm_mean %>% 
  dplyr::filter(scenario != 45) %>% 
  dplyr::select(-c(ET,Q)) %>%   
  spread(key=scenario, value=SWE) %>% 
  dplyr::filter(hist > `85`, wyd>0)

# Generate dataframe for lines
df_line <- etqswe_day_gcm_mean %>% 
  dplyr::filter(scenario != 45)


# ET
x <- ggplot() +
  geom_ribbon(data=df_et_ribbon, aes(x=wyd, ymin=`85`, ymax=hist), fill="red") +
  geom_line(data=df_line, aes(x=wyd, y=ET, color=scenario)) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","8.5")) +
  labs(title = "Mean Daily ET", x = "Wateryear Day", y = "ET (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
#ggsave("output/mean_daily_et.jpg", width = 6, height = 5)


# Q
x <- ggplot() +
  geom_ribbon(data=df_q_ribbon, aes(x=wyd, ymin=`85`, ymax=hist), fill="red") +
  geom_line(data=df_line, aes(x=wyd, y=Q, color=scenario)) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","8.5")) +
  labs(title = "Mean Daily Streamflow", x = "Wateryear Day", y = "Streamflow (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
#ggsave("output/mean_daily_q.jpg", width = 6, height = 5)


# SWE
x <- ggplot() +
  geom_ribbon(data=df_swe_ribbon, aes(x=wyd, ymin=`85`, ymax=hist), fill="red") +
  geom_line(data=df_line, aes(x=wyd, y=SWE, color=scenario)) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","8.5")) +
  labs(title = "Mean Daily Snow Water Equivalent", x = "Wateryear Day", y = "Snow Water Equivalent (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
#ggsave("output/mean_daily_swe.jpg", width = 6, height = 5)




