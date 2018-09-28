# Data import and processsing - Kings

# All data is reprojected (if necessary) to lat/long

source("R/0_utilities.R")
source("R/1.1_data_processing_combined.R")

# ---------------------------------------------------------------------
# Plotting

shed_id <- c(
  `american` = "American",
  `tuolumne` = "Tuolumne",
  `kings` = "Kings",
  `kern` = "Kern"
)

# ----
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





# ----
# Test of area plot for ET

# Possibly need line graph with only deficit area highlighted.


x <- ggplot(data=etqswe_day_gcm_mean) +
  geom_area(aes(x=wyd, y=ET, fill=scenario), alpha = .7, position="identity") +
  geom_line(aes(x=wyd, y=ET, color=scenario)) +
  scale_fill_brewer(palette="Paired", name="Scenario", labels = c("Historical","4.5","8.5")) +
  scale_color_brewer(palette="Paired", name="Scenario", labels = c("Historical","4.5","8.5")) +
  labs(title = "Mean Daily ET", x = "Wateryear Day", y = "ET (mm)") +
  facet_grid(watershed~., labeller = as_labeller(shed_id)) +
  theme_bw(base_size = 13) +
  NULL
plot(x)
#ggsave("output/mean_daily_et.jpg", width = 6, height = 5)









