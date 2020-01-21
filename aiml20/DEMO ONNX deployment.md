# DEMO: ONNX Deployment

> 💡 You must have completed the [setup](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md) before attempting to do the demo.

In this demo, we take the ONNX file we exported in the [Custom
Vision](DEMO%20Custom%20Vision.md) demo, and deploy it to the Tailwind Traders website.

The website uses the model in `products.onnx` for the Shop by Photo app. The
uploaded image is processed by the model, which generates one of five labels:
"hammer", "drill", "pliers", "screwdriver" or "hard hat". The website searches
the product list for the generated label, and returns the results of the search.

## Load the simple ONNX model

(TIP: You can do this step ahead of time. This step is necessary if you have run
this demo before on the same deployment.)

We will replace the products.onnx file in the Web app with a version that only recognizes two object categories: "hammer" and "drill".

1. In the Azure Portal, visit your aiml20-demo resource group

1. Click the "aiml20" App Service resource

1. In the left menu under Development Tools, Click Advanced tools, then click "Go" in right pane to launch Kudu.

1. In the main menu bar, Click Debug Console > PowerShell

1. Browse to: site / wwwroot / Standalone / Onnxmodels

1. With Explorer, open the `ONNX / simple model` folder from your AIML20 repo

1. Drag products.onnx into the LEFT HALF of the Kudu window. (IMPORTANT: Do NOT drag into the box that says "drag here to upload and unzip".) This model only knows how to identify drills and hammers.

1. Restart the web server. Return to the "aiml20" App Service resource and click "Restart" in the top menu bar. Wait two minutes for the website to restart completely.

## Defining the problem: Shop by Photo doesn't work right

(Note: This section was done at the beginning of the AIML20 presentation.)

1. Visit the Tailwind Traders website you deployed earlier. 

1. Scroll down to the "Shop by Photo" section of the website

1. Click "Shop by Photo"

1. In your AIML20 repo, select: test images > drill.jpg

1. It correctly identifies it as a drill. Yay!

1. Return to home page and click "Shop by Photo" again

1. In your AIML20 repo, select: test images > pliers.jpg

1. Oh no! It identifies it as a hammer. We'll fix that later, but first, let's understand why it failed.

## Update the ONNX model in the Tailwind Traders website

First, view the exported model in Netron:

1. Browse to https://lutzroeder.github.io/netron/, Click Open Model

2. Open ONNX / Custom Model / products.onnx

3. Scroll through the neural network and note:

 - it's large
 - at the top, is a 224x224 image as input (dirty secret: computer vision models have pretty poor vision)
 - at the bottom, it outputs 5 values, these are the confidence scores for our class labels

Next, drop the ONNX file we exported into TWT filesystem

1. In the Azure Portal, visit your aiml20-demo resource group

1. Click the "aiml20" Web App resource

1. Under Development Tools, Click Advanced tools, then click "Go" in right pane to launch Kudu.

1. In the main menu bar, Click Debug Console > PowerShell

1. Browse to: site / wwwroot / Standalone / Onnxmodels

1. With Explorer, open the `ONNX / custom model` folder from your AIML20 repo

1. Drag products.onnx into the LEFT HALF of the Kudu window. (IMPORTANT: Do NOT
   drag into the box that says "drag here to upload and unzip".)

1. Restart the web server. Return to the "onnx" Web App resource and click "Restart".

Rerun Shop by Photo, upload `test images / pliers.jpg`. Now it works!

## Next Step

[Personalizer](DEMO%20Personalizer.md)


