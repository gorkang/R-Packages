
# SET MANUAL PATH TO LIBRARIES ---------------------------------------------------

# https://stackoverflow.com/questions/15170399/change-r-default-library-path-using-libpaths-in-rprofile-site-fails-to-work

  # DO ONCE PER COMPUTER 
  # r_version = R.version
  # r_version_complete = paste0(r_version$major, ".", gsub("([0-9])\\..*", "\\1", r_version$minor))
  # final_folder = paste0("~/gorkang@gmail.com/R/", r_version_complete)
  # 
  # system("touch ~/.Renviron")
  # system(paste0('echo "R_LIBS_USER=', final_folder, '" >> ~/.Renviron'))
  


  #
  # .libPaths()
  # .libPaths( c( "~/gorkang@gmail.com/R" , .libPaths() ) )



# INSTALL ALL -------------------------------------------------------------

source("1.install_dependencies_ubuntu.R")
# source("2.install_all_packages_p_load.R")
source("2.install_all_packages_std.R")


# UPDATE all packages (especially after R update)
update.packages(ask = FALSE, checkBuilt = TRUE)



# mailR -------------------------------------------------------------------

  # PUT following two jars into the folder: system.file("java", package = "mailR")
  #   https://mvnrepository.com/artifact/javax.activation/javax.activation-api/1.2.0
  #   https://mvnrepository.com/artifact/com.sun.activation/javax.activation/1.2.0
  
  # MAYBE? sudo apt install openjdk-8-jdk openjdk-8-jre 

# remotes::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"))

