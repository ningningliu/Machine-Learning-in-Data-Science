# Simple linear regression #

# Importing the dataset
dataset = read.csv('Salary_Data.csv')
# dataset = dataset[, 2:3]
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
regressor = lm(formula = Salary~ YearsExperience, data = training_set)
regressor = lm(formula = Salary~ YearsExperience, data = training_set)

y_pred = predict(regressor, newdata = test_set)
y_pred
regressor
#install.packages('ggplot2')
#library("ggplot2", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")


ggplot()+
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
            colour ='red') +
  geom_line(aes(x = training_set$YearsExperience,y= predict(regressor, newdata = training_set)),
            colour= 'blue') +
  ggtitle('Salary vs Experience (Training set')+
  xlab('Years of experience')+
  ylab('Salary')



ggplot()+
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
            colour ='red') +
  geom_line(aes(x = training_set$YearsExperience,y= predict(regressor, newdata = training_set)),
            colour= 'blue') +
  ggtitle('Salary vs Experience (Test set)')+
  xlab('Years of experience')+
  ylab('Salary')
