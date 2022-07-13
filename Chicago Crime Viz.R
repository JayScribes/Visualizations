Chicago.Crime.Distribution <- Chicago_Crime %>% 
  ggplot(aes(longitude, latitude, z = (unique(unique_key))))+
  stat_summary_hex(alpha = 0.8, bins = 120) +
  scale_fill_viridis_c(name ="Tot. Count")+
  coord_cartesian(xlim = c(-88, -87.5), ylim = c(41.5, 42.25)) +
  theme_classic() + labs(title = "Distribution of Crimes in Chicago (2001-2022)") +
  theme(legend.text=element_text(size=6))+theme(legend.key.size = unit(0.4, 'cm'))+
  theme(plot.title=element_text(hjust=0.5)) + theme(legend.position = c(.9,.9)) +
  theme(plot.title=element_text(size=15))