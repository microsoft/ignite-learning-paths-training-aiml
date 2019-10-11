# AIML20: Speaker Notes

These are the notes for the PPT presentation at:
https://microsoft.sharepoint.com/:p:/t/CloudDevAdvocacy/EctuTXQCOdpGqc5lhQgUnMgBr-R6hlWR5MuLE3qCIFgoHA?e=r1szwF

Associated demo scripts are found at: https://github.com/microsoft/ignite-learning-paths/tree/master/aiml/aiml20. Start with `DEMO%20Setup.md`.

## Slide notes

Slides are identified by titles only for now. I'll add slide numbers when the deck is locked,.

### SLIDE: Microsft Ignite the Tour

Pre-presentation walk-in slide

### SLIDE: Using pre-built AI to solve business problems

Title slide. Add your own name and contact info here.

### SLIDE: Resources

All links in this deck will be included in the resources hub link. We'll show
this slide at the end, too.

### SLIDE: Adding humanlike capabilities to apps

This slide introduces this section, which is an overview of pre-built AI and cognitive services.

* What does that mean?

* Give your app the capability to see, like the power of vision

* How to speak and understand human language

* General perspective: Understand things in general like documents, data,
  identify what, what the data is about, like a human would  


### SLIDE: Enhance apps with humanlike capabilities

The purpose of this slide it to explain AI services by way of example. These are
services or features that previously required a human input, and can now be
automated.

There are lots of things you might want to do when it comes to enhancing apps

- like adding a conversational interface, example a chat bot, we could do that
  with text or audio and talk with our bot

- working with images and image data, example taking a picture and generating a
  caption, or search through photos based on content over their filename, e.g
  all the pictures of dogs

- using human intuition and rearrange interface based on what the user "seems"
  to want to do, guide them based on business needs

- translating content but also understanding the user 

- working with raw data, this is about learning to identify spikes and realize
  that a computer can do that for us and perhaps even do it better?

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

* Speech: Understand and recognize speech, and generate natural, humanlike
  spoken voice.

* Language: Understand the content of written documents and text, and translate
  between human languages.

* Decision: make humanlike choices about data, content, and application user
  interfaces.

* Search: answer natural language questions about the content of large,
  unstructured repositories. 

### SLIDE: Azure Cognitive Services (with service names)

The "Search" category was covered in AIML10. In this talk, we're going to touch
on just a few of the other available services, and use them to enhance the
website of a retailer:

Computer Vision: analyze the content of product photographs

Custom Vision: identify the products that the retailer specifically sells

Personalizer: adapt the layout of the website to meet customer preferences and corporate goals

But the principles of setting up and using Cognitive Services are the same for all the APIs, so what you learn here today applies to any AI service you want to use.

### SLIDE: Computer Vision

Let's look at how we can give an application the ability to see, and then customize it to our particular needs.

### SLIDE: Shop By Photo

Tailwind Traders, a fictious retailer, has a "Shop by Photo" feature in its website.

The idea is that customers can upload a picture of a product they are looking for, find out if Tailwind Traders stocks that item, and locate it in the store.

Unfortunately, it doesn't work very well...

### SLIDE: Demo: Shop by Photo

DEMO: "Defining the problem: Shop by Photo is broken"

### SLIDE: How Computer Vision Works

Now, let's dive down into the details of how computer vision systems actually work. 

### SLIDE: Tasks (XKCD comic)

Not long ago, being able to give a computer a photograph and it being able to
give us useful information about what’s in the picture was the stuff of science
fiction. This XKCD was published in September, 2014. Now, five years later,
a computer can easily tell whether a photo is of a bird, thanks to the advent of
big data, GPU computing, and convolutional neural networks.

### SLIDE: How Neural Networks Work (Brandon Rohrer)

This explanation is adapted with permission from Brandon Rohrer, who maintains
an excellent blog and video tutorial series with in-depth explanations of many
aspects of AI and machine learning. Check out Brandon's blog for more details;
I'll only have time for a sketch here.

### SLIDE: Computer Vision / Convolutional Neural Network

You've probably heard that AI is powered by something called "Deep Learning".
The "Deep" in "Deep Learning" doesn't mean "profound", it simply means that
there are many the image passes through a neural network with many layers when
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
range.

