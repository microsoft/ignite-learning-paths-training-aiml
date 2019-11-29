# AIML20: Speaker Notes

These are the notes for the PPT presentation at: [presentations.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/presentations.md)

Associated demo scripts are found at: https://github.com/microsoft/ignite-learning-paths/tree/master/aiml/aiml20. Start with `DEMO%20Setup.md`.

## Slide notes

Slides are identified by titles only.

### SLIDE: Microsft Ignite the Tour

Pre-presentation walk-in slide

### SLIDE: Using pre-built AI to solve business problems

Welcome everyone, I’m \<name and affiliation\>. Today I’m going to talk about
how you can add artificial intelligence capabilities to your applications,
without the need for massive amounts of computing power or even AI expertise.
We’ll do that by using pre-built AI services that are available in the cloud,
and even customize them for our specific needs.

(Replace your contact details on this slide.)

### SLIDE: Resources

In the talk today, I’ll include lots of links to information and resources, but
don’t worry if you don’t catch them during the presentation, because all of the
details are included on the Session Resources Hub shown here. There will also be
several demos, and you’ll be able to try them all out yourself because complete
source code, including a one-click button to deploy everything to Azure, is
available in this Github repository. I’ll show this slide at again at the end
of the presentation, too, so you might want to have your camera ready then.

### SLIDE: Adding humanlike capabilities to apps

We'll be using pre-built AI services to add humanlike capabilities to
applications, but what does that mean? Well, here are some examples.

### SLIDE: Enhance apps with humanlike capabilities

[CLICK] You could give your app the power of speech, say by adding a chat interface.
 
[CLICK] You could give your app the ability to see, and understand the content of images.

[CLICK] You could give your app the intuition to understand what your users are most
likely to want to do, and optimize your user interface automatically.

[CLICK] You could give your app the power of comprehension, and communicate with your
users whatever their spoken language.

[CLICK] Or, you could automate the human process of scanning streams of data for anomalies, and react accordingly.

These are just a few examples.

### SLIDE: Overview of Azure Cognitive Services

We've talked a lot about how AI techniques can help. But doesn't it take a lot
of data, and a lot of technical expertise, to implement?

No. You can draw on the expertise of Microsoft Research, which has used its
extensive data repositories and AI experts to create off-the-shelf AI services
in Azure for you to use via simple REST API calls. 

That's Azure Cognitive Services.

### SLIDE: Azure Cognitive Services

Azure Cognitive Services includes more than two dozen APIs, but at the broadest
level they offer capabilities within these cateegories of human capability:

* Vision: Understanding the content of photographs, drawings, text and
  handwriting, and video

* Speech: Tools to understand and recognize speech, and generate natural, humanlike
  spoken voice.

* Language: Understand the content of written documents and text, and translate
  between human languages.

* Decision: this is an entirely new category for Azure Cognitive Services, which
  is all about makinghumanlike choices about data, content, and application user
  interfaces.

* Search: answer natural language questions about the content of large,
  unstructured repositories. 

### SLIDE: Azure Cognitive Services (with service names)

The "Search" category was covered in the previous talk in this learning path,
AIML10. In this talk, we're going to touch on just a few of the other available
services, and use them to enhance the website of a retailer: [CLICK]

Computer Vision: which we'll use to analyze the content of product photographs.

Custom Vision: which we'll use to identify the specific products that our retailer sells.

and Personalizer: which will automatically adapt the layout of our website by
observing customer preferences and present the best product categories first,
even for anonymous users.

But the principles of setting up and using Cognitive Services are the same for all the APIs, so what you learn here today applies to any of the AI services you want to use.

### SLIDE: Computer Vision

First, let's look at pre-built AI for Computer Vision, and how we can use to
give an application the ability to see, and then customize it to our particular
needs.

### SLIDE: Shop By Photo

This is the website for Tailwind Traders, a hardware retailer. The Tailwind
Traders website has many of the usual e-commerce features: the ability to browse
the product catalog, order products online, and find products in retail stores.
But it has a few AI-enabled features too, as we'll see.

As you might have guessed, Tailwind Traders is a fictitious company, but that
means I can give you all of the source code to deploy this app yourself. You can
find it at the link at the bottom of this slide.

### SLIDE: Demo: Shop by Photo

DEMO: "Defining the problem: Shop by Photo is broken"

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

