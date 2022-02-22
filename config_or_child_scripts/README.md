# Demo based on HMS520-Final-Project

## Authors: Steph Zimsen, Rose Bender, Allie Eastus

## Summary

This is a working demo project based on the scripts in our HMS 520 Autumn quarter 2021 final project public repository. It is an intermediate step towards an R-markdown notebook version of the cleaning and validation checks.

## About

The code here demonstrates a working set of functions to clean and validate finished extraction datasets from "by hand" scientific-literature systematic review extractions. The set of scripts performs these key functions: 1) Check for missingness in user-defined columns 2) Check for duplicates, using user-defined expected groupings of unique observations 3) Apply user-specified custom validations 4) Write out a folder with diagnostic `.xlsx` and `.txt` files describing the checks that were applied and the results by row number.

The parent script, `save_report_dt.R` , takes in arguments and runs functions from the other child scripts. For the demo, the only two scripts you will need to touch are: 1) `config_dt.R` & 2) `save_report_dt.R` The rest are called by `save_report_dt.R` .

## First step: Setting up your config

The config script `config_dt.R` generates a list of all your input arguments that are fed into the parent script, as an RDS file `config.RDS`. Modify the arguments in `config_dt.R` to fit your use case.

Arguments:

-   `source_dir` \<- string; directory where your repository is located and from which you source your functions
-   `config_dir` \<- string; directory where you save `config.RDS`
-   `data_path` \<- string; full path to where you have your data, must be `.xlsx`
-   `output_root` \<- string; directory where you save your output diagnostic files. creates `output_dir`, a date-versioned folder in `output_root`
-   `vars_check` \<- character vector; vector of variable names that you want to check for missingness in `missing_check_dt.R`
-   `byvars` \<- character vector; vector of variable names which define what you expect to be a unique group in `duplicate_check_dt.R`
-   `validation_criteria` \<- character list; list of criteria used for custom validation in `validation_check_dt.R`

## Second step: Running the parent script

In the parent file, `save_report_dt.R`, you will need to update the `source_dir` and the `config_dir` to reflect your directories. All other inputs are read from `config.RDS`. The parent file runs the child scripts, and writes a set of diagnostic files to your output directory.

## The child scripts

The child scripts are launched from `save_report_dt.R` in this order: 1) `missing_check_dt.R` 2) `duplicate_check_dt.R` 3) `validation_check_dt.R` 4) `write_outputs_dt.R`

-   Their functions correspond to the numbered descriptions in the "about" section.

-   Additional information on inputs and outputs for each function is available in the function headers.

## Output

The check functions report which rows failed their check, or provide a message that no rows failed the check. Rows which failed check are reported in the console and in saved spreadsheets, organized by which test function, and by field or sets of fields (as appropriate). The directory where output is found was specified in the `config_dt.R` config file.
