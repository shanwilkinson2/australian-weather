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
    geom_smooth(method = "lm", color = "black", se = FALSE, linetype = "dashed", size = 0.5) + 
    theme_classic()
    
  
  # Save the plot in graphics/
  ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)

# bar plot
  bar_chart =
    df %>%
    group_by(Location) %>%
    summarise(average_rainfall = mean(Rainfall, na.rm = TRUE)) %>%

    ggplot(aes(y = Location, x = average_rainfall)) +
    geom_col(fill = "green")
  ggsave(filename = "graphics/barchart-avg-rainfall.png", plot = bar_chart)
  
  
  time_series =
    df %>%
    filter(Location == city) %>%
    ggplot(aes(x = Date, y = Temp9am)) +
    geom_line()
  ggsave(filename = "graphics/timeseries-rainfall.png",
         plot = time_series)