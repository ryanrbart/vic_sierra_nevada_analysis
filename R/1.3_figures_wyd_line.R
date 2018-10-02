# Line Plots

source("R/0_utilities.R")
source("R/1.2_data_processing_combined.R")

# ---------------------------------------------------------------------
# Plot setup

etqswe_day_sub <- etqswe_day %>% 
  dplyr::filter(watershed %in% c("american","tuolumne",
                                 "kings","kern"))
etqswe_day_gcm_mean_sub <- etqswe_day_gcm_mean %>% 
  dplyr::filter(watershed %in% c("american","tuolumne",
                                 "kings","kern"))

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
etqswe_day_tmp <- etqswe_day_sub %>% 
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
x <- ggplot(data=etqswe_day_gcm_mean_sub) +
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
etqswe_day_tmp <- etqswe_day_sub %>% 
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
x <- ggplot(data=etqswe_day_gcm_mean_sub) +
  geom_line(aes(x=wyd, y=ET, color=scenario)) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","4.5","8.5")) +
  labs(title = "Mean Daily ET", x = "Wateryear Day", y = "ET (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
#ggsave("output/mean_daily_et.jpg", width = 6, height = 5)


