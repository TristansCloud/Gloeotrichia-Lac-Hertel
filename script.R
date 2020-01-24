library(tidyverse)
library(emmeans)
library(car)


setwd("/Users/triskos/Desktop/331/Working folder/Gpisum Rproj/Gpisum Rproj/")

sites<- read.csv("data/site-data.csv")

# site statistics

site_mean<-sites %>% 
  group_by(Depth) %>% 
  summarise(mean = mean(Depth..m.),
            sd = sd(Depth..m.))

Gpisum_data <- read_csv("data/gpisum-data.csv", 
                        col_types = cols(mac_height_cm = col_number(), 
                         sample = col_factor(levels = c("1", 
                          "2", "3")))) %>% 
                  filter(!is.na(gpisum_per_gmac)) %>% 
                  filter(species != "Ceratophyllum demersum")


# models

fullmodel<-glm(gpisum_per_gmac~depth*species_code*site,
              data = Gpisum_data, family = "quasipoisson",na.action = "na.fail")
nointeraction<-glm(gpisum_per_gmac~depth+species_code+site+
                depth:species_code+species_code:site+site:depth,
              data = Gpisum_data,family = "quasipoisson",na.action = "na.fail")
null_model = glm(gpisum_per_gmac ~ 1, data = Gpisum_data,family = "quasipoisson")


#Type III anova and model coefficients

Anova(fullmodel, type = "3",test.statistic = "F") # 3 way interaction is not significant
Anova(nointeraction, type = "3",test.statistic = "F")
Anova(nointeraction, type = "3")

anova(null_model,fullmodel,test="Chisq")
anova(null_model,nointeraction,test="Chisq")
anova(nointeraction,fullmodel,test="Chisq") # full model not better than reduced model

# Estimated marginal means

species.emm <- emmeans(nointeraction,pairwise ~ species_code)
pairs(species.emm, adjust = "Tukey")

depth.emm <- emmeans(nointeraction,pairwise ~ depth)
pairs(depth.emm, adjust = "Tukey")

depth.site.emm <- emmeans(nointeraction,pairwise ~ depth | site)
pairs(depth.site.emm, adjust = "Tukey")

site.depth.emm <- emmeans(nointeraction,pairwise ~ site | depth)
pairs(site.depth.emm, adjust = "Tukey")

site.species.depth.emm <- emmeans(nointeraction,pairwise ~  site | species_code | depth)
pairs(site.species.depth.emm, adjust = "Tukey")


# C. demersum
Allspecies <- read_csv("data/gpisum-data.csv", 
                        col_types = cols(mac_height_cm = col_number(), 
                        sample = col_factor(levels = c("1","2", "3")))) %>% 
                        filter(!is.na(gpisum_per_gmac))


model.allsp<-glm(gpisum_per_gmac~species_code,family = "quasipoisson",data = Allspecies)
Anova(model.allsp, type = "3")

allsp.emm <- emmeans(model.allsp,pairwise ~ species_code)
pairs(allsp.emm)

#means and standard deviations of mass:mass
tapply(Allspecies$gpisum_per_gmac,Allspecies$species_code,mean)
tapply(Allspecies$gpisum_per_gmac,Allspecies$species_code,sd)
