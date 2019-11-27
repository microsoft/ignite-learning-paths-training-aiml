#!/usr/bin/env python
# coding: utf-8

# # Explore Dataset 

# We will explore the **data_train.csv dataset** from the Tailwind Traders support team department. 
# 
# This is historical data about the features of each support ticket submitted. This data could unlock insights to help the support team become more efficient and provide even better service to Tailwind Traders customers and partners

# We are using:
# * The Notebook VM's in Azure Machine Learning Service:[Three things to know about Azure Machine Learning Notebook VM](https://azure.microsoft.com/en-us/blog/three-things-to-know-about-azure-machine-learning-notebook-vm/)
# * Jupyter, the REPL code interface: [Jupyter.org](https://jupyter.org/)

# ## Read in the Dataset 

# [Read in the dataset (CSV file)](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_csv.html) in order to start exploration. Using [Pandas DataFrames](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.html) as the data structure to hold the dataset and access the ability to manipulate the datasets

# In[ ]:


# Read CSV file
import pandas as pd
data = pd.read_csv('../data/data_train.csv')
data.head()


# ## Describe the Dataset and its Distributions 

# Review the distributions of the dataset. The shape we are working with in Pandas DataFrames

# In[ ]:


data.describe()
data.shape


# ## Feature Engineering 

# Now we have explored the dataset we can start to manipulate it to better explore it and also get it ready for any machine learning/prediction workloads we may wish to create
# 
# ["Feature engineering is the process of using domain knowledge of the data to create features that make machine learning algorithms work"](https://en.wikipedia.org/wiki/Feature_engineering)
# 
# In our dataset - you may have noticed that columns such as **'CompletedTutorial'** or **'Rating'** have string values associated with them, we are going to change them into numeric binary columns instead. Traditional machine learning approaches work well on numeric data.
# 
# Finally in our business use case - date/time context could be incredibly important. Are there certain days of the week, weeks of the month or months of the year that affect duration, themes or escalations for example. We split the **DateCreated** column into 3 and same for the **DateCompleted** column

# In[ ]:


#transform to numeric data - Completed Tutorial
new_completedtutorial = data.loc[data.CompletedTutorial == 'yes', 'CompletedTutorialBinary'] = '1' 
new_completedtutorial = data.loc[data.CompletedTutorial == 'no', 'CompletedTutorialBinary'] = '0' 

#transform to numeric data - Rating
new_rating = data.loc[data.Rating == 'High', 'RatingNumeric'] = '1' 
new_rating = data.loc[data.Rating == 'Low', 'RatingNumeric'] = '0' 

# Split out date columns
data[['DateCreatedDay', 'DateCreatedMonth', 'DateCreatedYear']] = data.DateCreated.str.split("/", expand = True)
data[['DateCompletedDay', 'DateCompletedMonth', 'DateCompletedYear']] = data.DateCompleted.str.split("/", expand = True)

print(data.shape)
data.head()


# ## Data Vizualisation 

# Now we have our dataset expanded we should start exploring the data through vizualisation
# 
# Firstly creating a bar chart using [MatPlotLib package](https://matplotlib.org/) to show **number of support tickets** submitted **by month of the year** to see if there is seasonality.

# In[ ]:


import matplotlib.pyplot as plt
import numpy as np

countscreated = data['DateCreatedMonth'].value_counts().sort_index(ascending = True)
countscompleted = data['DateCompletedMonth'].value_counts().sort_index(ascending = True)

x = data.DateCreatedMonth.unique()
x = np.sort(x)
print(x)


# In[ ]:


plt.figure(figsize=(15,10))
plt.bar(x, countscreated, align='center', alpha=0.5)
plt.xticks(x)
plt.xlabel('Month Created')
plt.ylabel('Count of Month Created')
plt.show()


# Creating a [histogram](https://pythonspot.com/matplotlib-histogram/) of the support tickets by **length of Duration** to see the distribution of support tickets - how many short, medium and long.

# In[ ]:


duration = data['Duration']
num_bins = 7
n, bins, patches = plt.hist(duration, num_bins, facecolor='royalblue', alpha=0.5)
plt.show()


# Creating a [pie chart](https://matplotlib.org/3.1.1/api/_as_gen/matplotlib.pyplot.pie.html) to show the percentage of all support tickets which get **escalated**

# In[ ]:


# Data to plot
labels = 'escalated', 'not-escalated'

escalated_count_0 = len(data[data['Escalated'] == 0])
escalated_count_1 = len(data[data['Escalated'] == 1])
escalated_cases = data[data['Escalated'] == 1]

sizes = [escalated_count_1, escalated_count_0]
colors = ['red', 'lightgreen']
plt.pie(sizes, labels=labels, colors=colors, autopct='%1.1f%%', startangle=140)
plt.axis('equal')
plt.show()


# Creating a [Bar Chart](https://pythonspot.com/matplotlib-bar-chart/) to investigate the support tickets **submitted by Theme** and see if there are any specific areas with problems

# In[ ]:


import numpy as np
objects = data.Theme.unique()
y_pos = np.arange(len(objects))

plt.figure(figsize=(15,10))
plt.bar(y_pos, data['Theme'].value_counts(), align='center', alpha=0.5)
plt.xticks(y_pos, objects)
plt.ylabel('No. Tickets with this theme')
plt.show()


# ## Write new Dataset to use later 

# In[ ]:


dataedited = data.drop(['SupportTicketID', 'CustomerID', 'DateCreated', 'DateCompleted', 'CustomerID2', 'CompletedTutorial', 'Rating', 'GeographyID2', 'RoleID2', 'DateCompletedDay', 'DateCompletedMonth', 'DateCompletedYear'], axis=1)
outputfile = dataedited.to_csv('data_train_experiment.csv', index=False)

