# import forest cover data by country and the sub-Saharan countries list
setwd("~/STAT 482")
forest = read.csv("forest_coverage_data_by_country.xls - Data.csv")
countries = read.csv("subsaharan_countries - Sheet1.csv")

# take out the first two rows of forest, which contain data we don't need
forest = forest[-c(1,2),]

# assign first row of data to col.names
colnames(forest) = as.character(unlist(forest[1,]))
forest = forest[-1,]

# filter the data in forest by countries in countries
forest = forest[forest$`Country Name` %in% countries$country_name,]

# keep only years 2000-2020, remove Indicator Name and Indicator Code cols.
to_remove = as.character(c(1960:1999,2021:2023, "Indicator Name", "Indicator Code"))
forest = forest[,!(colnames(forest) %in% to_remove)]



View(forest)

