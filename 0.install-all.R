
# Permissions -------------------------------------------------------------

# Not sure when to do it
  # sudo chown emrys:emrys /usr/lib/R/library/ -R
  # sudo chown emrys:emrys /usr/share/R/doc/html/ -R

# INSTALL ALL -------------------------------------------------------------

  # Install all Ubuntu needed dependencies
  source("1.install_dependencies_ubuntu.R") # Will ask for sudo password
  
  # Load r.packages()
  source("2.install_all_packages_std.R")
  r.packages(install_phantomjs = FALSE, 
             install_latex = FALSE, 
             install_githubs = FALSE, 
             install_easystats_dependencies = FALSE)

  

# UPDATE packages --------------------------------------------------------
  
  # Especially after R update

  # Use all but one of the computer cores
  if (!require('parallel')) install.packages('parallel')
  options(Ncpus = parallel::detectCores() - 2)
  
  update.packages(ask = FALSE, checkBuilt = TRUE)

  
  
  

# Update R ----------------------------------------------------------------

  # sudo gedit /etc/apt/sources.list
  # deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/ #40 for 4.0.x
  
  

# ISSUES ------------------------------------------------------------------

# If issues updating Matrix package:
    
# sudo chown username:username /usr/lib/R/library/Matrix/ -R
  
  