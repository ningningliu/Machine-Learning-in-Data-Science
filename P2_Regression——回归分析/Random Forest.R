# Random Forest Regression 

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# # install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary, SplitRatio = 2/3)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting the Regression Model to the dataset
# Create your regressor here
#install.packages('randomForest')
set.seed(123)
# try serveral number of random trees 10,100,300,500
regressor = randomForest(x = dataset[1], #note x takes data frames, dataset[1] gives dataframe
                         y = dataset$Salary, # y takes vector, dataset$Salary gives vector
                         ntree = 500)

# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))


# Visualising the Random Forest Regression Model results (for higher resolution and smoother curve)

x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Random Forest Regression Model)') +
  xlab('Level') +
  ylab('Salary')