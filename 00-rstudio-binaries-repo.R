# Using the Rstudio binary packages for linux saves A LOT of time
# https://www.rstudio.com/blog/publishing-your-own-binary-packages-with-rspm-2022-07/

# 1) GET repo link
  # Open packagemanager.rstudio.com in your favorite web browser.
    # Click Get Started.
    # Click on Source in the upper right corner of the page and select your Linux distribution from the dropdown.
    # Click the Setup button from the top menu and follow the instructions to reconfigure R (or RStudio) to use PPM as your CRAN repository.


# 2) Change repo in RStudio:
    options(repos = c(CRAN = "https://packagemanager.posit.co/all/__linux__/jammy/latest"))
  # OR manually Tools -> GlobalOptions -> Packages
    
  # OLD ONE: 
    options(repos = c(CRAN = "https://cran.rstudio.com"))
  
  # CHECK Which one is the repo used?
    getOption("repos")

  # If repo does not change, go to file and comment out (NEED sudo)
    #local({
    #    r <- getOption("repos")
    #    r["CRAN"] <- "https://cloud.r-project.org"
    #    options(repos = r)
    #})
  # rstudioapi::navigateToFile("/usr/lib/R/etc/Rprofile.site")
  system("sudo gedit /usr/lib/R/etc/Rprofile.site")
  
  
# 3) Install all dependencies? Or just ignore and go with our own "1.install_dependencies_ubuntu.R"

  # https://packagemanager.rstudio.com/client/#/repos/1/overview
  # Copy Install System Prerequisites to file to get unique dependencies
  XXX = readLines("dev/dependencies.txt")
  unique_dependencies = unique(XXX)[!grepl("#", unique(XXX))]



# Get all options
# options()$repos
# tibble::tibble(options = names(options()), options())