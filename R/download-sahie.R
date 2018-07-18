library(tidyverse)

# This script is meant to retrieve the SAHIE estimates from the census website
# in a reproduceable fashion. Each SAHIE file contains county-level estimates for
# the number of individuals lacking insurance coverage, organized across
# sex, race, and income level-- thus, counties are duplicated 96 (?) times in
# each file. Estimates are available from 2008 to 2016, although some variable
# levels are not used/found in each year. Refer to the file layout for further
# detail.

# download the file layout
download.file(
  url = "https://www2.census.gov/programs-surveys/sahie/technical-documentation/file-layouts/sahie-file-layout-2008-2016.pdf",
  destfile = ""
)

# download each SAIHE file, and save to data/
# each year is saved as a zipped CSV; they can be read in directly once gathered
walk(
  2008:2016,
  ~download.file(
    url = str_glue("https://www2.census.gov/programs-surveys/sahie/datasets/time-series/estimates-acs/sahie-{.x}-csv.zip"),
    destfile = str_glue("data/sahie-{.x}-csv.zip")
  )
)
