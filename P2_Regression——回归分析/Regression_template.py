# Simple Linear Regression #

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Salary_Data.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values

# Splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 1/3, random_state = 0)

# Feature Scaling

# simple linear regression doesn't need feature scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)"""

# Fitting simple linear regression to the Training set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train,y_train)

# predicting the Test set results
y_pred = regressor.predict(X_test)

# visualising the training set results
plt.scatter(X_train, y_train,color = 'red')
plt.plot(X_train, regressor.predict(X_train), color = 'blue') # regression line
plt.title('Salary vs Experience (Training set)')
plt.xlabel('Years of experience')
plt.ylabel('Salary')
plt.show()

# visualising the test set results
plt.scatter(X_test, y_test,color = 'red')
plt.plot(X_train, regressor.predict(X_train), color = 'blue') # regression line
plt.title('Salary vs Experience (Test set)')
plt.xlabel('Years of experience')
plt.ylabel('Salary')
plt.show()


"""
5 method of building models (selecting right variable):
    1. all in
    2. backward eleimination
    3. forward selection
    4. bidirecional elimination
    5. score comparison
"""



