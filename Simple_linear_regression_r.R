#simple linear regression

#data preprossing
dataset = read.csv('Salary_Data.csv')

#Splitting dataset into the training and test set 
##install.packages('caTools')

library(caTools)
set.seed(123)
split = sample.split(dataset$Salary,SplitRatio = 2/3)
training_set = subset(dataset, split== TRUE)
test_set = subset(dataset, split == FALSE)


#Fitting simple linear regression to the training set

regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)
#Predicting the test set results
y_pred = predict(regressor,newdata = test_set)
y_pred

#visualising the training set results
library(ggplot2)

ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y= training_set$Salary),
             colour = 'red')+
  geom_line(aes(x =training_set$YearsExperience, y=  predict(regressor,newdata = training_set) ),
            colour= 'blue')+
  ggtitle('Salary vs experience (Training set)')+
  xlab('Years Of Experience')+
  ylab('Salary')
