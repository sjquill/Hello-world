## Github practice
library(dplyr)
library(ggplot2)
# Dowload csv from https://www.kaggle.com/datasets/campbellsinvestment/jamaican-islandwide-fever-and-respiratory-symptoms?resource=download

jam_data<- read.csv("/Users/Sam/Desktop/UCL/2024/November/Week_2/RSE_github_practice/Islandwide-Fever-and-Respiratory-Symptoms.csv.csv")

dim(jam_data) # 1119    4
colnames(jam_data) # "Year" , "Age.Range"  ,  "Epidemiological.Week" ,"Fever.and.Respiratory.Symptoms"

str(jam_data) # checking data types of each column

# summary statistics

jam_data %>%
  group_by(Year, Age.Range) %>%
  summarise(
    mean_cases = mean(Fever.and.Respiratory.Symptoms),
    max_cases = max(Fever.and.Respiratory.Symptoms),
    min_cases = min(Fever.and.Respiratory.Symptoms),
    total_cases = sum(Fever.and.Respiratory.Symptoms)
  ) %>%
  ungroup()

## Descriptove plot of cases over time by age groups
ggplot(jam_data, aes(x=Epidemiological.Week, 
                           y=Fever.and.Respiratory.Symptoms, 
                           color=Age.Range)) +
  geom_line() +
  facet_wrap(~Year, scales="free_y") +
  theme_minimal() +
  labs(title="Fever and Respiratory Symptoms Over Time by Age Range",
       x="Week",
       y="Number of Cases") +
  theme(legend.position="bottom")