But before we do that, it's going to be helpful to dive into a bit of theory to
understand how computer vision works. Don't worry though: there will be very
little math, and understanding a bit about how computer vision works will help
us understand what can go wrong, and how to fix it.

### SLIDE: Tasks (XKCD comic)

(Pause 10 seconds)

Not long ago, being able to give a computer a photograph and it being able to
give us useful information about what’s in the picture was literally the stuff of science
fiction. This XKCD was published in September, 2014. Now, five years later, a
computer can easily tell whether a photo is of a bird, thanks to the advent of
big data, GPU computing, and convolutional neural networks. Let's see how.

### SLIDE: How Neural Networks Work (Brandon Rohrer)

This explanation is adapted with permission from Brandon Rohrer, who maintains
an excellent blog and video tutorial series with in-depth explanations of many
aspects of AI and machine learning. Check out Brandon's blog for more details;
I'll only have time for a sketch here.

### SLIDE: Computer Vision / Convolutional Neural Network

You've probably heard that AI is powered by something called "Deep Learning".
The "Deep" in "Deep Learning" doesn't mean "profound", it simply means that
the image passes through a neural network with many layers when
it's being analyzed. That's it.

On your screen is a very simple Neural Network. This one only has five layers;
real-world vision systems have many dozens of layers, perhaps hundreds. This one
is designed to take an image as input, and then classify that image as one of
exactly four objects: dog, bicycle, apple, and tennis ball. That's it: it is not
capable of detecting any other kind of object except those it's been trained to
recognize.

### SLIDE: Trained Convolutional NN

When a Neural Network has been trained, it passes the input image through the
network layer by layer, at each layer transforming the image into different,
smaller images. Each layer recombines the images genrated in the prior layer,
and the images get smaller and smaller until at the very end they are just a
single pixel with a value between 0 and 1. That value represents the confidence
the Neural Network has that the image represents the given object: they higher
the number, the more confident it is.

In this case, we've inputted an image of a bicycle and the "bicycle" node at the
right side is the one with the highest value. So it looks like this neural
network has been well-trained to detect bicycles (or at least this one). But how
do you "train" a neural network, and how is the image being transformed along
the way?

At each node of the network -- each circle -- a filter is applied to the image.
It's much the same idea as a Snapshot filter or an Instagram filter, but instead
of doing something useful like making the image sepia toned or adding bunny ears
to all the faces, it's doing something ... different ... that was decided in the
training process. Let's dive in to see what that is.

### SLIDE: Filters (1)

Let's consider a simple image. This is an image of a cross. It's 9 pixels by 9
pixels, and white is "+1" and black is "-1". We're going to apply a filter to
this image, like what happens at each of the nodes in the neural network.

### SLIDE: Filters (2)

To transform this image, we'll apply a 3x3 grid of weights. Small grids like
this are commonly used in computer vision systems: sometimes 3x3, sometimes 5x5,
and with weights determined in the training process. This grid only uses the
weights -1 and 1, but typically they will look more like random numbers in that
range. [CLICK]

To apply the weights to the image, we overlay the grid of weights, centered on a
particular pixel in the image. [CLICK] Then, we multiply each weight by each
pixel value, and take the average. That average becomes the corresponding pixel
in the output image, aligned to the center pixel of the weights grid.

You've probably noticed we can't use the edges of the input image as center
pixels, which is why the output image is smaller than the input by two rows and
two columns. This (along with other types of transformations) is why the image
gets smaller and smaller as we go down the layers, until it's only one pixel in
size.

### SLIDE: Filters (3)

Let's shift the weights grid two pixels down and to the right. Now when we
multiply the weights by the source pixels and take the average, we get a
different output pixel (.55). The Neural Network sweeps the weights across the
rows and columns of the source image to create the pixels in the output image.

By the way, that process of sweeping the filter across the image has a complex
name for a simple mathematical operation: convolution. That's why they call them
Convolutional Neural Networks.

### SLIDE: Training an image classifier

So, now we know: each node (circle) in the neural network is a transformation of
its input images, which is determined by a grid of weights. The trick to
training a neural network is to choose those weights in such a way that the
right numbers come out at the end.

[CLICK] We'll do that with training data: lots of images of dogs, bicycles,
appes and tennis balls. We know what each image represents (because a human has
looked at them and labeled -- or "annotated" them), so all we do is pick weights
in such a way that the correct node gets the largest value in each case, or at
least as often as possible.

