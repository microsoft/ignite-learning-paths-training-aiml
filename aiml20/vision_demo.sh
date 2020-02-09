#!/bin/sh

###
### Create a Cognitive Services key and use it with Computer Vision
###

### Create a key

## Full details here: https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account-cli

## 1. Log in to the Azure CLI (not needed for Cloud Shell)
az login

## 2. Create a resource group to hold keys
az group create \
    --name aiml20-demo \
    --location westus2

## 3. Create an omnibus CognitiveServices account key
az cognitiveservices account create \
    --name aiml20-cs-resource \
    --resource-group aiml20-demo \
    --kind CognitiveServices \
    --sku S0 \
    --location westus2 \
    --yes    

## 4. Display the key
# This will display two keys. 
# Copy the "key1" value to your clipboard, without the quotes.
# It will look something like this: c8e5546e8dab4b7a91590b252a9b16fd
az cognitiveservices account keys list \
    --name aiml20-cs-resource \
    --resource-group aiml20-demo 

### 5. store the key in an environment variable
# paste in the key you copied above
KEY="YOUR-KEY-HERE"

# If you are not using the westus2 region, check your endpoint in the Azure portal
# by inspecting "aiml20-cs-resource" in the "aiml20-demo" resource group
VISIONENDPOINT="https://westus2.api.cognitive.microsoft.com/vision/v2.0/analyze"

### 6. Analyze test images via API usinh CURL
# images can be found in "test images" folder
# man in hardhat.jpg -- this will give the same results as via the Web app
IMG="https://raw.githubusercontent.com/microsoft/ignite-learning-paths-training-aiml/master/aiml20/test%20images/man%20in%20hardhat.jpg"
echo $IMG

curl -H "Ocp-Apim-Subscription-Key: $KEY" \
      -H "Content-Type: application/json" \
      "$VISIONENDPOINT?visualFeatures=Tags&language=en" \
      -d "{\"url\":\"$IMG\"}"   

# drill.jpg
IMG="https://raw.githubusercontent.com/microsoft/ignite-learning-paths-training-aiml/master/aiml20/test%20images/drill.jpg"
curl -H "Ocp-Apim-Subscription-Key: $KEY" \
      -H "Content-Type: application/json" \
      "$VISIONENDPOINT?visualFeatures=Tags&language=en" \
      -d "{\"url\":\"$IMG\"}"   

# In the last example, the Vision API is identifying a drill as a camera! General models
# trained on thousands of categories can be less effective than simpler models
# if you know the specific images you want to identify in advance.

# When you're done, you can delete the resource group and associated resources
# NOTE: we will use this resource group in the Custom Vision demo, as well.
az group delete --name aiml20-demo
