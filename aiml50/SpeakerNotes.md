# Speaker Notes

## Slides

* Slide: # 1

* Slide: # 2
  * Machine Learning and DevOps are two hot buzzwords at the moment. Machine Learning is becoming more accessible to more organisations, but with that increased accessibility comes the need to manage our ML projects the same way we do the rest of our software.
  * MLOps, Machine Learning Operations, or DevOps for Machine Learning is the confluence of DevOps and Machine Learning, and that's what we're going to examine today.

* Slide: # 3
  * Before we get started, feel free to take a screenshot of this slide. You'll find this deck and all of the resources used in this presentation by visiting these links.

* Slide: # 4
  * When programming, we solve a problem by writing an algorithm
  * We run data (or input) through that algorithm and get an answer
  * Importantly, we know (or can work out) how to solve that problem
  * What happens when we don’t know what that algorithm looks like? E.g. is there a bird in the photo, or what is the probability that an applicant will default on a loan?

* Slide: # 5
  * These are the problems machine learning is good at
  * With machine learning, we solve these problems by flipping it around and providing a whole lot of examples of correct answers and corresponding input, and let the computer decide what that algorithm is

* Slide: # 6
  * What we’re doing is letting the computer build a “model” to describe that data

* Slide: # 7
  * What’s great about this, is we can use that model in place of the algorithm we would have written, had we known how.

* Slide: # 8
  * By using the model, we can get predictions
  * Note: these are predictions - not answers the way we’d think of it
  * The quality and accuracy of those predictions depends on the techniques and algorithms we used to train the model, and importantly - the data we used to train the model
  * If you’re using biased data to train the model, you’ll get a biased model

