library(tidyverse)
setwd("/Users/triskos/Desktop/331/Working folder/Gpisum Rproj/Gpisum Rproj/data/")

surface_area_function<- function() {
masses_sa<-read_csv("all-samples-data.csv")
ec_sa<-read_csv("ec-surface-area.csv")
ms_sa<-read_csv("ms-surface-area.csv")

msstats_sa<-ms_sa %>% 
  group_by(sample,leaf) %>% 
  summarise(main_stem_width = (main_stem_width_one+main_stem_width_two)/2,
            shoot_len = (len_shoot1 + len_shoot2 +
                          len_shoot3 +len_shoot4 +
                          len_shoot5 )/5,
            shoot_wid = (wid_shoot1 + wid_shoot2 +
                          wid_shoot3 +wid_shoot4 +
                          wid_shoot5 )/5,
            leafstem_len = leaf_cent_stem_length,
            leafstem_wid = leaf_cent_stem_width,
            num_sideshoots = num_sideshoots)

msstats_sa<-msstats_sa %>% 
  group_by(sample) %>% 
  summarise(main_stem_width = mean(main_stem_width),
            leafstem_len = mean(leafstem_len),
            leafstem_wid = mean(leafstem_wid),
            shoot_len = mean(shoot_len),
            shoot_wid = mean(shoot_wid),
            num_sideshoots = mean(num_sideshoots))



ecstats_sa<-ec_sa %>% 
  group_by(sample) %>% 
  summarise(stem = (stem_one + stem_two)/2,
            leaf = (Leaf_1 + Leaf_2 +
                      Leaf_3 + Leaf_4 +
                      Leaf_5 )/5)
ec_calc<-left_join(ecstats_sa,masses_sa,by = "sample")
ms_calc<-left_join(msstats_sa,masses_sa,by = "sample")
remove(ec_sa,ms_sa,msstats_sa,ecstats_sa,masses_sa)

#calculating SA:mass


ec_surfmass<-ec_calc %>%
  group_by(sample) %>% 
  summarise(sa_mass = ((leaf*2*num_leaves) + (main_stem_length*stem*3.1416)) / mass) # leaf SA + stem SA



ms_surfmass<-ms_calc %>% 
  group_by(sample) %>% 
  summarise(
    sa_mass = (((((shoot_len*shoot_wid*3.1416*num_sideshoots)+      # add shoots from leaf central stalk
                 (leafstem_len*leafstem_wid*3.1416))*num_leaves)+              # add center stalk of leaf
                 (main_stem_width*3.1416*main_stem_length)) / mass # add stem then divided by mass
        ))
  

surfmass<-bind_rows(ms_surfmass,ec_surfmass) %>% 
  mutate(sample = as.factor(sample)) %>% 
  mutate(species = sample)
surfmass$species<-gsub('.{1}$', '', surfmass$species)
return(surfmass)
}

surfmass<-surface_area_function()
rm(surface_area_function)

# t test for differences in SA:mass ratios
with(surfmass,t.test(sa_mass~species))
tapply(surfmass$sa_mass, surfmass$species, sd)

# differences in G. pisum in 2019 samples
sa_gpisum<-read_csv("all-samples-data.csv")
sa_gpisum$sample<-gsub('.{1}$', '', sa_gpisum$sample)

tapply(sa_gpisum$gpisum_mass, sa_gpisum$sample, mean)
tapply(sa_gpisum$gpisum_mass, sa_gpisum$sample, sd)

