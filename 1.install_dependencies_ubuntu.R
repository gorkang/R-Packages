# Dependencias UBUNTU -----------------------------------------------------

  # pandoc-citeproc # Render bookdown via terminal?
  # libxml2-dev # Para instalar XLConnect
  # r-base-dev default-jdk # Para instalar rJava (dependencia de XLConnect t de mailR) #r-cran-rjava 
  # libcurl4-gnutls-dev # RCurl
  # libgsl0-dev # gsl (dependencia de MBESS y apaTables)
  # libssl-dev # openssl (dependencia de scholar)
  # libcairo2-dev # cairo (dependencia de svglite)
  # libgsl-dev # ??? MBESS
  # texlive-xetex # Para usar rmarkdown, bookdown, etc.
  # git # RStudio git
  # libudunits2-dev # ggraph
  # libmagick++-dev # magick
  # libsqlite3-dev #RSQLite
  # libsecret-1-dev #keyring
  # libsodium-dev #keyring dependency
  # libtesseract-dev libleptonica-dev tesseract-ocr-eng # tesseract
  # ssh-askpass-gnome ssh-askpass # git pull from Rstudio
  # libarchive-dev # jimhester/archive
  # texinfo # Avoid WARNING when building packages
  # libssh2-1 libssh2-1-dev : build R packages
if (!require('rstudioapi')) install.packages('rstudioapi'); library('rstudioapi')

# INSTALAR Dependencias
command_to_execute = "sudo -kS apt-get -y install docker.io pandoc pandoc-citeproc libxml2-dev r-base-dev default-jdk libcurl4-gnutls-dev libgfortran4 libgsl0-dev libssl-dev libv8-dev libcairo2-dev git libudunits2-dev libmagick++-dev libpoppler-cpp-dev libsecret-1-dev libsodium-dev libtesseract-dev libudunits2-dev libleptonica-dev tesseract-ocr-eng ssh-askpass-gnome ssh-askpass libarchive-dev texinfo libnode-dev libssh2-1 libssh2-1-dev libgit2-dev libzmq3-dev libfribidi-dev xsel"
system(command_to_execute, input = rstudioapi::askForPassword("sudo password"))


# Poppler -----------------------------------------------------------------

# sudo add-apt-repository -y ppa:cran/poppler
# sudo sudo apt-get install -y libpoppler-cpp-dev


# DOCKER ------------------------------------------------------------------

# IF docker does not work after installing (reboot afterwards): 
  # $ sudo usermod -aG docker $USER #Add your current user to docker group
  # $ newgrp - docker #Switch session to docker groupSwitch session to docker group
  # $ docker run hello-world #Run an example to test
