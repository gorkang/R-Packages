
r.packages <- function(list.of.packages = NA, install_phantomjs = FALSE, install_latex = TRUE, install_githubs = FALSE) {

  # Use all but one of the computer cores. See http://blog.jumpingrivers.com/posts/2017/speed_package_installation/
  if (!require('parallel')) install.packages('parallel')
  options(Ncpus = parallel::detectCores() - 2)
  
  # Si no se introduce ningun paquete, instala/carga todos
  if (length(list.of.packages) == 1 && is.na(list.of.packages) == T) {

    #Instala librerias usadas habitualmente
    
    list.of.packages <-
      c("Rmisc", 
        "afex", "anytime", "apaTables",
        "BayesFactor", "BayesianReasoning", "beanplot", "bitops", "blastula", "bookdown", "brms",
        "clock", "compareDF", "corrplot", "corrr", "curl",
        "daff", "DataExplorer", "datapasta", "data.table", "devtools", "dflow", "DiagrammeR", "distill", "doBy",
        "esvis", "esquisse", "Exact", "exifr", "eyelinker",
        "fitdistrplus", "findviews", "forcats", "formattable", "furrr",
        "ggalluvial", "ggcorrplot", "gghighlight", "ggmap", "ggnetwork", "ggpubr", "ggraph", "ggridges", "ggthemes", "googlesheets4", "gsheet", "gt", "gtsummary",
        "hashids", "hrbrthemes",
        "igraph", "inspectdf", "irr",
        "janitor",
        "keyring",
        "lavaan", "likert", "lme4", "logspline", "lsr", "ltm",
        "magick", "mailR", "MASS", "mediation", "memoise", "microbenchmark", "miniCRAN", "MVN",
        "naniar",
        "optmatch",
        "pacman", "papaja", "performance", "personograph", "plotly", "plotrix", "powerMediation", "prereg", "psych", "pwr",
        "qdapRegex",
        "rAltmetric", "rcmdcheck", "rcrossref", "readODS", "regclass", "renv", "reshape2", "retractcheck", "riskyr", "rmarkdown", "Rmisc", "rorcid", "roxygen2", "RSelenium", "rstan", "rstanarm", "rstudioapi", "rtweet",
        "scholar", "semPlot", "sjPlot", "sjstats", "skimr", "slider", "sqldf", "stargazer", "statcheck", "stringr", "stringi", "survival", 
        "tabulizer", "targets", "textreadr", "tictoc", "tidyverse", "tidygraph", "tinytex", "tm",
        "units",
        "vdiffr", "vroom",
        "webshot", "wordcloud2", "writexl",
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

  if (install_githubs == TRUE) {
  cat('-- Instalando/actualizando librerias Github --', fill = TRUE)
  
  
  # Waffle plots (the CRAN version is a different one)  
  remotes::install_github("hrbrmstr/waffle")
    
  # keyring (201806 - En la version de CRAN no se almacena correctamente password)
  remotes::install_github("r-lib/keyring")
  
  # Selenium 201807: some of the dependencies out of CRAN
  remotes::install_github("johndharrison/binman")
  remotes::install_github("johndharrison/wdman")
  # remotes::install_github("ropensci/RSelenium")
  
  # CRAN version not available 202009
  devtools::install_github("ndphillips/FFTrees", build_vignettes = TRUE)
  
  
  # Otros
  remotes::install_github("jimhester/archive")
  remotes::install_github("edwindj/daff")
  remotes::install_github("milesmcbain/dflow", dependencies = TRUE) # dependencies = TRUE: to also install capsule, conflicted, dontenv, and drake.
  remotes::install_github("Displayr/flipPlots")
  remotes::install_github('rstudio/pagedown') # File -> New File -> R Markdown -> From Template -> HTML Resume {pagedown}
  remotes::install_github("ropensci/rorcid")
  remotes::install_github("rstudio/rticles") # File -> New File -> R Markdown -> From Template -> CHOOSE JOURNAL {rticles}
  remotes::install_github("gadenbuie/shrtcts") # Keybindings and shorcuts: https://github.com/MilesMcBain/nycr_meetup_talk
  remotes::install_github("dariyasydykova/tidyroc")
  remotes::install_github('jorvlan/raincloudplots')
  

  # EASYSTATS
  devtools::install_github("easystats/insight")
  devtools::install_github("easystats/parameters")
  devtools::install_github("easystats/see")
  devtools::install_github("easystats/report")
  devtools::install_github("easystats/effectsize")
  devtools::install_github("easystats/performance")
  devtools::install_github("easystats/bayestestR")
  devtools::install_github("easystats/easystats")
  
  } else {
   
    cat('-- No instalamos/actualizamos librerias Github --', fill = TRUE)
    
  }
  
  #*******************************************************************************************
}
