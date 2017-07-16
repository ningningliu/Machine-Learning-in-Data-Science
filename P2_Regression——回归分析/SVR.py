# SVR

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

"""
# Splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 1/3, random_state = 0)
"""

# Feature Scaling
# SVR class doesn't apply feature scaling automatically
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X = sc_X.fit_transform(X)
sc_y = StandardScaler()
y = sc_y.fit_transform(y)

# Fitting SVR to the Training set
from sklearn.svm import SVR
regressor = SVR(kernel = 'rbf')
regressor.fit(X, y)


# predicting the Test set results
# transform must be arrary in X postion
y_pred = sc_y.inverse_transform(regressor.predict(sc_X.transform(np.array([[6.5]])))) 

# visualising the training set SVR results
plt.scatter(X, y, color = 'red')
plt.plot(X, regressor.predict(X),color = 'blue')
plt.title('Position vs Salary (SVR)')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()

# visualizing the SVR results for higher resolution and smooth curve
X_grid = np.arange(min(X),max(X),0.1)
X_grid = X_grid.reshape((len(X_grid),1))
plt.scatter(X, y, color = 'red')
plt.plot(X_grid, regressor.predict(X_grid),color = 'blue')
plt.title('Position vs Salary (SVR Regression')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()
