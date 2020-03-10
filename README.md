# R-Packages

Install all the packages and dependencies used by me. Should work fine in the latest Ubuntu LTS version.

In `0.install-all.R` you can:

+ 1.install_dependencies_ubuntu.R: will apt install a bunch of dependencies needed in Ubuntu
+ 2.install_all_packages_std.R: see below

2.install_all_packages_std.R will load the function r.packages() and install a bunch of packages from github.

The function r.packages() will install a lot of packages (> 100). It has two parameters:

+ install_phantomjs: So DT::datatable() will work
+ install_latex: So tinytex::install_tinytex() will launch
