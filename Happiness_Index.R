#Avi Jani
#Global terrorism

#Installing packages and loading libraries
install.packages("tidyr")
install.packages("dplyr")
install.packages("rworldmap")
library(ggplot2)
library(rworldmap)
library(dplyr)
library(corrplot)

library(readr)
terrorism<-read.csv("C:\\Users\\avija\\Downloads\\archive\\globalterrorismdb_0617dist.csv")
Happiness <- read.csv("C:\\Users\\avija\\Downloads\\2015.csv")
View(terrorism)
View(Happiness)

#part 1
terrorism<-terrorism[terrorism$iyear=="2015",]
colnames(terrorism)[9] <- "Country"
Happiness$Country <- as.character(Happiness$Country)
terrorism$Country<- as.character(terrorism$Country)
Happiness <-Happiness[which(!is.na(Happiness$Country)),]
correction<-c("Congo (Brazzaville)"="Democratic Republic of the Congo","Congo (Kinshasa)"="Republic of Congo","United States"="USA","United Kingdom"= "UK")
for(i in names(correction)){
  Happiness[Happiness$Country==i,"Country"]<-correction[i]
}


q<-map_data("world")
colnames(q)[5] <- "Country"
df<- left_join(q,Happiness)

Bombing<- terrorism[terrorism$attacktype1==3,]
target_citizen<- terrorism[terrorism$targsubtype1==75|terrorism$targsubtype1==67,] ##  Unnamed Civilian/Unspecified  or Village/City/Town/Suburb 

ggplot()  +
  geom_polygon( aes(x = df$long, y = df$lat, group = df$group,fill= df$Happiness.Score)) + 
  coord_equal() +scale_fill_gradient(breaks=c(3,5,7,9)) +
  geom_point(aes(target_citizen$longitude,target_citizen$latitude,shape="."))+
  ggtitle("Happiness score vs Number of terror attacks on civilians (2015)")+
  xlab("") + ylab("") + guides(shape=FALSE) + labs(fill="Happiness Score")

##Part 2
corr_data<-Happiness %>% left_join(terrorism) %>% 
  group_by(Country,Happiness.Score,Economy..GDP.per.Capita.,Family,Health..Life.Expectancy.,Freedom,Trust..Government.Corruption.,Generosity,Dystopia.Residual) %>% 
  summarise(Terror_attack = length(eventid))

corrplot(cor(corr_data[,3:10]))

##Part 3
Happiness %>% left_join(terrorism) %>% group_by(Country,Happiness.Rank) %>%
  summarise(Terror_attack = length(eventid)) %>% ggplot()+ aes(Happiness.Rank,Terror_attack) + 
  geom_smooth(method = "loess") +
  ggtitle("Happiness Rank vs Terror attacks") + ylab("No. of Terror Attacks")

##Part 4
Happiness %>% left_join(terrorism) %>% group_by(Country,Freedom) %>%
  summarise(Terror_attack = length(eventid)) %>% ggplot()+ aes(Freedom,Terror_attack) + 
  geom_smooth(method = "loess") +
  ggtitle(" Sense of Freedom vs Terror attacks") + ylab("No. of Terror Attacks")

##Part 5
Happiness %>% left_join(terrorism) %>% group_by(Country,Dystopia.Residual) %>% 
  summarise(Terror_attack = length(eventid)) %>% ggplot() +aes(Dystopia.Residual,Terror_attack) +geom_smooth(size=1.5,color="red")+
  xlab("Dystopia and Residual") + ylab(" No. of Terror Attacks")+ ggtitle("Dystopia and Terrorism!")

##Part 6
Happiness %>% left_join(terrorism) %>% group_by(Happiness.Rank) %>% 
  summarise(Terror_attack = length(eventid)) %>% ggplot(aes(Happiness.Rank,Terror_attack)) +
  geom_bar(stat="identity", fill = "#FF6666")


