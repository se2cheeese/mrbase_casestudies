# If you have not used the TwoSampleMR package before, please uncomment lines 4-6 to install ------

# install.packages("devtools")
# library(devtools)
# install_github("MRCIEU/TwoSampleMR")

# Load the TwoSampleMR package --------------------------------------------------------------------

library(TwoSampleMR)

# List the outcomes avaliable in MR-Base ----------------------------------------------------------

ao <- available_outcomes()

# Extract the instruments from the systolic blood pressure GWAS (ID: 'UKB-a:360') -----------------

exposure_dat <- extract_instruments(c('UKB-a:360'))

# Extract the outcome data on measures of coronary heart disease (ID: 7) --------------------------

outcome_dat <- extract_outcome_data(exposure_dat$SNP, c('7'), 
                                    proxies = 1, rsq = 0.8, align_alleles = 1, 
                                    palindromes = 1, maf_threshold = 0.3)

# Harmonize the exposure and outcome data ---------------------------------------------------------

dat <- harmonise_data(exposure_dat, outcome_dat, action = 2)

# Perform MR analysis -----------------------------------------------------------------------------

mr_results <- mr(dat)