To apply the grid of weights to the image, we overlay it, and multiply each
weight by each pixel value, and take the average. That average becomes the
corresponding pixel in the output image, aligned to the center pixel of the
weights grid.

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

We'll do that with training data: lots of images of dogs, bicycles, appes and
tennis balls. We know what each image represents (because a human has looked at
them and labeled -- or "annotated" them), so all we do is pick weights in such a
way that the correct node gets the largest value in each case, or at least as
often as possible.

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
that do this, and you'll hear more about that in the later talks in this
learning path. 

Secondly, even then, to make use of those tools you'll need: lots of training
data, those powerful computing resources, and a team of AI engineers to make use
of it all. Instead, you can just use the resources of a project or company that
has already used lots of data and compute and expertise to train a neural
network, and just use that.

### SLIDE: Pre-Trained Convolutional NN

So, you can just use the model with the pre-determined weights, and as long as
you only need to detect the object classifications the model is trained for,
you're all set to go. Just provide your image, and use the classifications that
the pre-trained model generates. 

Some models do more than just classify, too: they can also detect the location
of objects within images, or analyze the image in other ways.

### SLIDE: Demo: Cognitive Services Computer Vision

Now let's try a pre-trained AI model: Cognitive Service Computer Vision. This
service will analyze an image you provide, and provide tags (classifications)
for the object types it things it represents: basically, the labels associated
with the top confidence scores at the right of the convolutional neural network
from before.

There's a simple web-based UI you can use to try it out at
aka.ms/try-computervision, so let's try it out now. In a moment, I'll also show
you how to access the API programatically.

DEMO: Using Computer Vision via the Web interface

If you want to incorporate vision capabilities into an app, though, you'll want
to access the Computer Vision API programatically. Let's see how.

DEMO: Using Computer Vision via the API

So, now you understand why the Shop by Photo feature for Tailwind Traders isn't
working. The vision model it's using isn't trained to identify the specific
products that Tailwind Traders sells, or, more likely, it's been trained to
detect *too many* different kinds of objects, and the wrong one is being found.
For example, we upload a picture of a hard hat, but it searches instead for
pictures of hammers.

Fortunately, we can fix that problem. Let's dive back into the theory for a moment.

### SLIDE: Adapting Computer Vision models with your own data

There's a way to start with a vision model that's been pre-trained to identify
many thousands of images, and adapt it to identify just the objects you're
interested in -- even if those objects weren't part of the training data for the
original model! That sounds strange, I know, but let's see how it might work.

### SLIDE: Transfer Learning

Here we have the trained convolutional neural network from before, but
something's different: the final layer with the object classifications have been
stripped off. What we're left with is the images -- 3x3 images, perhaps -- from
the second-last layer. We can ignore the fact that they are images, and just
think of them as data. Now, when we feed an image to the left hand side, instead
of getting confidence scores, we get a collection of arrays, or "features", each
with 9 data points. (In this toy network, they are labelled F1, F2, ... up to
F8.) Each image you put in on the left side generates a different collection of
features on the right side.

We don't really know what those features *are*, but what we do know is that they
are useful -- beacuse they were useful to classify all of the image types the
neural network was originally trained for. Who knows: one feature might
represent "greenness", and was useful to classify trees and tennis balls.
Another might count the number of circle-shaped regions in the image, and was
useful in classifying bicycles and traffic lights. The point is: those features
weren't defined in advance: they were _learned_ from the training data, and are
useful for classifying images _in general_. 

And there's a trick we can use, to use those features to classify objects that
the original network wasn't even trained on.

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

### SLIDE: Transfer Learnng Trained Model

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

DEMO: Custom Vision

### SLIDE: Portable Deep Learning Models

We exported our custom model in the ONNX format.

ONNX, or Open Neural Network Exchange, is a community project launched by
Microsoft and Facebook to promote the free exchange and deployment of AI models,
and supported by a wide range of applications and technology vendors.

Now that we've trained our custom vision model, let's integrate it into the
Tailwind Traders app.

### SLIDE: OnnxImageSearchTermPredictor.cs

Now that we've created our custom model, we can call it in the app using its API. Here we create a new "Inference Session" from the ONNX file we generated, and then generate a classification label as a string. Then we just pass that into the existing search feature of the TWT App and display the results.

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