But in real vision networks, there may be millions of weights to choose, and
millions of labelled images to compute against. How will we determine the
weights?

### SLIDE: Learning: Backpropagation

This is the point where most books on machine learning dive into the math, and
start talking about things like "backpropagation" and "learning rate" and "cost
function". But unless you're an AI researcher, you can ignore all that, for two
reasons.

First, there are lots of great tools available that will do all that math for
you, while taking advantage of powerful computing resources like big data stores
and GPU processors. You've probably heard of tools like Tensorflow or Pytorch
that do this, and you'll hear more about them in the later talks in this
learning path. 

Secondly, even then, to make use of those tools you'll need: lots of training
data, those powerful computing resources, and a team of AI engineers to make use
of it all. Instead, you can just use the resources of a project or company that
has already used lots of data and computing and expertise to train a neural
network, and use that through an API.

### SLIDE: Pre-Trained Convolutional NN

So, you can just use the model with the pre-determined weights, and as long as
you only need to detect the object classifications the model is trained for,
you're all set to go. Just provide your image, and use the classifications that
the pre-trained model generates. 

Some models do more than just classify, too: they can also detect the location
of objects within images, or analyze the image in other ways.

### SLIDE: Demo: Cognitive Services Computer Vision

Now let's try a pre-trained AI model: Cognitive Service Computer Vision. This
service will analyze an image you provide, and provide tags (or classifications)
for the objects it detects. These are just the labels associated with the top
confidence scores at the right of the convolutional neural network from before,
but now you're using a powerful neural network from Microsoft, capable of
identifying many thousands of objects.

There's a simple web-based UI you can use to try it out at
aka.ms/try-computervision, so let's try it out now. In a moment, I'll also show
you how to access the API programatically as well.

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

We can see here in the Objects section of the output that two objects have been
detected in the image: and some headwear, and a person.

We're more interested in the "tags" section, which provides classifications for
the overall image along with confidence scores. In this case, the classification
with the highest confidence, after "man", is "headdress" which isn't exactly
what we need for the Shop by Photo app: we were looking for "hard hat".
Unfortunately, this API isn't trained to detect hard hats, only helmets, and
that's only the 6th most confident classification here. We'll learn how to fix
that in just a moment.

But if you want to incorporate vision capabilities into an app, rather than
using a web form, you'll want to access the Computer Vision API programatically.
Let's see how.

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

Now we can pass the key and the image url into the endpoint by passing in a JSON
input using curl. And in just a few milliseconds we get back the analysis of the
image as JSON. You can see the same outputs we saw in the web interface a moment
ago.

We can do that with any image we like, of course. Let's try that again with a
different image, in this case the picture of a drill. Once again, we can pass
that to the API using curl. [WAIT] Interestingly the top tag associated with
this image is "camera", which sadly wouldn't help us search for the actual tool
-- we would want "drill".

### SLIDE: Adapting Computer Vision models with your own data

So, now you can see why the Computer Vision API might not be the best choice for
the Shop by Photo feature at Tailwind Traders. In some cases, the vision model
it's using isn't trained to identify the specific products that Tailwind Traders
sells. In other cases, it's been trained to detect *too many* different kinds of
objects, and the wrong one is being found. As you just saw, given a picture of a
drill, it gave us back the tag of "camera", a product that Tailwind Traders
doesn't sell.

Fortunately, we can fix that problem. Let's dive back into the theory for a moment.

What if I told you there's a way to start with a vision model that's been
pre-trained to identify many thousands of images, and adapt it to identify just
the objects you're interested in -- even if those objects weren't part of the
training data for the original model! That sounds strange, I know, but let's see
how it might work.

### SLIDE: Transfer Learning

Here we have the trained convolutional neural network from before, but
something's different: the final layer with the object classifications has been
stripped off. What we're left with is the images from the second-last layer. We
can ignore the fact that they are images -- say, 3x3 images -- and just think of
them as data. Now, when we feed an image to the left hand side, instead of
getting confidence scores, we get a collection of arrays, or "features", each
with 9 data points. In this toy network, they are labelled F1, F2, ... up to F8.
Each image you put in on the left side generates a different collection of
features on the right side.

