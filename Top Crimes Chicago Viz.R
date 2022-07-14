library(tidyverse)
library(ggthemes)
library(extrafont)
library(gganimate)
library(gifski)
library(png)
options(scipen=999)
library(lubridate)


Chicago_Crime0122$date <- as.Date(Chicago_Crime0122$date)
Chicago_Crime0122$count <- c(1)
Chicago_Crime0122$year_week <- floor_date(Chicago_Crime0122$date, "month")

Chicago_Crime_month <- Chicago_Crime0122 %>% 
  group_by(year_week, crime) %>% 
  dplyr::summarize(crime_week = sum(count)) %>% 
  as.data.frame()

graph2 <- Chicago_Crime_month %>% 
  filter(crime == "BATTERY" | crime == "THEFT" |crime == "CRIMINAL DAMAGE" | crime == "NARCOTICS") %>% 
  ggplot(aes(x=year_week, y=crime_week, color=crime))+
  geom_point(alpha=0.5, stroke = 0, size=2.5) + theme_classic() +
  labs(x="Date",y="Avg. Monthly Count" ,caption="*Data from Chicago Crime Dataset. n= 7,498,737",title ="Top 4 Crimes in Chicago (2001-2022)") +
  theme(legend.position = c(.9,.9)) +theme(plot.title=element_text(hjust=0.5)) +   theme(legend.title=element_blank()) +
  theme(legend.text=element_text(size=7)) +theme(axis.title = element_text(), text = element_text(family = "Rubik"))

graph1.animation2 = graph2 +
  transition_time(year_week) + shadow_mark(past = TRUE) +
  labs(subtitle = "Year: {frame_time}") 

animate(graph1.animation2, height = 500, width = 800, fps = 30, duration = 10, end_pause = 60, res = 100)