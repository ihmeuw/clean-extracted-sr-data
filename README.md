# clean-extracted-sr-data

## What it is

Work to help clean, validate, and document datasets extracted from scientific literature during systematic reviews, as prep for upload to a research database.

Content first made available to support a presentation at [Evidence Synthesis & Meta-Analysis in R Conference 2022](https://esmarconf.github.io/ "https://esmarconf.github.io/"), Tuesday 2022 Feb 22: [Automating data-cleaning and documentation of extracted data using interactive R-markdown notebooks](https://twitter.com/eshackathon/status/1496092408156549122 "https://twitter.com/eshackathon/status/1496092408156549122").

## Main components

-   Prep an example dataset from publicly available data from a systematic review similar to my research team's typical (but unpublished) extracted dataset (`.Rmd` file)
-   Working code, as a demonstration, that runs checks for allowed values -- blanks, duplicates, or out-of-range values -- configurable for specific field names and logical validity tests (several `.R` files)
-   Work in progress on an interactive notebook to run the same tests but with easier user input, and more flexible and extensible output reporting (`.Rmd` file)

## Credit

The foundational `.R` code demonstrated in the presentation was written by

-   Rose Bender, IHME, UW Seattle
-   Allie Eastus, Health Metrics Sciences, UW Seattle
-   Steph Zimsen, IHME, UW Seattle

Steph Zimsen wrote the `.Rmd` code to generate an example dataset, and to make a notebook version of the foundational code.

The [Infectious Diseases Data Observatory](https://www.iddo.org/ "https://www.iddo.org/") published, and allowed sharing of, the raw systematic-review data used to form the example dataset.
