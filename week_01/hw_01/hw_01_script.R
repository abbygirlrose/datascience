#load packages
library(tidyverse)
library(dplyr)
library(ggplot2)

#set wd -> didn't actually have to do this because I worked in a markdown
setwd("/Users/AbigailBergman/Desktop/Grad School/Winter Quarter 2019/Data Science/datascience_repo/week_01/hw_01")

#import data
bicycle <- read.csv("Bicycle.csv")

#Risk taking scores
helmet <- bicycle %>%
  filter(Condition ==1)

hat <- bicycle %>%
  filter(Condition == 2)

#overall descriptive stats
mean(bicycle$BART)
mean(bicycle$SSS_total)

#BART
mean(helmet$BART)
sd(helmet$BART)

mean(hat$BART)  
sd(hat$BART)

#independent t test (not Welch's)
t.test(helmet$BART, hat$BART, var.equal = TRUE)

#SSS
mean(helmet$SSS_total)
sd(helmet$SSS_total)

mean(hat$SSS_total)
sd(hat$SSS_total)

#independent t test
t.test(helmet$SSS_total, hat$SSS_total)

#gender
male <- bicycle %>%
  filter(Sex ==1)

female <- bicycle %>%
  filter(Sex == 2)

mean(male$BART)
sd(male$BART)

mean(female$BART)  
sd(female$BART)

#independent t test (not Welch's)
t.test(male$BART, female$BART, var.equal = TRUE)

#rename Condition
bicycle <- bicycle%>%
  mutate(Condition = factor(Condition, levels=(c(1,2)), labels=(c("Helmet", "Cap")))) 

#BART graphs (part a)
ggplot(hat, aes(BART)) +
  geom_density(fill="green", alpha = .5)+
  geom_rug() +
  labs(title = "a", subtitle = "Cap", x = "BART score", y = "")+
  geom_vline(aes(xintercept=mean(hat$BART)))+
  geom_vline(aes(xintercept=35.6165), linetype ="dashed")+
  ylim(c(0,.06))+xlim(c(-20,100))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.y=element_blank())

ggplot(helmet, aes(BART)) +
  geom_density(fill="green", alpha=.5)+
  geom_rug()+
  geom_vline(aes(xintercept=mean(helmet$BART)))+
  labs(title = "a", subtitle = "Helmet", x = "Score", y = "")+
  geom_vline(aes(xintercept=35.6165), linetype="dashed")+
  ylim(c(0,.06))+xlim(c(-20,100))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.y=element_blank())

#SSS graphs (part b)

ggplot(hat, aes(SSS_total)) +
  geom_density(fill="green", alpha = .5)+
  geom_rug() +
  labs(title ="b", subtitle=  "Cap", x = "SSS score", y = "")+
  ylim(c(0,.1))+xlim(c(0,40))+
  geom_vline(aes(xintercept=mean(hat$SSS_total)))+
  geom_vline(aes(xintercept=20.95), linetype = "dashed")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.y=element_blank())

ggplot(helmet, aes(SSS_total)) +
  geom_density(fill="green", alpha=.5)+
  geom_rug()+
  labs(title ="b", subtitle =  "Helmet", x = "SSS score", y = "") +
  ylim(c(0,.1))+xlim(c(0,50))+
  geom_vline(aes(xintercept=mean(helmet$SSS_total)))+
  geom_vline(aes(xintercept=20.95), linetype="dashed")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.y=element_blank()) 