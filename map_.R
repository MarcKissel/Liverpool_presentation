#map

library(leaflet)
library(rgdal)

my_data <- read_csv("siteListCSV_updated2.csv")
my_data <- my_data %>% janitor::clean_names() %>% 
  mutate(age_range = as_factor(age_range))
pal <- colorFactor(palette = "Reds", domain = my_data$age_range)
pal2 <- colorFactor(topo.colors(5), domain = my_data$age_range)


leaflet(data = my_data) %>% addTiles() %>%
  addCircleMarkers(~longitude , ~latitude, color = ~pal2(age_range), popup = ~paste("Name: ", sitename,
                                                                                    "<br>",
                                                                                    "age of Site: ", age_range), label = ~as.character(sitename))
                                                                             