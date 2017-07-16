# Polynomail regression 

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting the linear regression to the dataset
lin_reg = lm(formula = Salary ~., 
             data = dataset)

# Fitting Polynomail regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
poly_reg = lm(formula = Salary ~.,
              data = dataset)
summary(poly_reg)

# visulising the linear regression model
ggplot()+
  geom_point(aes(x= dataset$Level, y = dataset$Salary ),
             colour = 'red') +
  geom_line(aes(x =  dataset$Level, y = predict(lin_reg,newdata = dataset)),
            colour= 'blue') +
  ggtitle('Position vs Salary (Linear Regression') +
  xlab('Position levels') +
  ylab('Salary')

# visualising the polynomial regression model
ggplot()+
  geom_point(aes(x= dataset$Level, y = dataset$Salary ),
             colour = 'red') +
  geom_line(aes(x =  dataset$Level, y = predict(poly_reg,newdata = dataset)),
            colour= 'blue') +
  ggtitle('Position vs Salary (Linear Regression') +
  xlab('Position levels') +
  ylab('Salary')

# predicting a new result with linear regression
y_pred = predict(lin_reg, newdata = data.frame(Level=6.5))

# predicting a new result with polynomail regression
y_pred= predict(poly_reg, newdata = data.frame(Level = 6.5,
                                               Level2 = 6.5^2,
                                               Level3 = 6.5^3))