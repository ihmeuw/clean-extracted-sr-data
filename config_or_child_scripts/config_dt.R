###############################################################################
#' @ Script name: config_dt.R
#' @ Purpose: Script that saves a .RDS file of all custom inputs 
#' @ Inputs: all custom inputs
#' @ Outputs: .RDS file
#' @ Date: 2021-12
#' @ Notes: edited to run code demo for ESMARConf2022
###############################################################################
## Define code directory
source_dir <- paste0(getwd(), "/final_class_project_code/")

## Define data input directory and filepaths
data_path <- "sth_iddo_extraction_example_dataset.xlsx"

## Set output directory
output_root <- paste0(getwd(), "/output/")
output_dir <- paste0(output_root, Sys.Date(), "/")
dir.create(output_dir, recursive = TRUE)

## Custom inputs
# For missing_check
vars_check <- c("X_arm", "B0_country", "B2_species", "participants")
# For duplicate_check 
byvars <- c("X0_authors","X0_pubYear","X0_pubJournal","X_ID","X_cohort","X_arm")
# For validate_check
validation_criteria <- list('X_cohort %in% c("C01", "C02", "C03","C04","C05")',
                            'F0_ageMin < 19',
                            'E3_helminth != 1') 

saveRDS(list(source_dir = source_dir,
             output_dir = output_dir,
             data_path = data_path, 
             vars_check = vars_check,
             byvars = byvars,
             validation_criteria = validation_criteria),
        paste0(source_dir, "/config_dt.RDS")
        )

## END USER-DEFINED INPUT
