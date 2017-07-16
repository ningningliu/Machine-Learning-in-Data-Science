# Data Preprcessing

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# import data
dataset = pd.read_csv('Data.csv')
# print(dataset)

# matrix of features
X = dataset.iloc[:, :-1].values  # iloc : columns
# print(X)

# create dependent variable vector
y = dataset.iloc[:, 3].values
# print(y)

# take care of missing data
from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values='NaN', strategy='mean', axis=0)
imputer = imputer.fit(X[:,1:3])
X[:,1:3] = imputer.transform(X[:,1:3])


# encode categorical data #
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_X = LabelEncoder()
X[:,0]=labelencoder_X.fit_transform(X[:,0])

# prevent encoded variables to be quantitfied , create boolean dummy variables
# commond +i in front of object to get help 
# run a cell control + enter
onehotencoder = OneHotEncoder(categorical_features =[0])
X = onehotencoder.fit_transform(X).toarray()

labelencoder_y = LabelEncoder()
y= labelencoder_y.fit_transform(y)

# splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split
X_train , X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state =0)


# Feature scaling #
# different scales of variables may results in bias in modeling 
# e.g age = [30,50], salary =[50000, 80000]

# Standardisation scaling
# x_stand = (x - mean(x))/sd(x)
# Normalisation scaling
# x_norm = (x- min(x))/(max(x)-min(x))
# after scaling, it can run faster for complicated models

from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler () # scale X features
# fit_transform is to let sc_X method to learn trainsforming rules from X 
X_train = sc_X.fit_transform(X_train) 
# transform only for test set beacuse sc_X has already learned the fitting rule
X_test = sc_X.transform(X_test) 
# dummy variables don't have to scale as it's already scaled but it also can scaled by preference
# Don't apply feature sclaing on target y as only 0,1






