# This R script will compile the Demo website, 
# and move all necessary files within www folder to the parent directory
#

remove(list = ls())

#########################################################
## render the website
#########################################################

# compiles all .Rmd files in this folder, 
# and once complete moves files to www folder
rmarkdown::render_site()

#########################################################
## The following lines will move the required website pages from
## the www folder into the root directory
#########################################################

# remove *.html documents from root directory
# and copy new *.html documents from www
list.of.files <- list.files("./",".html")
file.remove(list.of.files)
Sys.sleep(1)
list.of.files <- paste0("./www/",list.files("./www",".html"))
file.copy(list.of.files,"./")

# Move site_libs folder
dir.create('site_libs')
file.copy("./www/site_libs", "./", recursive=TRUE)

# remove www folder for clean up
file.remove("./www")
