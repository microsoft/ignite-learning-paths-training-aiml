# Using pre-built AI to understand images

> 💡 You must have completed the [setup](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md) before attempting to do the demo.

In this demonstration, we will use Azure Computer Vision to detect the type of
object an image represents. 

First, we will use the Computer Vision online web-form to upload an image and
observe the results.

Then, we will use the Computer Vision API to collect the same information
programmatically, using curl.

## Defining the problem: Shop by Photo doesn't work right

The problem that motivates this talk is that the Shop by Photo tool in the
Tailwind Traders website isn't correctly identifying products. It's useful to
run this section in [ONNX Deployment](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right) at this point
to set the scene.

## Using Computer Vision via the Web interface

Let's try using computer vision on a picture of a hardware product. If we can
identify a product that Tailwind Traders sells by name, we can search for that
name in the catalog for the "Shop by Photo" app.

1. Visit the Computer Vision webpage at
   [https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=msignitethetour2019-github-aiml20)

2. Scroll down to the "Analyze an Image" section. It looks like this:

!["Computer Vision: Analyze an Image"](img/Computer%20Vision%20Analyze%20an%20Image.png)

3. Click the "Browse" button, and choose "man in hardhat.jpg" from the "test
   images" folder in "CV Training Images".

4. After a moment, the analysis of your image will appear in the right pane. It
   looks like this:

```
FEATURE NAME:	VALUE

Objects	[ { "rectangle": { "x": 138, "y": 27, "w": 746, "h": 471 }, "object": "headwear", "confidence": 0.616 }, { "rectangle": { "x": 52, "y": 33, "w": 910, "h": 951 }, "object": "person", "confidence": 0.802 } ]

Tags	[ { "name": "man", "confidence": 0.999212 }, { "name": "headdress", "confidence": 0.99731946 }, { "name": "person", "confidence": 0.995057464 }, { "name": "clothing", "confidence": 0.991814733 }, { "name": "wearing", "confidence": 0.9827137 }, { "name": "hat", "confidence": 0.9691986 }, { "name": "helmet", "confidence": 0.9227209 }, { "name": "headgear", "confidence": 0.840476155 }, { "name": "personal protective equipment", "confidence": 0.8358513 }, { "name": "looking", "confidence": 0.832229853 }, { "name": "hard hat", "confidence": 0.8004248 }, { "name": "human face", "confidence": 0.785058737 }, { "name": "green", "confidence": 0.774940848 }, { "name": "fashion accessory", "confidence": 0.706475437 } ]

Description	{ "tags": [ "man", "headdress", "person", "clothing", "wearing", "hat", "helmet", "looking", "green", "jacket", "shirt", "standing", "head", "suit", "glasses", "yellow", "white", "large", "phone", "holding" ], "captions": [ { "text": "a man wearing a helmet", "confidence": 0.8976638 } ] }

Image format	"Jpeg"

Image dimensions	1000 x 1000

Clip art type	0

Line drawing type	0

Black and white	false

Adult content	false

Adult score	0.0126242451

Racy	false

Racy score	0.0156497136

Categories	[ { "name": "people_", "score": 0.69140625 } ]

Faces	[ { "age": 37, "gender": "Male", "faceRectangle": { "top": 419, "left": 363, "width": 398, "height": 398 } } ]

Dominant color background	"White"

Dominant color foreground	"White"

Accent Color	#90A526
```

(Note, the above analysis may change in the future: the Computer Vision model is
updated regularly.)

Note that in the first "Objects" result, two objects "headwear" and "person" are
detected, and their locations in the image is given. The object we want to
detect is classified "headwear", but for our application we need a more specific
classification: "hard hat". However "hard hat" is not one of the object types
that Computer Vision currently detects. (We'll address this problem with Custom
Vision, later.) Also note that a confidence score is given for each object
classification.

The second "Tags" result gives a list of labels associated with the entire
image. The tag with the highest confidence (listed first) is "man", which
doesn't help us much. The second tag, "headdress", is not exactly what we are
looking for either.

The other responses are also interesting, but we won't focus on them for our
demo. But take a look at what's included:

* A caption for the photo ("a man wearing a helmet") in the Description field.

* Image features (is it black and white? a line drawing?)

* Details of any faces detected in the image (identified as a 37-year-old male in this case)

* A score for the content of the image: is it "Adult" or "Racy"?

* Color analysis for the image: the dominant foreground, accent, and background colors.

We're really only interested in the "Tags" field for our purposes, so we'll find
out how to extract that programmatically in the next section.

## Using Computer Vision via the API

You can [control Computer Vision programmatically using its REST
API](https://docs.microsoft.com/en-us/azure/cognitive-services/computer-vision/vision-api-how-to-topics/howtocallvisionapi?WT.mc_id=msignitethetour2019-github-aiml20).
You can do this from just about any language or application that has access to
the Web, but we will use [curl](https://curl.haxx.se/), a common command-line
application for interfacing with URLs and collecting their outputs. The curl
application comes pre-installed on most Linux distributions and in recent
versions of Windows 10 (1706 and later). 

Run the commands in the file [`vision_demo.sh`](vision_demo.sh). You can use a
local [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest?WT.mc_id=msignitethetour2019-github-aiml20)
or [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20), but you must use bash as the shell. (In the demo video, we
use Azure Cloud Shell within Visual Studio Code, via the [Azure Account
extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account).
Run the `Azure: Sign In` and then the `Azure: Open Bash in Cloud Shell`
commands, and note that Node.js 6 or later must be installed on Windows.)

The commands in this script will:

1. Log into your Azure subscription (this step is unnecessary if using Cloud Shell)
2. Create an Azure Resource Group
3. Create a Cognitive Service key. (Note: this is an omnibus key that we will also use for Custom Vision, later.)
4. Find the key
5. Use CURL to analyze two images

## Manually generating Keys for use with Computer Vision

In the script [vision_demo.sh](vision_demo.sh), run the section "Create a Key" to programmatically create a Cognitive Services key using the Azure Command Line Interface.
(If you prefer, you can [create keys interactively with the Azure
Portal](https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account?tabs=multiservice%2Clinux&WT.mc_id=msignitethetour2019-github-aiml20).)

## Next Step

[Custom Vision](DEMO%20Custom%20Vision.md)