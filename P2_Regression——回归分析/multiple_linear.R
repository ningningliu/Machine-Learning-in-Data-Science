# Multiple linear regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')

# encode categorical data
dataset$State = factor(dataset$State,
                         levels = c('New York', 'California','Florida'),
                         labels = c(1,2,3))


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
#library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# fitting multiple linear regression to the training set
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State )
regressor = lm(formula = Profit ~ . ,
               data = training_set)

summary(regressor)

# predicting the test set results
y_pred = predict(regressor, newdata = test_set)

# building the optimal model using Backwards Elimination
# no need to add constant vector to model as it is done by R
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset)

summary(regressor)

# remove State
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset)

summary(regressor)

# remove administration
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset)

summary(regressor)

# remove marketing.spend but p-value of marketing.spend already decreased to 0.06
# so it may not remove marketing.spending
regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset)

summary(regressor)



