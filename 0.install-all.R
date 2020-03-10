
# INSTALL ALL -------------------------------------------------------------

# Install all ubundu needed dependencies
source("1.install_dependencies_ubuntu.R") # Will ask for sudo password

# Load r.packages()
source("2.install_all_packages_std.R")
r.packages(install_phantomjs = FALSE, install_latex = FALSE)


# UPDATE all packages (especially after R update) -------------------------

update.packages(ask = FALSE, checkBuilt = TRUE)
