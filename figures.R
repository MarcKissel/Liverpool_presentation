war <- read_csv("PopSizeTemp.csv") ##### or temp file?
DCI <- read_csv("X_Factor_Dataset.csv")
DCI_interact <-  DCI %>% gather(value = X, key = country, Belgium:Iraq)
DCI_summary <- DCI_interact %>% 
  group_by(country) %>%
  summarise(DCI_mean = mean(X, na.rm = TRUE), 
            DCI_sd = sd(X, na.rm = TRUE))


plot_Fig1a1 <- ggplot() + 
  geom_point(data = war, aes(x= log(Population), y = log(Overall_War_Group_Size_W), color = Time_Type, text = paste("Society: ", Society) ))+ 
  geom_smooth(data = war, aes(x= log(Population), y = log(Overall_War_Group_Size_W), group=1),method="lm") + 
  geom_point(data= war, aes(x= log(Population), y = log(W.P), color = Time_Type, text = paste("Society: ", Society))) + 
  geom_smooth(data = war, aes(x= log(Population), y = log(W.P), group=1),method="lm") +
  theme(legend.position='none')

plot_Fig1a2 <- ggplot() + 
  geom_point(data = war, aes(x= Population, y = Overall_War_Group_Size_W, color = Time_Type, text = paste("Society: ", Society) ))+ 
  geom_smooth(data = war, aes(x= Population, y = Overall_War_Group_Size_W, group=1),method="lm") +
  theme(legend.position='none') + labs(y = "overall war group size", x = "population size") + 
  scale_x_log10(label = scales::comma) + scale_y_log10(label = scales::comma)


plot_Fig1a3 <- ggplot() + 
  geom_point(data= war, aes(x= Population, y = W.P, color = Time_Type, text = paste("Society: ", Society))) + 
  geom_smooth(data = war, aes(x= Population, y = W.P, group=1),method="lm") +
  theme(legend.position='none') + labs(y = "overall war group size", x = "population size") + 
  scale_x_log10(label = scales::comma) + scale_y_log10(label = scales::comma)


ggplotly(plot_Fig1a1, height = 500, width = 850)
ggplotly(plot_Fig1a2, height = 500, width = 850)
