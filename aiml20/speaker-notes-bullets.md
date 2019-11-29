# AIML20: Speaker Notes

If you prefer to work from bullet points instead of scripted text, here are the main points from each slide of the PPT presentation at:
[presentations.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/presentations.md)

Associated demo scripts are found at: https://github.com/microsoft/ignite-learning-paths/tree/master/aiml/aiml20. Start with `DEMO%20Setup.md`.

## Slide notes

Slides are identified by titles only.

### SLIDE: Microsoft Ignite the Tour

Pre-presentation walk-in slide

### SLIDE: Using pre-built AI to solve business problems

Introduce yourself.

How to add AI capabilities to applications, even if you don't have compute resources or AI expertise.

Using pre-built AI services in the cloud.

### SLIDE: Resources

We will provide lots of links, resources and demos.

Links to everything, including complete source code and a one-click deployment for the app, at the links here.

This slide will be shown again at the end.

### SLIDE: Adding humanlike capabilities to apps

We'll be using pre-built AI services to add humanlike capabilities to
applications, but what does that mean? Well, here are some examples.

### SLIDE: Enhance apps with humanlike capabilities

[CLICK] Give your app the power of speech (e.g. chat).
 
[CLICK] Give your app the ability to see (understand images).

[CLICK] Give your app intuition about human behavior (adapt interfaces).

[CLICK] Give your app the power of comprehension (communicate in any language)

[CLICK] Automate the human process of scanning streams of data for anomalies (and scale)

These are just a few examples.

### SLIDE: Overview of Azure Cognitive Services

Doesn't it take a lot of data, and a lot of technical expertise, to implement humanlike AI?

No. Draw on the expertise of Microsoft Research. Add capabilities with simple REST API calls. 

That's Azure Cognitive Services.

### SLIDE: Azure Cognitive Services

Azure Cognitive Services includes more than two dozen APIs.

Services within these categories of human capability:

Vision: Understanding the content of photographs, drawings, text and handwriting, and video

Speech: Tools to understand and recognize speech, and generate natural, humanlike spoken voice.

Language: Understand the content of written documents and text, and translate between human languages.

Decision: entirely new category for Azure Cognitive Services, about making humanlike choices about data, content, and application user interfaces.

Search: answer natural language questions about the content of large, unstructured repositories. 

### SLIDE: Azure Cognitive Services (with service names)

"Search" already covered. 

We use a few of the other available services to enhance a retail website: [CLICK]

Computer Vision: which we'll use to analyze the content of product photographs.

Custom Vision: which we'll use to identify the specific products that our retailer sells.

Personalizer: which will automatically adapt the layout of our website 

But the principles of setting up and using Cognitive Services are the same for all the APIs, so what you learn here today applies to any of the AI services you want to use.

### SLIDE: Computer Vision

First, let's look at pre-built AI for Computer Vision.

### SLIDE: Shop By Photo

This is the website for Tailwind Traders, a hardware retailer (and a fictitious company). 

### SLIDE: Demo: Shop by Photo

DEMO: "Defining the problem: Shop by Photo is broken"

### VIDEO: Shop by Photo

Let's go to the live Tailwind Traders website. [CLICK]

One of the AI-enabled features is called "Shop by Photo". This feature that
allows the customer to upload a photo of a product they might want to purchase,
and the idea is that the app will tell them if the product is available. Let's
go ahead and try it now. We'll upload this picture of a drill that we're
interested in, and the Tailwind Traders app analyzes the picture, recognizes
that it's a drill, and shows me the drill that Tailwind Traders has for sale,
and where to find it in the store.

But let's try that with a different picture. Let me return to the homepage, use
the "Shop by Photo" feature once again, and this time choose this picture of a
pair of pliers. Unfortunately, when the app analyzes that picture, it thinks
it's a hammer. It's obviously not working very well, so now let's see if we can
figure out what went wrong, find a way to fix it using computer vision. 

### SLIDE: How Computer Vision Works

We will go into a bit of theory now. Not much math.

Helpful to understand what can go wrong and how to fix it.

### SLIDE: Tasks (XKCD comic)

(Pause 10 seconds)

A computer understanding a photo used to be literal science fiction.

