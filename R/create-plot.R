# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "SalmonGums"

scatter_plot = 
df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) + 
  geom_point(color = "red", size = 0.5, alpha = 0.2) +
  ggtitle(city) +
  labs(y = "Humidity 9am", x = "Temperature 9am") +
  geom_smooth(method = "lm", color = "black", se = FALSE) + 
  theme_classic()
  

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)
