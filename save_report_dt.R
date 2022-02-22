################################################################################
#' @ Function name: save_report_dt.R
#' @ Purpose: Parent script
#'  Run check functions for errors/missing data and other problems in the data set; split dataset into specific bundle subsets.
#'  Create output folder with reports showing what was done.
#' @ Inputs: two CSVs with script configuration. see .README for more information
#' check_args: csv with fields that define how to apply checks 
#' split_args: csv with fields that define how to split the data into bundles or subsets
#' @ Outputs: a folder in the specified output directory with .xlsx and .txt files showing results of data checks
#' @ Date: 2021-12
#' @ Notes: edited to run code demo for ESMARConf2022
################################################################################
## Define code directories
## User must update these two aliases:
##   Give `source_dir` where the functions are saved
##   Give `config_dir` where the RDS file of arguments is saved
source_dir <- paste0(getwd(), '/final_class_project_code/')
config_dir <- paste0(getwd(), '/final_class_project_code/')

## User just runs the rest of the script from here:

## Source functions
functions <- c("missing_check_dt.R", "duplicate_check_dt.R", 
               "validate_check_dt.R", "write_outputs_dt.R")
invisible(sapply(paste0(source_dir, functions), source))

## Load packages
pacman::p_load(data.table, openxlsx, readr, knitr, rmarkdown)

## Read custom input config
check_args <- readRDS(paste0(config_dir, "config_dt.RDS"))

## Load data
dt <- as.data.table(read.xlsx(check_args$data_path))

## END INPUTS

## Run all checks
list_of_outputs <- list()
list_of_outputs[["missing_list"]] <- missing_check(dt, check_args$vars_check)
list_of_outputs[["duplicate_list"]] <- duplicate_check(dt, check_args$byvars)
list_of_outputs[["validation_list"]] <- validation_check(dt,
                                              check_args$validation_criteria)

## Write out the results of the checks
invisible(mapply(write_outputs, list_of_outputs, names(list_of_outputs), MoreArgs = list(output_dir = check_args$output_dir)))
print(paste("Outputs are saved to", check_args$output_dir))

## END