Now 5 years later, it's not just possible, it's easy.

### SLIDE: How Neural Networks Work (Brandon Rohrer)

Adapted with permission from Brandon Rohrer.

Check out his blog for video tutorials series with in-depth explanations of many
aspects of AI and machine learning. 

### SLIDE: Computer Vision / Convolutional Neural Network

AI is powered by "Deep Learning", but "Deep" does not mean "profound".

This is a simple NN. Real-word ones have many more layers.

It's designed to detect just five objects. It can't recognize anything else.

### SLIDE: Trained Convolutional NN

Input image goes in on the left. 

Each node processes and recombines the original images, shrinking them down, until
at end is a single value: the classification confidence.

Here the input is a bicycle, and the node at the right with the highest value is
"bicycle". The image has been correctly identified.

### SLIDE: Filters (1)

Skipped for time.

### SLIDE: Filters (2)

Skipped for time.

### SLIDE: Filters (3)

Skipped for time.

### SLIDE: Training an image classifier

But how do you train a NN to do that?

[CLICK] By choosing the right filters. Each filter is controlled by a small grid of weights (usually 3x3 or 5x5).

[CLICK] We choose the weights by using lots of training images where the
classification is known. Choose the weights so that the correct classification is chosen (or at least most of the time)

In real vision networks, there may be millions of weights to choose. How will we determine the
weights?

### SLIDE: Learning: Backpropagation

This is where the heavy math comes in.

But unless you're an AI engineer, you don't need to care. You can just use networks with weights optimized by others.

That covers probably 80% of applications. But if you do need to design your own NN and optimize weights, there are tools for that, like Tensorflow and PyTorch. Hear about those in AIML40 and AIML50.

### SLIDE: Pre-Trained Convolutional NN

But as long as you have access to an NN that can detect the images you need, you
can just provide your image, and the network will classify it for you.

Some models do more than just classify: detect the location
of objects, or analyze the image in other ways.

### SLIDE: Demo: Cognitive Services Computer Vision

Cognitive Services Computer Vision provides a powerful NN that can classify many thousands of objects.

Simple web-based UI you can use to try it out at aka.ms/try-computervision

Let's try it now.

### VIDEO: Computer Vision via web

[CLICK] This is the Cognitive Services Computer Vision page. If you scroll down
a little bit on that page, you’ll find a nice web-based form that allows us to
upload an image for analysis, either from the web or as a local file. So let’s
try uploading this picture of a man in a hard hat. In just a few seconds we’ll
get back the analysis of that picture by the Computer Vision service. On the
left, it shows us the objects detected in the image, and on the right we have
the JSON output with the detailed analysis. That includes the names and
locations of the objects detected in the image, a list of tags or labels
associated with the image, a plain-language description of the image (in this
case, “a man wearing a helmet”), and lots of other useful information.

### SLIDE: Cognitive Services Computer Vision

Look in Objects: two objects detected. Headwear, and Person.

Look at Tags. Highest confidence: man. Next is Headdress. Helmet is only 6th.
Model not trained for "hard hat" specifically.

We'll learn how to fix that in just a moment.

If you want to incorporate vision into an app you can access API programmatically. Let's see how.

### VIDEO: Computer Vision via CLI

You can interface to the Cognitive Service APIs using any language that can
connect to an HTTP endpoint, but what I have here [CLICK] is a bash script that
uses the Azure CLI to create resources, and connects to the Computer Vision API
using "curl". You can install the Azure CLI in your local shell, but here I am
using the "Azure Account" extension in Visual Studio Code to launch a Cloud
Shell, which means I don't have to install anything. Once that shell is ready, I
can execute commands directly from this bash script. 

This first command creates a resource group, which I'll use to hold the keys I
need to authenticate the API.

The next step is to create the keys. Here I'm creating an omnibus Cognitive
Services key which I can use with many services including Computer Vision.

Then, we can display the key directly in the terminal. [WAIT] You can use either
of these keys to interface with the API, so I will save the first one here in an
environment variable.

With that key, we can connect to the endpoint URL provided by the Computer
Vision service, so let's save that URL in an environment variable as well.

And then you can choose an image to analyze. Here we provide the URL of an
image, the same image of a man in a hard hat that we looked at a moment ago.

