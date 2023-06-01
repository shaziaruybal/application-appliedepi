## author: Shazia Ruybal-Pesántez

## COHORT WEEKLY REPORT (code sample) ####################################################################
## This script generates a summary report from the latest data download from Redcap  
##########################################################################################################
require(rmarkdown)
require(shiny)
require(knitr)
require(here)

# This sources the script to pull and curate the latest data pull from REDCap (this was done on a weekly basis)
source(here::here("code_sample", "01_update_weekly_data.R"))

# This would be run based on the latest data pull (for my code sample I have used dummy data)
rmarkdown::render(input = here::here("code_sample", "cohort-weekly-progress-report.Rmd"), # file path to template file - don't change
                  output_file = paste0("cohort-weekly-progress-report_", date_update), 
                  output_dir = here::here("code_sample", "reports"), # automatically saves all reports to the "reports" folder
                  params = list(date_update = date_update, # this is consistent with the latest data pull from Redcap 
                                latest_data = here::here("code_sample/data/", "cohort_data.rds")))