We don't really know what those features *are*, but what we do know is that they
are useful, because they were useful to classify all of the image types the
neural network was *originally* trained for. Who knows: one feature might
represent "greenness", and was useful to classify trees and tennis balls.
Another might count the number of circle-shaped regions in the image, and was
useful in classifying bicycles and traffic lights. The point is: those features
weren't defined in advance: they were _learned_ from the training data, and are
useful for classifying images _in general_. 

And here's the trick: we can use those features to classify objects that the
original network wasn't even trained on.

### SLIDE: Transfer Learning Training (1 - with the hammer)

Let's suppose we want a new model to identify hammers and hard hats. We can pass
an images of a hammer on the left, and collect the features on the right. In
this case, we get 8 data vectors (one for each feature), and a binary indicator
of the object type. We can repeat that for several different pictures of a
hammer, and collect the data vectors and the binary indicator each time.

### SLIDE: Transfer Learning Training (2 - with the white hard hat)

Now let's do the same with pictures of hard hats. Again, in each case, we
collect 8 data vectors and a binary indicator for each image.

Put it all together, and what do you have? A collection of data vectors, each
with an associated a binary outcome. If you've done any data science, you can
guess what happens next: we could build a simple predictive model, like a
logistic regression or a one-layer neural network, to predict the new object
classifications from the features.

### SLIDE: Transfer Learning Trained Model

It turns out, this often works surprisingly well. You don't even need a lot of
data -- a few dozen images will often do the trick, as long as the categories
you want to predict are fairly distinct. And you don't need a lot of computing
power to predict a hundred or so binary outcomes from a relatively small amount
of data.

Of course, this is a toy example: you will likely want to identify more than two
objects, and the underlying neural network will certainly generate many more
than 8 features at its second-to-last-layer. But the principle remains: you can
do this with modest new data and computing power, and it often works really
well.

### SLIDE: Microsoft Cognitive Services Custom Vision

Of course, you don't have to train a transfer learning model by yourself. You
can use the advanced vision models from Cognitive Services Computer Vision as
the base, and provide your own images and classifications to the service called
Custom Vision.

Just like with Computer Vision, you can train transfer learning models
programatically using the API, but Custom Vision also provides a convenient Web
UI for training models. Let's use that now to train a model for the Shop by
Photo feature of Tailwind Traders.

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

Now that we've trained our custom vision model, let's integrate it into the
Tailwind Traders app. For that we'll use ONNX Runtime, an open-source inference
engine that provides functions to generate predictions from models in the ONNX
format.

### SLIDE: OnnxImageSearchTermPredictor.cs

Now that we've created our custom model, we can call it in the app using its
API. Here we create a new "Inference Session" from the ONNX file we generated,
and then generate a classification label from the uploaded image as a string.
Then we just pass that into the existing search feature of the Tailwind Traders
website and display the results.

```csharp 
var session = new InferenceSession(filePath);

...

var output = session.Run(new[] { input });
var prediction = output
    .First(i => i.Name == "classLabel")
    .AsEnumerable<string>()
    .First();
```

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

We've got time for just one more quick example of pre-built AI, this time from
the "Decision Category" of Cognitive Services. The "Personalizer" service allows
us to customize the interface of apps in real-time, balancing on what the user
is most likely to want to do, coupled with the things that *we would like* the
user to be doing.

### SLIDE: Recommended (screenshot)

We can see how this might work with the "Recommended" section of the Tailwind
Traders website. It shows a selection of the departments available in the store:
one is a large "hero" image, coupled with a few smaller images.

The Personalizer service will choose for us how those sections appear, according
to an AI technique called "reinforcement learning".

### SLIDE: Personalizer in Action

Personalizer has been in development at Microsoft for many years. It's used on
Xbox devices, to determine what activities are featured on the home page, like
playing an installed game, or purchasing a new game from the store, or watching
others play on Mixer. Since the introduction of Personalizer, the Xbox team has
seen a significant lift in key engagement metrics.

Personalizer is also used to optimize the placement of ads in Bing search, and
the articles featured in MSN News, again with great results in improving
engagement from users.

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

But this isn't just a recommender system, which has the danger of presenting the
user with things they know they already like. What about the things they would
like, but don't know about? Personalizer is usually in Exploit mode, where it
recommends the best activity based on history and context, but sometimes it also
enters Explore mode, and presents the user with new things they might not
otherwise see. It's kind of like an automated A/B testing system, but with more
than two branches, all tested in real time.

