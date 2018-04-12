library(tidyverse)
library(here)
library(stringr)

gaps_bruto = read_csv("http://hollywoodagegap.com/movies.csv",
                      col_types = cols(
                          .default = col_character(),
                          `Release Year` = col_integer(),
                          `Age Difference` = col_integer(),
                          `Actor 1 Birthdate` = col_date(format = "%Y-%m-%d"),
                          `Actor 1 Age` = col_integer(),
                          `Actor 2 Birthdate` = col_date(format = "%Y-%m-%d"),
                          `Actor 2 Age` = col_integer()
                      ))

# Deixa sempre homem no actor 1 e mulher no 2, quando há homem e mulher no casal
gaps = gaps_bruto %>% 
    mutate(switched = `Actor 1 Gender` == "woman" & `Actor 2 Gender` == "man", 
           new_name_1 = if_else(switched, `Actor 2 Name`, `Actor 1 Name`),
           new_gender_1 = if_else(switched, `Actor 2 Gender`, `Actor 1 Gender`), 
           new_bd_1 = if_else(switched, `Actor 2 Birthdate`, `Actor 1 Birthdate`), 
           new_age_1 = if_else(switched, `Actor 2 Age`, `Actor 1 Age`), 
           new_name_2 = if_else(switched, `Actor 1 Name`, `Actor 2 Name`),
           new_gender_2 = if_else(switched, `Actor 1 Gender`, `Actor 2 Gender`), 
           new_bd_2 = if_else(switched, `Actor 1 Birthdate`, `Actor 2 Birthdate`), 
           new_age_2 = if_else(switched, `Actor 1 Age`, `Actor 2 Age`), 
           `Actor 1 Name` = new_name_1,
           `Actor 1 Gender` = new_gender_1,
           `Actor 1 Birthdate` = new_bd_1,
           `Actor 1 Age` = new_age_1,
           `Actor 2 Name` = new_name_2,
           `Actor 2 Gender` = new_gender_2,
           `Actor 2 Birthdate` = new_bd_2,
           `Actor 2 Age` = new_age_2
           ) %>% 
    select(-switched, -starts_with("new_")) %>% 
    mutate(`Age Difference` = `Actor 1 Age` - `Actor 2 Age`, 
           same_sex = `Actor 1 Gender` == `Actor 2 Gender`) 

# renomeia variáveis para simplicar código depois
names(gaps) = names(gaps) %>% 
    str_to_lower() %>% 
    str_replace_all(' ', '_')
           

gaps %>% 
    write_csv(here("data/hollywoodagegaps.csv"))