* Slide: # 9
  * [See Demo #1](./demos/1-Show_Faulty_Prediction.md)

* Slide: # 10
  * Let’s talk about the work that happens when creating a predictive model
  * Usually, there’s some data discovery, transformation, and preparation… some building of a model and training using that data… then an evaluation of the suitability of that model
  * This is a highly iterative, experimental process that might mean going back to the drawing board many times over, over a long period of time.
  * When it’s time to actually deploy a model, it’s often similar to the way we used to do software – package it up, and let the developers or operations team deploy it somehow

* Slide: # 11
  * The creation process often happens on a data scientist’s machine, or shared hardware for intensive training
  * And deployment quite often happens by passing USB drives around, or even by email.

* Slide: # 12
  * Let’s contrast this to a good devops process where we plan, develop and test, release to test then production environments, then monitor what happens in production…
  * But is DevOps just for software development? The algorithms we spoke about at the start?

* Slide: # 13
  * Let’s look at Microsoft’s definition of DevOps (read it).
  * The most important word here is “value”. DevOps is not about code or bug fixes, it’s about continuously delivering value.
  * If you have a predictive model, and you can make that model better – that is absolutely valuable.
  * So this definition doesn’t exclude ML.
  * Let’s look at a product that can help.

* Slide: # 14

* Slide: # 15
  * Azure Machine Learning Service is a set of services for helping your MLOps (or DevOps for ML) efforts.
  * You can get to it by going to ml.azure.com
  * Let’s drill into a few of the things it helps you manage

* Slide: # 16
  * Just list and describe as per the individual points

* Slide: # 17
  * We’re going to focus for the moment on Pipelines. Pipelines are workflows for training our models, and we want to build one so we can have a repeatable way to build our predictive model.

* Slide: # 18
  * You may have heard of Azure Pipelines, but it’s important to note these are different products.
  * We’ll talk about the differences in a minute, but at a high level, ML pipelines are good for training workflows, and Azure Pipelines are good for orchestration. They have different focuses.

* Slide: # 19
  * What’s the difference? Why use both?

* Slide: # 20
  * ML Pipelines are designed for ML-specific workflows.
  * Unattended runs – ML training can be very long-running, and ML pipelines can handle that extremely well
  * Reusability – individual steps in a workflow can be resource intensive, and may not need to be run every time. If your data prep step doesn’t need to be run again, you can just reuse the output from last time.
  * Tracking… - Everything that’s stored is focused on ML, rather than building general software

* Slide: # 21
  * By contrast, Azure Pipelines are really designed for CI/CD
  * Gates… - They’re a great place to build in quality and checks and balances
  * Integration – with other applications, artifacts, and dependencies
  * Triggers – You way want to trigger orchestration for any number of reasons

* Slide: # 22
  * While we’re building a pipeline, we’re really using most of these services

* Slide: # 23
  * Using Datasets or Datastores for training data, running an Experiment to train using managed Compute, then ending up with a Model.
  * We will deploy that model, but let’s come back to that.

* Slide: # 24
  * [See Demo #2](./demos/2-Build_a_Pipeline_With_Notebooks.md)

* Slide: # 25
  * So here’s what we built – the AML pipeline
  * Data prep

* Slide: # 26
  * Training step

* Slide: # 27
  * Registration of the model

* Slide: # 28
  * We also made use of a Dataset (or data source), and compute

* Slide: # 29
  * But let’s talk about working on a team for the moment.

* Slide: # 30
  * Some of the good DevOps practices we use in software development can also apply for ML projects – let’s talk about them.

* Slide: # 31
  * Jupyter Notebook files contain not just the input, but also the output. This can be confusing and make files difficult to merge. So we only want the input cells – the code that gets run.
  * We also want to define everything in our pipeline (which we are)
  * As well as infrastructure – like the compute – and any dependencies – python dependencies, libraries, etc.
  * And maybe some data – not the whole lot (because there can be many PB in ML projects), but maybe enough to try some proofs of concept

* Slide: # 32
  * A known shared data source means every data scientist is training against the same training data… and that training data is also being used to produce models

* Slide: # 33
  * Let’s talk about CI. We want to:
  * Know when code changes in our source repository
  * Refresh then execute our AML Pipeline if we’ve change the way we’re training
  * We also want to check code quality – it’s code, so we want tests, linting, etc.
  * We can also add PR processes to ensure code still compiles before merging into master (and kicking off a potentially expensive training job!)
  * If you want to know more about Azure DevOps, go here.

* Slide: # 34
  * The important point is – this is all code and software. The quality of your code matters even if it’s not what you’re used to writing!

* Slide: # 35
  * [See Demo #3](./demos/3-Show_The_Build_And_Release.md)

* Slide: # 36
  * But we still haven’t deployed anything – we have a newly trained model, so how do we deploy?
  * AML Service has the ability to take a model and deploy it to ACI or AKS – we are going to make use of it, but not directly from the UI here.

* Slide: # 37
  * We could just add another step to the AML pipeline, but we don’t want to do that – we want a bit more control over our deployment.

* Slide: # 38
  * Continuous Delivery can absolutely be applied to ML.
  * We’re going to use Azure Pipelines for our Continuous Delivery.
  * When a new model is registered, we’ll kick off our deployment
  * With Azure Pipelines, We can deploy to test and staging sites before putting our new model live
  * We can run tests in pre-prod environments
  * Importantly – what we’re doing is controlling our rollout using the same techniques we use for the rest of our software.

* Slide: # 39
  * Don’t just put new models in production – you wouldn’t do it with the rest of your software, why do it with your ML?

* Slide: # 40
  * Here’s what we’ve created:
  * A pipeline for training, which is an AML pipeline – specific to training our model
  * When we get a new model, we kick off a deployment pipeline in Azure DevOps
  * Deploy to ACI, run some tests, then if all is well, maybe deploy to AKS

* Slide: # 41
  * Just like the rest of our software, we don’t want to put our model in production and leave it there, assuming it will always work.
  * So we need a retraining strategy.
  * Either periodically, or when the data is different enough in production that we’re not getting the results we want.
  * Azure ML Service has a solution for this

* Slide: # 42
  * When we train, we can do so from a known training data set
  * When we ultimately deploy a model to production, we can store the inputs into another dataset – our inference dataset

* Slide: # 43
  * Periodically, AML Service will let us compare these two data sets looking for “data drift”. If what we’re seeing in production drifts too much from what we trained our model on, we can kick off a new training process to produce a new model.
  * This can be done automatically

* Slide: # 44
  * Of course, if we change our code, we also want to change our training pipeline, which is what we saw today.

* Slide: # 45
  * Importantly, this is just an example – we’re deploying our model to containers, but maybe we want to embed the models into our software
  * Or maybe we’re not using AML at all – maybe we’re using different cognitive services – and they all have great APIs that Azure Pipelines can talk to.
  * Ultimately, Azure Pipelines can orchestrate anything, so whatever set of tools you’re using, you can use it to manage your training.

* Slide: # 46
  * In summary

* Slide: # 47

* Slide: # 48

* Slide: # 49

* Slide: # 50
  * You can find more resources and source code at these links

* Slide: # 51
  * You can also check our certification to become Microsoft Certified Azure Data Scientist Associate and/or Microsoft Certified Azure AI Engineer Associate

* Slide: # 52
  * For the first time, Microsoft is offering FREE certification exams to all event attendees. You can take advantage of this for any Fundamentals or Role-based Certifications.
  * The offer is for one free exam and it’s valid for up to 6 months post-event.
  * You can utilize this at our onsite testing in the event expo hall or use it post-event using the same email address used to sign up for the event. (Gov. Officials are not eligible)
  * Expect an email with details after the show for those of you who have opted-in to receive promotional email from Microsoft.

* Slide: # 53
