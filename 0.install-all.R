
# INSTALL ALL -------------------------------------------------------------

  # Install all Ubuntu needed dependencies
  source("1.install_dependencies_ubuntu.R") # Will ask for sudo password
  
  # Load r.packages()
  source("2.install_all_packages_std.R")
  r.packages(install_phantomjs = FALSE, 
             install_latex = FALSE, 
             install_githubs = FALSE)

  

# UPDATE packages --------------------------------------------------------
  
  # Especially after R update

  # Use all but one of the computer cores
  if (!require('parallel')) install.packages('parallel')
  options(Ncpus = parallel::detectCores() - 2)
  
  update.packages(ask = FALSE, checkBuilt = TRUE)

  
  
  

# Update R ----------------------------------------------------------------

  # sudo gedit /etc/apt/sources.list
  # deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/ #40 for 4.0.x
  
  
  