### SLIDE: Reinforcement Learning

Personalizer implements an AI technique called Reinforcement Learning. Here's
how it works.

Suppose we want to display a "hero" action to the user. The user might not be
sure what to do next, but we could display one of several suggestion. For a
gaming app, that might be: "play a game", "watch a movie", or "join a clan".
Based on that user's history and other contextual information -- say, their
location, the time of day, and the day of the week -- the Personalizer service
will rank the possible actions and suggest the best one to promote. 

Hopefully, the user will be happy, but how can we be sure? That depends on what
the user does next, and whether that was something we wanted them to do.
According to our business logic, we'll assign a "reward score" between 0 and 1
to what happens next. For example, spending more time playing a game or reading
an article, or spending more money in the store, might lead to higher reward
scores. Personalizer feeds that info back into the ranking system for the next
time we need to feature an activity.

### SLIDE: Discovering Patterns and Causality

But this isn't just recommender system, which has the danger of presenting the
user with things they know they already like. What about the things they would
like, but don't know about? Personalizer is usually in Exploit mode, where it
recommends the best activity based on history and context, but sometimes it also
enters Explore mode, and presents the user with new things they might not
otherwise see. You control what percentage of the time Explore Mode is
activated, to help the user discover new content or features.

### SLIDE: Personalizer for Tailwind Traders

For context, for anonymous users, we were using the time of day, day of week,
and browser OS to influence rankings. The reward was whether or not the hero
section was clicked. Over time, Personalizer will determine the best category to
feature based on time of day, day of week, and OS. It will also "explore" 20% of
the time, to surface categories that would otherwise not be presented.

### SLIDE: DEMO: Personalizer

DEMO: Personalizer

### SLIDE: Pre-built AI in Production

We've seen a few ways that you can use pre-built AI to enhance your applications
with humanlike capabilities. Let's wrap up with a few things you should keep in
mind if you plan to deploy these applications in a production app, possibly with
real-time capabilities for millions of users.

### SLIDE: Cost Considerations

This slide is intended to give a general overview of the "model" for pricing in
cognitive services. In general, if you just want to try out the service, small
volumes are free. Attendees should check the given link for exact pricing for
the service they want to use.

There are some things to think about:

* Cost is probably the first thing on your mind

* If you are new to Azure and want to play around with these services, you can
  sign up using the link right here and get $200

* So what can we use those credits on?

* If you are just trying things out like a "Developer would" that is small
  amounts of data, a few attempts here and there, that's generally FREE

* For production mode, that means we might have many users or our services are
  used frequently then you are being charged by volume and rate

* There are more details on pricing on this link, it might vary a little per
  service and region

### SLIDE: Data Considerations

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

You've seen how easy it is to integrate powerful AI capabilities into your
applications. But with great power comes great responsibility, and it's
critically important to understand the impact your application will have on
people, and consider the ethical implications.

If you're working with AI technogies, you should be working within an ethical
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

Key points:

* It's easy to add humanlike capabilities with pre-built AI. Pre-built models
  can't do everything, but they can get you a long way, quickly. We'll learn
  about custom models for the remaining 20% later in thus learning path.

* You don't need a lot of expertise to get started, but everyone needs to thing
  about the ethical implications of AI and how it affects people. Make sure you've developed an ethical framework for using AI, and stick to it.

* Finally, AI is powerful, but it isn't magic. It's driven by data and, at its
  core, fairly simple math. Always keep the data in mind, and use it to help you
  understand what's going on.


### SLIDE: Docs Alert

For all the details on Azure Cognitive Services, including getting started
guides and references, check out Microsoft Docs.

### SLIDE: MS Learn Alert

And if you'd like to learn how to use Cognitive Services, there are free courses
on Microsoft Learn that will take you through using them step-by-step.

### SLIDE: Resources

To find links to Docs and Learn, and to all the resources I've mentioned in this
talk, check out the Session Resources link on this slide. You can also run of
the demos I gave today yourself, using the code and scripts available in this
github repository. And if you'd like to get a Microsoft Certificaion in AI or
Data Science, theres a special offer for a free certificate for attendees today:
check out this link for details.

Thank you.
