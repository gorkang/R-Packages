
r.packages <- function(list.of.packages = NA, install_phantomjs = FALSE, install_latex = TRUE, install_githubs = FALSE, install_easystats_dependencies = FALSE) {

  # Use all but one of the computer cores. See http://blog.jumpingrivers.com/posts/2017/speed_package_installation/
  if (!require('parallel')) install.packages('parallel')
  
  if (!require('pak')) install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform$pkgType, R.Version()$os, R.Version()$arch))
  
  
  options(Ncpus = parallel::detectCores() - 2)
  
  # Si no se introduce ningun paquete, instala/carga todos
  if (length(list.of.packages) == 1 && is.na(list.of.packages) == T) {

    #Instala librerias usadas habitualmente
    list.of.packages <-
      c("Rmisc", 
        "afex", "anytime", "apaTables",
        "BayesFactor", "BayesianReasoning", "bayestestR", "beanplot", "beepr", "bench", "bitops", "blastula", "bookdown", "brms", "broom.mixed", "bs4Dash",
        "clock", "clustermq", "compareDF", "corrplot", "corrr", "covr", "cranlogs", "curl",
        "DataExplorer", "datapasta", "data.table", "DBI", "devtools", "DiagrammeR", "diffviewer", "distill", "doBy", #"daff", "dflow",
        "easystats", "effectsize", "esvis", "esquisse", "Exact", "exifr", "eyelinker",
        "fitdistrplus", "findviews", "forcats", "formattable", "furrr",
        "gapminder", "ggalluvial", "ggcorrplot", "gghighlight", "ggmap", "ggnetwork", "ggpubr", "ggrain", "ggraph", "ggridges", "ggthemes", "gmodels", "googlesheets4", "grateful", "gt", "gtExtras", "gtsummary",
        "hashids", "hexbin", "hrbrthemes",
        "igraph", "insight", "inspectdf", "irr",
        "janitor",
        "kableExtra", "keyring",
        "lavaan", "likert", "lme4", "logspline", "lsr", "ltm",
        "magick", "mailR", "MASS", "mediation", "memoise", "microbenchmark", "miniCRAN", "munsell", "MVN", # munsell is a non-declared afex dependency?
        "naniar",
        "odbc", "openmeteo", "optmatch",
        "pagedown", "papaja", "parameters", "patchwork", "pdftools", "performance", "pingr", "plotly", "plotrix", "powerMediation", "prereg", "psych", "pwr", #"personograph",
        "qdapRegex", "quarto",
        "ragg", "rcmdcheck", "rcrossref", "readODS", "remotes", "renv", "report", "reshape2", "riskyr", "rmarkdown", "Rmisc", "rorcid", "roxygen2", "RSelenium", "rsconnect", "rstudioapi", "rticles", #"rtweet", #"rAltmetric",  "retractcheck",
        "scholar", "secret", "see", "semPlot", "sjPlot", "sjstats", "skimr", "slider", "sqldf", "stargazer", "statcheck", "stringr", "stringi", "styler", "survival",
        "tarchetypes", "targets", "tictoc", "tidyverse", "tidygraph", "tinytex", "tm", #"textreadr",
        "units",
        "vdiffr", "vroom",
        "webshot2", "wordcloud2", "writexl",
        "yarrr",
        
        # Very long compilation
        "regclass", "rstan", 
        # "rstanarm",
        
        "bindrcpp") #, "flipPlots"
}
  # 

  new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
  if (length(new.packages)) {
    cat("Instalando ", length(new.packages), " libreria/s: " , new.packages)
    pak::pak(pkg = new.packages)
    # install.packages(new.packages, dependencies = TRUE, lib = Sys.getenv("R_LIBS_USER")) # Si falla, quitar , dependencies = TRUE
    # install.packages(new.packages, dependencies = TRUE) 
  }
  
  
  
  
  cat('-- Todas las librerias han sido instaladas/actualizadas --', fill = TRUE)

  
  if (install_phantomjs == TRUE) {
    # Only for old webshot? Now we use webshot2
    # DT tables 
    # webshot::install_phantomjs(force = TRUE)
  }
  
  if (install_latex == TRUE) {
    # Latex distribution
    tinytex::install_tinytex()
  }
  
  
  # if (install_ragg == TRUE) {
  #   pak::pak('r-lib/ragg')
  # }
  

  # Exceptions --------------------------------------------------------------
  # "tabulizer", 
  if (install_githubs == TRUE) {
    cat('-- Instalando/actualizando librerias Github --', fill = TRUE)
    
    # Grateful
    # pak::pak("Pakillo/grateful")
    
    
    # Papaja
    # pak::pak("crsh/papaja")
    
    # Waffle plots (the CRAN version is a different one)  
    pak::pak("hrbrmstr/waffle")
      
    # keyring (201806 - En la version de CRAN no se almacena correctamente password)
    # pak::pak("r-lib/keyring")
    
    # Selenium 201807: some of the dependencies out of CRAN
    # pak::pak("johndharrison/binman")
    # pak::pak("johndharrison/wdman")
    # pak::pak("ropensci/RSelenium")
    
    # CRAN version not available 202009
    pak::pak("ndphillips/FFTrees")
    
    # Otros
    pak::pak("jimhester/archive")
    pak::pak("edwindj/daff")
    # pak::pak("Displayr/flipPlots")
    pak::pak("gadenbuie/shrtcts") # Keybindings and shorcuts: https://github.com/MilesMcBain/nycr_meetup_talk
    pak::pak("dariyasydykova/tidyroc")
    pak::pak(c("ropensci/tabulizerjars", "ropensci/tabulizer"))
    pak::pak("jmablog/tinieR")
    pak::pak("gadenbuie/regexplain")
    # pak::pak("gaborcsardi/secret")
    
    # ON Cran
    # pak::pak("ropensci/rorcid")
    # pak::pak("rstudio/rticles") # File -> New File -> R Markdown -> From Template -> CHOOSE JOURNAL {rticles}
    
    
    # EASYSTATS
    # install.packages("easystats", repos = "https://easystats.r-universe.dev")
    # easystats::install_suggested()

    
  } else {
   
    cat('-- No instalamos/actualizamos librerias Github --', fill = TRUE)
    
  }
  
  if (install_easystats_dependencies == TRUE) easystats::install_suggested()
  
}