You control what percentage of the time Explore Mode is
activated, to help the user discover new content or features.

### SLIDE: Personalizer for Tailwind Traders

In our Tailwind Traders app, for anonymous users, we will use the time of day,
day of week, and browser OS as "context" to influence rankings. For the reward
score, we will use whether or not the hero section was clicked. In this code, we
provide a reward score of 1 if the featured category was clicked, and zero
otherwise.

Over time, Personalizer will determine the best category to feature for
anonymous users based on time of day, day of week, and OS. It will also
"explore" 20% of the time, to surface categories that would otherwise not be
presented.

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

We've seen a few ways that you can use pre-built AI to enhance your applications
with humanlike capabilities. Let's wrap up with a few things you should keep in
mind if you plan to deploy these applications in a production app, possibly with
real-time capabilities for millions of users.

### SLIDE: Cost Considerations

Probably the first thing you want to think about is: how much is all this going to cost?

[CLICK] If you are just trying things out like a "Developer would", that is small
amounts of data, a few attempts here and there, that's generally FREE. 

[CLICK] For production volumes, you will be charged by volume and rate,
according to the service you are using.

[CLICK] There are more details on pricing on this link. Check there for exact pricing
for your service and region

If you are new to Azure and want to play around with these services, you can
sign up using the link right here and get $200.

(This slide is intended to give a general overview of the "model" for pricing in
cognitive services. Attendees should check the given link for exact pricing for
the service they want to use.)

### SLIDE: Data Considerations

You also may want to think about where your data is going and how it will be
used.

Your data, like images or text, will be uploaded to Azure for inference, but
it's never stored by Cognitive Services. This link gives all the details about
privacy and regulatory compliance. But if you work in a regulated industry, like
medicine, where data cannot leave your firewall, there is another option:
containers.

### SLIDE: Deployment with containers

Some of Cognitive Services is available for use as an independent container. You
can simply download the container image, deploy it behind your firewall, and
then use the local endpoints it provides just like you do in Azure. The
difference is that data never leaves your own network. The only reason the
container connects to Azure is for billing -- usage is charged in exactly the
same way as in Azure itself.

### SLIDE: Ethical Considerations

I've saved the most important slide today for last. You've seen how easy it is
to integrate powerful AI capabilities into your applications. But with great
power comes great responsibility, and it's critically important to understand
the impact your application will have on people, and consider the ethical
implications.

If you're working with AI technologies, you should be working within an ethical
framework that:

* Focuses on *enabling* people to achieve more in what they already do, rather
  than replacing humans with AI

* Is *inclusive* of all types of users, so that everyone can benefit equally
  from your application, and

* Is fair and transparent, and in particular doesn't marginalize
  underrepresented groups. Remember what we learned earlier: AI is only as good
  as the data it was trained on, and you need to be sure that your application
  works for all of your potential users, regardless of who they are or
  what they look like.

If you don't have an ethical framework set up, a great place to start is
Microsoft's own principles for artificial intelligence, and you can read more at
this link.

### SLIDE: Wrapping up

It's easy to add humanlike capabilities with pre-built AI. Pre-built models
can't do everything, but they can get you a long way, quickly. We'll learn about
custom models for the remaining 20% later in thus learning path.

AI is powerful, but it isn't magic. It's driven by data and, at its core, fairly
simple math. Always keep the data in mind, and use it to help you understand
what's going on. In particular, remember that even the best AI can make
mistakes, especially about groups that aren’t well represented in the training
data.

Finally, try it out! You don't need a lot of expertise to get started, but
everyone needs to thing about the ethical implications of AI and how it affects
people, so make sure you've developed an ethical framework for using AI, and
stick to it.

### SLIDE: Docs Alert

For all the details on Azure Cognitive Services, including getting started
guides and references, check out Microsoft Docs.

### SLIDE: MS Learn Alert

And if you'd like to learn how to use Cognitive Services, there are free courses
on Microsoft Learn that will take you through using them step-by-step.

### SLIDE: Resources

To find links to Docs and Learn, and to all the resources I've mentioned in this
talk, check out the Session Resources link on this slide. You can also run all of
the demos I gave today yourself, using the code and scripts available in this
github repository. And if you'd like to get a Microsoft Certification in AI or
Data Science, theres a special offer for a free certificate for attendees today:
check out this link for details.

Thank you.
