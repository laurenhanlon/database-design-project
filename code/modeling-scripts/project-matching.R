# Stable project matching in R [IEOR 115 DP]

# The packages used to solve this stable marrage are DataComptuting, matchingR and readxl.
# If the system does not already have them installed we can do so by uncommenting the following 3 lines

# install.packages("DataComputing")
# install.packages("matchingR")
# install.packages("readxl")

# load the packages 
library(DataComputing)
library(matchingR)
library(readxl)

# load the preference tables that were exported from access and convert the value for rank to be numeric

consultant_pref <- read_excel("Project_Rank Query.xlsx") # change path directory accordingly 
consultant_pref$Rank <- as.numeric(consultant_pref$Rank)
plead_pref <- read_excel("Consultant_Rank Query.xlsx") # change path directory accordingly 
plead_pref$Rank <- as.numeric(plead_pref$Rank)

# wrangling the data to get it in the form required by the package

pref_plead <- spread(plead_pref, Project_lead, Rank)
pref_plead <- pref_plead[order(pref_plead$Consultant),]


pref_cons <- spread(consultant_pref, Consultant, Rank)
pref_cons <- pref_cons[order(pref_cons$Project_lead),]

project_leads <- cbind(unique(row.names(pref_cons)),pref_cons[,1])
colnames(project_leads)  <- c("projectlead_id","name")
project_leads$projectlead_id <- as.numeric(project_leads$projectlead_id)
consultants <-  cbind(unique(row.names(pref_plead)),pref_plead[,1])
colnames(consultants)  <- c("consultant_id","name")
consultants$consultant_id <- as.numeric(consultants$consultant_id)

pref_cons <- pref_cons[,-1]
pref_plead <- pref_plead[,-1]

# Using the matchingR package and specifying parameters to be 3 slots and optimal on the consultants preferences

stable_match <- galeShapley.collegeAdmissions(pref_cons,pref_plead,slots = 3,studentOptimal = TRUE)

# wrangling the output to make it the end result readble 

consultant_matches <- cbind(consultants,stable_match$matched.students)
consultant_matches <- left_join(consultant_matches,project_leads, by = c("stable_match$matched.students" = "projectlead_id"))

consultant_matches_final <- 
  consultant_matches %>% 
  select(name.x,name.y) %>%
  rename(Consultant = name.x, Project_Lead = name.y)

project_lead_matches <- cbind(project_leads,stable_match$matched.colleges)
project_lead_matches <- project_lead_matches[,-1]
project_lead_matches <- gather(project_lead_matches, name, consultant_id)
project_lead_matches <-  project_lead_matches[,-2]
colnames(project_lead_matches) <- c("Project_Lead", "consultant_id")


project_lead_matches_final <- 
  project_lead_matches %>%
  left_join(consultants) %>%
  select(-consultant_id) %>%
  rename(Consultant=name) %>%
  arrange(Project_Lead)

# print the final tables

consultant_matches_final

project_lead_matches_final
