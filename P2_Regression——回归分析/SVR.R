# SVR regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting the SVR to the dataset
#install.packages('e1071')
# press fn+F1 to see docmentation
regressor = svm(formula = Salary ~., 
                data = dataset,
                type = 'eps-regression')

# Predicting a new result
y_pred = predict(regressor, data.frame(Level= 6.5))

# visulising the SVR regression model
ggplot()+
  geom_point(aes(x= dataset$Level, y = dataset$Salary ),
             colour = 'red') +
  geom_line(aes(x =  dataset$Level, y = predict(regressor,newdata = dataset)),
            colour= 'blue') +
  ggtitle('Position vs Salary (SVR)') +
  xlab('Position levels') +
  ylab('Salary')

