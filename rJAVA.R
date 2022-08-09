# https://stackoverflow.com/questions/3311940/r-rjava-package-install-failing

# 20220902: Doing 1 + 3 worked

# 1) Install dependencies
sudo apt-get install default-jre
sudo apt-get install default-jdk
# sudo R CMD javareconf


# 2) put this in the .Rprofile under your home directory
# Sys.setenv(JAVA_HOME = '/usr/lib/jvm/jdk1.8.0_65') # this sets JAVA_HOME for R to correct java home dir. 

# 3) Install rJava
install.packages("rJava")
