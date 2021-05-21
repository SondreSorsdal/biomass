#open libraries
library(tidyverse)
library(readxl)
library(xrfr)
library(vegan)
library(RColorBrewer)
library(nlme)
library(reshape2)
library(cowplot)
library(ggpubr)
library(Rmisc)
library(egg)
library(grid)

# installed with tidyverse, but NOT loaded with library(tidyverse)
library(readxl) 
library(dplyr)
# import data
biomass <- "biomass2015.xls"

# find the names of the excel sheets
excel_sheets(path = biomass)



#import the desired sheet - imports the first by default
biomass_L <- read_excel(path = biomass, sheet = "Site L")
biomass_M <- read_excel(path = biomass, sheet = "Site M")
biomass_A <- read_excel(path = biomass, sheet = "Site A")
biomass_H <- read_excel(path = biomass, sheet = "Site H")

#find total biomass for each plot in each site
biomass_L_p <- select(biomass_L, plot, production)
biomass_L_p$plot <- factor(biomass_L_p$plot)
site_L <- biomass_L_p %>% 
  group_by(plot) %>% 
  summarise(production= sum(production, na.rm=TRUE))
biomass_M_p <- select(biomass_M, plot, production)
biomass_M_p$plot <- factor(biomass_M_p$plot)
site_M <- biomass_M_p %>% 
  group_by(plot) %>% 
  summarise(production= sum(production, na.rm=TRUE))
biomass_A_p <- select(biomass_A, plot, production)
biomass_A_p$plot <- factor(biomass_A_p$plot)
site_A <- biomass_A_p %>% 
  group_by(plot) %>% 
  summarise(production= sum(production, na.rm=TRUE))
biomass_H_p <- select(biomass_H, plot, production)
biomass_H_p$plot <- factor(biomass_H_p$plot)
site_H <-biomass_H_p %>% 
  group_by(plot) %>% 
  summarise(production= sum(production, na.rm=TRUE))

#individual plots for each site
pL <- # main= "Site L", xlab="Plot", ylab="Total biomass")
      ggplot(data=site_L, aes(x=)) + 
  geom_histogram()

pL
#combine plots 
par(mfrow=c(2,2))

