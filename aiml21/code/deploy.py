#!/usr/bin/env python
# coding: utf-8

# # Deploy Model

# In this section we will submit data to the [Azure Machine Learning Model Endpoint](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-deploy-and-where) we have created in the Azure Portal - using Python to call a REST API
# 
# We will be following a simlilar process to the documentation here:[How to Consume a Web Service](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-consume-web-service)

# ## Connect to Azure ML Service 

# We [connect to the Azure Machine Learning Service](https://docs.microsoft.com/en-us/azure/machine-learning/service/tutorial-1st-experiment-sdk-setup) in order to get details about calling the web service we have created
# 
# Be sure to fill in 'config.json' file provided with the code. This must contain your Azure Machine Learning workspace information for the code below to work

# In[ ]:


from azureml.core import Workspace
ws = Workspace.from_config()
print(ws)


# ## Find Web Service by Name and get Connection Details 

# We select the web service by the name and this will provide us information on the URLs such as scoring and [swagger](https://swagger.io/) calls

# In[ ]:


from azureml.core import Webservice
service = Webservice(workspace=ws, name='<insert web service name here>')
print("Score URI: " + str(service.scoring_uri))
print("Swagger URI: " + str(service.swagger_uri))

primary, secondary = service.get_keys()
print(primary)


# ## Data Input to REST API Schema 

# Now we need to understand the schema of the data to be input into the REST call.
# 
# You can get this sample input information from the auto-generated scoring script that was created in the Azure Portal

# In[ ]:


import pandas as pd
input_sample = pd.DataFrame(data=[{'Escalated': 0, 'GeographyID': 2, 'OriginalScore': 9, 'Tenure': 25.0, 'Theme': 'speed', 'RoleID': 2, 'Continent': 'Europe', 'CountryRegion': 'France', 'RoleInOrg': 'consumer', 'CompletedTutorialBinary': 1, 'RatingNumeric': 1, 'DateCreatedDay': 23, 'DateCreatedMonth': 11, 'DateCreatedYear': 2018}])

# In[ ]:


array = input_sample.iloc[0,:]
print("Input data content:")
print(array)


# ## Call Web Service with Data 

# Finally we use packages in Python to call a REST Request using the scoring URL and the data to evaluate
# 
# This can be run in any language, check out the [documentation here](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-consume-web-service) for more language samples. We have chosen Python. This could also be called from a tool such as [Postman](https://www.getpostman.com/), you can find a video demo here showing that process and tool

# In[ ]:


import requests
import json

# URL for the web service
scoring_uri = service.scoring_uri
# If the service is authenticated, set the key or token
key = primary

# Two sets of data to score, so we get two results back
data = {"data":
        [
            [
                1,
                'Europe',
                'France',
                23,
                11,
                2018,
                0,
                2,
                9,
                1,
                2,
                'consumer',
                25,
                'speed'
            ]
        ]
        }
# Convert to JSON string
input_data = json.dumps(data)

# Set the content type
headers = {'Content-Type': 'application/json'}
# If authentication is enabled, set the authorization header
headers['Authorization'] = f'Bearer {key}'

# Make the request and display the response
resp = requests.post(scoring_uri, input_data, headers=headers)
print(resp.text)

