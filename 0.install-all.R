
# Permissions -------------------------------------------------------------

# When there are packages installed as root, and start getting errors such as:
# "namespace ‘package’ x.x.x is already loaded, but >= y.y.y is required"

# .libPaths() # Folders where libraries are installed
  # sudo chown emrys:emrys /usr/lib/R/library/ * -R
  # sudo chown emrys:emrys /usr/local/lib/R/site-library * -R
  # sudo chown emrys:emrys /usr/share/R/doc/html/ * -R

  # UNSAFE VERSION: sudo chmod -R 0777 '/usr/lib/R/library'

# If still getting issues when installing packages depending on eachother, e.g. rlang, and vctrs:
  # - install from source
  # - renv::install("nameOfPackage")


# INSTALL ALL -------------------------------------------------------------

  # Install all Ubuntu needed dependencies
  source("1.install_dependencies_ubuntu.R") # Will ask for sudo password
  
  # Load r.packages()
  # pak::pak_cleanup()
  source("2.install_all_packages_std.R")
  r.packages(install_phantomjs = FALSE, 
             install_latex = FALSE, 
             install_githubs = FALSE, 
             install_easystats_dependencies = FALSE)

  # sudo apt install ttf-mscorefonts-installer
  

# UPDATE packages --------------------------------------------------------
  
  # Especially after R update

  # Use all but one of the computer cores
  if (!require('parallel')) install.packages('parallel')
  options(Ncpus = parallel::detectCores() - 2)
  
  update.packages(ask = FALSE, checkBuilt = TRUE)

  
  
  

# Update R ----------------------------------------------------------------

  # sudo gedit /etc/apt/sources.list
  # deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/ #40 for 4.0.x
  
  # update indices
  sudo apt update -qq
  # install two helper packages we need
  sudo apt install --no-install-recommends software-properties-common dirmngr
  # add the signing key (by Michael Rutter) for these repos
  wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
  # add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
  sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
  
  

# ISSUES ------------------------------------------------------------------

# If issues updating Matrix package:
    
# sudo chown username:username /usr/lib/R/library/Matrix/ -R
  
  