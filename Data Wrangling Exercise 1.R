# load csv as data frame

my_df <- read.table("refine_original.csv", header = TRUE, sep = ",")

#load dplyr
#(library(dplyr))
#clean company names
#turn company names from factors to characters
#my_df$company <- as.character(my_df$company)

# create a vector of company names
company_names <- my_df$company

#identify the vector positions for the companies 
phillips_names <- grep("^p|^f", company_names, ignore.case = TRUE)
akzo_names <- grep("^a", company_names, ignore.case = TRUE)
van_houten_names <- grep("^v", company_names, ignore.case = TRUE)
unilever_names <- grep("^u", company_names, ignore.case = TRUE)

# replace with correct names
company_names[phillips_names] <- "phillips"
company_names[akzo_names] <- "akzo"
company_names[van_houten_names] <- "van houten"
company_names[unilever_names] <- "unilever"

# insert back into data frame
my_df$company <- company_names