Now we can pass the key and the image URL into the endpoint by passing in a JSON
input using curl. And in just a few milliseconds we get back the analysis of the
image as JSON. You can see the same outputs we saw in the web interface a moment
ago.

We can do that with any image we like, of course. Let's try that again with a
different image, in this case the picture of a drill. Once again, we can pass
that to the API using curl. [WAIT] Interestingly the top tag associated with
this image is "camera", which sadly wouldn't help us search for the actual tool
-- we would want "drill".

### SLIDE: Adapting Computer Vision models with your own data

Computer Vision API won't work for Shop by Photo. 

Trained to detect too many kinds of objects.

Fortunately, we can fix that problem. Let's dive back into the theory for a moment.

There's a way to adapt a model for thousands of objects, and adapt it to detect
only object you want. EVEN if they weren't part of the original model. 

Let's see how, using an AI technique called Transfer Learning. 

### SLIDE: Transfer Learning

Same CNN as before, with last layer stripped off.

Second last layer gives "features" - think of as a vector of numbers. Each image generates a different set of features.

Don't know what the features represent, but they are useful in general for classifying images.

Trick: we can use those features to classify a new set of objects.

### SLIDE: Transfer Learning Training (1 - with the hammer)

Use transfer learning to create a model to identify hammers and hard hats.

Pass a picture of a hammer, collect features. And a binary indicator for "hammer". Repeat for lots of hammers.

### SLIDE: Transfer Learning Training (2 - with the white hard hat)

Now do the same with pictures of hard hats.

In each case, collect 8 data vectors and a binary indicator for each image.

Put it all together, you have a collection of data vectors, each
with an associated a binary outcome. 

With this you can make a simple predictive model.

### SLIDE: Transfer Learning Trained Model

This works surprisingly well.

You don't need a lot of images or computing power.

This is a toy example but the principle applies to large models too.

### SLIDE: Microsoft Cognitive Services Custom Vision

You don't have to train a transfer learning model yourself.

Use one of Microsoft's pre-trained vision models and adapt it with images of your own objects, with Custom Vision.

Let's try use it now to build a vision model for Shop by Photo.

### SLIDE: Demo: Customized object recognition

Demo instructions: https://github.com/microsoft/ignite-learning-paths/blob/master/aiml/aiml20/DEMO%20Custom%20Vision.md

### VIDEO: customvision.ai

[CLICK] So here I am in the Custom Vision web-based interface. It provides us with a
nice UI where we can provide new images for the transfer learning analysis. And
you can see in this project I've already uploaded a number of pictures. I've
uploaded pictures of screwdrivers, pliers, drills, and hammers, which I'm going
to use to train my custom model. We'd also like to detect one other product that
Tailwind Traders sells: hard hats. So let's click "add images", browse to a
folder on my hard drive where I've collected a few photos of hard hats, select
them all, and add them to the service while providing the label "hard hat" to
use in training.

It will take a few moments to upload those files, but while it's doing that,
notice that there aren't that many images in this project: about 180, or a few
dozen for each of the five categories. Sometimes even less. Despite that,
because my five object types are fairly distinct, the model should work fairly
well.

So let's go ahead and click the Train button to start transfer learning. We'll
choose Quick Training. Now it's running all those images through a complex
vision model, and using transfer learning to create a predictive model for our
five categories. It only takes a few seconds, and our model does fairly well!
The probability threshold sets a limit below which we will predict no
classification at all. If we only accept classifications with 50% confidence or
more, 90.9% of those predictions are correct: that's "Precision". And the model
correctly classifies 88.2% of our images overall: that's "Recall". In your apps,
you will choose a threshold according to your tolerance for making the wrong
call, versus making no call at all. For Tailwind Traders we can set the
threshold on the low side, because it's not so big a deal to suggest the wrong
product to a customer. If this were a cancer detection app, you'd likely make a
different call.

Now let's try out our model on some new images it hasn't seen before. We do that
by clicking on the “Quick Test” button. We will upload a new file from our "test
images" folder. Let's try our man in the hard hat. And you can see that our
prediction is indeed of a "hard hat" with probability 99.9%, so we'd make that
call with pretty much any threshold we choose.

