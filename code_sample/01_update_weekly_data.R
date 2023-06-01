## author: Shazia Ruybal-Pesántez

# This is a script to illustrate the framework for updating the data weekly from the most recent REDCap data pull

library(here)
library(readxl)

# Functions to pull data from REDCap
source(here::here("scripts", "REDCap_export.R"))

# Functions to wrangle the latest data pull 
source(here::here("scripts", "process_weekly_data_functions.R"))

# Census data used to match cohort participants to their household 
census <- read_xlsx("census_data.xlsx", sheet = 1)

# Enrolment groups used to cross-check cohort participants
enrol_grp <- readRDS(here::here("data", "participant_enrollment_groups.rds"))

date_update <- Sys.Date()

# This uses the custom function to pull and curate the latest data from REDCap - this was done on a weekly basis
getWeeklyData(cohort, census, enrol_grp, date_update)
