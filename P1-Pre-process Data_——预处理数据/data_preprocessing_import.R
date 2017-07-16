# Data Preprocessing

# import data
# run the current line of code : commond + enter
setwd("/Users/ningning/Documents/ML A-Z/P1-Pre-process Data")
dataset = read.csv('Data.csv')
#print(dataset)

# Taking care of missing data data #
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Salary)

# Encode categorical data #
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain','Germany'),
                         labels = c(1,2,3))


dataset$Purchased = factor(dataset$Purchased,
                         levels = c('No','Yes'),
                         labels = c(0,1))

# Splitting training and test set #
#install.packages('caTools')

# set seed for same result
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == T)
test_set = subset(dataset, split == F)

# Feature Scaling #
# not apply feature scaling on categorical variables
training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])