Let's try a different image: the drill. Our model identifies the image as a
drill with probability 94.5%. And lastly, let's try the picture of the pliers,
which it identifies with 99.9% confidence.

So our model works well, even though it's been trained on less than 200 images.
That's because we've constrained the potential labels to only those products we
sell at Tailwind Traders.

Now that we're happy with our model, we can export it and incorporate it into
our app. If you click on the Export button, you can export the model for iOS or
Android, as a container, or in our case in the universal ONNX format. So now we
have downloaded the model to the hard drive.

### SLIDE: Portable Deep Learning Models

We exported our custom model in the ONNX format.

ONNX, or Open Neural Network Exchange, is an open standard launched by Microsoft
and Facebook to promote the free exchange and deployment of AI models, and
supported by a wide range of applications and technology vendors.

We used ONNX Runtime to integrate the exported model into the website.

### SLIDE: ONNXImageSearchTermPredictor.cs

InferenceSession refers to the exported .onnx file

Model generates a classification label, which gets passed to search.

### SLIDE: DEMO: ONNX

DEMO: ONNX Deployment

### VIDEO: Kudu

[CLICK] The model that we just exported from Custom Vision is actually a ZIP file,
containing the actual ONNX file, model.onnx, which is the text representation of
the neural network we just created, and also a manifest file. 

The existing Tailwind Traders website already uses a computer vision model
represented as an ONNX file called products.onnx. The problem is, that model
doesn't properly recognize many of the products we sell at Tailwind Traders. So
we'll take the model.onnx file we just exported from Custom Vision, rename it as
products.onnx, and replace it in our web app, so that Shop by Photo can
recognize all five products we trained it on.

Here in the Azure Portal you can see the App Service resource which runs the
Tailwind Traders website. What I can do now within this App Service is go to the
Development Tools section and choose the Advanced Tools feature. This launches
the Kudu interface. Now that's launched, I can browse through the website
filesystem using the debug console. Let's browse to site, w-root, Standalone,
OnnxModels, where the products.onnx file is located. Now we can replace it with
the new version of the products.onnx file we created with Custom Vision.

Now, returning to the App Service, we can go ahead and restart the web server,
which will make it use the new ONNX model in the Shop by Photo Feature.

### VIDEO: Netron

[CLICK] While we're waiting for the website to restart, lets take a look inside the ONNX
model we just installed. There's a nice little web app by Lutz Roeder called
Netron, which allows us to inspect the neural networks in ONNX files. So let's
go ahead and open that products.onnx file. Here you can see the actual layers of
the neural network represented by the model. Let's zoom in a little bit and take
a look at the input at the top. The input is an image. It's a 3-layer RGB image,
of size 224x224 pixels. I actually had to crop and scale down the image provided
by the user before providing it to ONNX runtime. It's a bit of a dirty secret
that computer vision systems have rather poor vision -- they work with quite low
image resolutions -- but nonetheless still work quite well.

Now let's zoom out and scroll through the network. You can see all of the layers
in the neural network created by the custom vision, each layer transforming the
input image, applying filters and recombining the output images, just as you
learned earlier in this talk. But when you get down to the output layer at the
very end, you can see that the output is a list of five values -- the five
products we trained it on: hammer, hard hat, and so on -- along with this value
labelled "loss" which is the confidence the model predicts for each category. In
your app, you'll choose your own threshold for how high the confidence needs to
be.

Anyway, now that the Tailwind Traders website has restarted, let's go back to
the homepage and see how our new vision model works. Let's go ahead and upload a
photo, and try once again one of our test images, specifically our image of
pliers that didn't work well before. We can see that indeed, rather than
thinking it was a hammer, the website has searched for "pliers" and shown me all
the products on offer.

### SLIDE: Optimizing App UI with Cognitive Services Personalizer

Time for one more quick example: Personalizer.

The "Personalizer" service allows us to customize the interface of apps in real-time by learning from user behavior.

### SLIDE: Recommended (screenshot)

Recommended section shows one large "hero" image, coupled with a few smaller images.

Personalizer will select the order sections appear

Uses an AI technique called "reinforcement learning".

### SLIDE: Personalizer in Action

