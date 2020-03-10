
r.packages <- function(list.of.packages=NA, install_phantomjs = FALSE, install_latex = TRUE) {

  # Use all but one of the computer cores. See http://blog.jumpingrivers.com/posts/2017/speed_package_installation/
  if (!require('parallel')) install.packages('parallel')
  options(Ncpus = parallel::detectCores() - 2)
  
  # Si no se introduce ningun paquete, instala/carga todos
  if (length(list.of.packages) == 1 && is.na(list.of.packages) == T) {

    #Instala librerias usadas habitualmente
    
    list.of.packages <-
      c("Rmisc", 
        "afex", "anytime", "apaTables",
        "BayesFactor", "beanplot", "bitops", "bookdown", "brms",
        "compareDF", "corrplot",
        "daff", "DataExplorer", "data.table", "devtools", "DiagrammeR", "doBy", "drake",
        "esvis", "Exact", "eyelinker",
        "FFTrees", "fitdistrplus", "findviews", "forcats", "formattable", "furrr",
        "ggalluvial", "ggcorrplot", "ggmap", "ggnetwork", "ggpubr", "ggraph", "ggridges", "googlesheets4", "gsheet",
        "hashids",
        "janitor",
        "keyring",
        "lavaan", "lme4", "logspline", "lsr", "ltm",
        "magick", "mailR", "MASS", "mediation", "memoise", "miniCRAN", "MVN",
        "optmatch",
        "pacman", "performance", "personograph", "plotly", "plotrix", "powerMediation", "prereg", "psych", "pwr",
        "qdapRegex",
        "rAltmetric", "rcmdcheck", "rcrossref", "renv", "reshape2", "riskyr", "rmarkdown", "Rmisc", "rorcid", "roxygen2", "RSelenium", "rstan", "rstudioapi",
        "scholar", "semPlot", "sjPlot", "sjstats", "sqldf", "stargazer", "statcheck", "stringr", "stringi", "survival", 
        "tabulizer", "tictoc", "tidyverse", "tidygraph", "tinytex", "tm",
        "webshot", "wordcloud2",
        "yarrr",
        
        
        "bindrcpp", "flipPlots")
}
  

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
  if (length(new.packages)) cat("Instalando ", length(new.packages), " libreria/s: " , new.packages)
  if (length(new.packages)) install.packages(new.packages, dependencies = TRUE) # Si falla, quitar , dependencies = TRUE
  cat('-- Todas las librerias han sido instaladas/actualizadas --', fill = TRUE)

  
  if (install_phantomjs == TRUE) {
    # DT tables 
    webshot::install_phantomjs()
  }
  
  if (install_latex == TRUE) {
    # Latex distribution
    tinytex::install_tinytex()
  }
  
  

  # Exceptions --------------------------------------------------------------

  cat('-- Instalando/actualizando librerias Github --', fill = TRUE)
  
  # keyring (201806 - En la version de CRAN no se almacena correctamente password)
  remotes::install_github("r-lib/keyring")
  
  # Selenium 201807: some of the dependencies out of CRAN
  remotes::install_github("johndharrison/binman")
  remotes::install_github("johndharrison/wdman")
  # remotes::install_github("ropensci/RSelenium")
  
  # Otros
  remotes::install_github("ropensci/rorcid")
  remotes::install_github('rstudio/pagedown') # File -> New File -> R Markdown -> From Template -> HTML Resume {pagedown}
  remotes::install_github("rstudio/rticles") # File -> New File -> R Markdown -> From Template -> CHOOSE JOURNAL {rticles}
  remotes::install_github("jimhester/archive")
  remotes::install_github("Displayr/flipPlots")
  remotes::install_github("dariyasydykova/tidyroc")
  remotes::install_github("edwindj/daff")
  
  # EASYSTATS
  devtools::install_github("easystats/insight")
  devtools::install_github("easystats/parameters")
  devtools::install_github("easystats/see")
  devtools::install_github("easystats/report")
  devtools::install_github("easystats/effectsize")
  devtools::install_github("easystats/performance")
  devtools::install_github("easystats/bayestestR")
  devtools::install_github("easystats/easystats")
  
  
  #*******************************************************************************************
}
