# Polynomial Regression 
# not a linear regression 
# add polynomial terms

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

# Splitting the dataset into the Training set and Test set
"""
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 1/3, random_state = 0)
"""
# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)"""

# Fitting Linear Regression to the dataset
from sklearn.linear_model import LinearRegression 
lin_reg = LinearRegression()
lin_reg.fit(X, y)

# Fitting Polynomial Regression to the dataset
from sklearn.preprocessing import PolynomialFeatures
# transfor X into new feature matrix contianing polynomial variables, 
# and also feature interactions, constant variables 
poly_reg = PolynomialFeatures(degree =2 )
X_poly = poly_reg.fit_transform(X) # create polynomail variables and also constance column
lin_reg2 = LinearRegression()
lin_reg2.fit(X_poly, y)

# visualising the linear regression results
plt.scatter(X, y, color = 'red')
plt.plot(X, lin_reg.predict(X),color = 'blue')
plt.title('Position vs Salary (Linear Regression')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()

# visualising the polynomial regression results
plt.scatter(X, y, color = 'red')
plt.plot(X, lin_reg2.predict(X_poly),color = 'blue')
plt.title('Position vs Salary (Polynomail Regression')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()

poly_reg3 = PolynomialFeatures(degree =3 )
X_poly3 = poly_reg3.fit_transform(X)
lin_reg3 = LinearRegression()
lin_reg3.fit(X_poly3, y)
plt.scatter(X, y, color = 'red')
plt.plot(X, lin_reg3.predict(X_poly3),color = 'blue')
plt.title('Position vs Salary (Polynomail Regression')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()

X_grid = np.arange(min(X),max(X),0.1)
X_grid = X_grid.reshape((len(X_grid),1))

# Predicting a new result with Linear Regression 
lin_reg.predict(6.5)

# Predicting a new result with polynomail regression 
lin_reg2.predict(poly_reg.fit_transform(6.5))