Personalizer has been in development at Microsoft for many years. 

Used on XBox and in Bing and MSN News.

Now you can use Personalizer in your own apps, as well.

### SLIDE: Reinforcement Learning

Personalizer implements an AI technique called Reinforcement Learning. Here's
how it works.

[CLICK] Suppose we want to display a "hero" action to the user. [CLICK] The user
might not be sure what to do next, [CLICK] but we could display one of several
suggestions. For a gaming app, [CLICK] that might be: "play a game", "watch a
movie", or "join a clan". [CLICK] Based on that user's history and other
contextual information -- say, their location, the time of day, and the day of
the week -- the Personalizer service will [CLICK] rank the possible actions and
[CLICK] suggest the best one to promote [CLICK]. 

Hopefully, the user will be happy [CLICK], but how can we be sure? That depends
on what the user does next, and whether that was something we wanted them to do.
According to our business logic [CLICK], we'll assign a "reward score" between 0
and 1 to what happens next. For example, spending more time playing a game or
reading an article, or spending more money in the store, might lead to higher
reward scores. [CLICK] Personalizer feeds that info back into the ranking system
for the next time we need to feature an activity.

### SLIDE: Discovering Patterns and Causality

Not just a recommender system.

Explore mode surfaces other options at a rate you specify.

Like real-time A/B testing.

### SLIDE: Personalizer for Tailwind Traders

Context: time of day, day of week, and browser OS  

Reward score: 1 if the featured category was clicked, and zero
otherwise.

Explore rate: 20%

### SLIDE: DEMO: Personalizer

[ClICK] Now, let's see Personalizer in action. Let's go back to the Tailwind
Traders homepage. What I didn't mention before is that in this Recommended
section, the ordering of the product departments is determined by Personalizer.
In this case, it's presenting the Electrical department as the hero image. We
can also see the "Explore" behavior if we refresh the website a few times.
Apparently Personalizer currently thinks that the Garden Center gets the best
engagement from anonymous users at this time of day using the browser and
operating system that I am using here, but eventually it will try out different
categories -- here, plumbing has popped up, and Personalizer will use that to
measure engagement as well.

### SLIDE: Pre-built AI in Production

Wrap up with some considerations for putting AI into production.

### SLIDE: Cost Considerations

First consideration: cost. 

New to Azure? Use this link to sign up and get $200 in free credits.

[CLICK] Development-scale workloads generally free 

[CLICK] Production volumes is where charges will kick in

[CLICK] Specific details by service and region at this link

### SLIDE: Data Considerations

Think about where your data is going and how it will be used.

Data is uploaded for inference, but deleted immediately after use. Details at this link.

If bandwidth is an issue, or data is regulated, consider containers.

### SLIDE: Deployment with containers

Some services available in downloadable containers.

Install container behind your firewall, and none of your data goes to Microsoft.

Internet connection only used for billing. Charged at usual rate.

### SLIDE: Ethical Considerations

Most important slide.

Understand ethical implications of your AI apps affect people.

Have an ethical framework:

*enable* people to achieve more in what they already do (don't replace people)

Be *inclusive* of all types of user: make sure everyone can benefit equally  from your application, and

Be fair and transparent.

Remember what AI is only as good as the data it was trained on. Be sure that your application works for all of your potential users.

If you don't have an ethical framework set up, a great place to start is Microsoft's own principles for artificial intelligence, and you can read more at this link.

### SLIDE: Wrapping up

Pre-built models can't do everything, but they can get you a long way, quickly. 

AI is driven by data. Always keep the data in mind and what can go wrong.

Try it out! You don't need a lot of expertise, but think about ethical implications.

### SLIDE: Docs Alert

For all the details on Azure Cognitive Services, including getting started
guides and references, check out Microsoft Docs.

### SLIDE: MS Learn Alert

And if you'd like to learn how to use Cognitive Services, there are free courses
on Microsoft Learn that will take you through using them step-by-step.

### SLIDE: Resources

All links and code in the Github repository.

And if you'd like to get a Microsoft Certification in AI or Data Science, there's a special offer for a free certificate for attendees today: check out this link for details.

I'll be here to answer questions. (And at...)

Thank you.
