# AIML40 - Demo Instructions

Instructions for the demos in AIML40, including the preparation needed, is described in detail in [AIML40 Public Materials](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/). We will not duplicate the steps described there, but highlight some important tricks that make the demo better (and fit within 45 mins). Please read the public material first to familiarize yourself with the demo scenario.

## Demo Preparation

As described in [AIML40 Public Readme](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md), there are the following preparation steps:

1. Create Azure ML Workspace (using Azure Template or CLI Commands)
2. Upload the dataset for the Automated ML demo to the workspace
3. Create a compute cluster to speed up the demo
4. Setup the Jupyter notebook environment and open `asba.ipynb` file in it, getting ready to execute.

So, before the demo, you would have a browser with the following 3 pages open:
 - [Text Analytics Page](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40)
 - [Azure ML Workspace](http://ml.azure.com)
 - Jupyter Notebook with `asba.ipynb`

In addition to those steps, to ensure speedy demo you need to do the following:

1. **For Demo 1:** Open the browser to [Text Analytics Page](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40) and in the text box below enter the following text and press **Analyze**: 
> I loved the polka dot pants that I bought in the london store

[Video Link to Demo 1: Cognitive Services Text Analytics](https://youtu.be/QJxjm5BirOA)

2. **For Demo 2:**
   - Open the page with your [Azure ML Workspace](http://ml.azure.com). If required -- select the correct workspace.
   - Make sure the dataset is uploaded
   - Go to **Automated ML** tab in Azure Machine Learning workspace and perform the Automated ML experiment as described in the [AIML40 Public Readme](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md). It will take quite a lot of time to run, so do it in advance.
   - Make sure that you refresh the page shortly before the presentation, so that you do not have to login again when doing the demo

[Video Link to Demo 2: Automated Machine Learning](https://youtu.be/qrstXN6TLZk)

3. **For Demo 3:**
   - Open `asba.ipynb` in the Jupyter Environment
   - Make sure you have correct Subscription ID pasted in the code (and also Cluster name / Resource Group name, in case you have changed the defaults)
   - Run all cells in the notebook making sure all steps run correctly. Some of the steps will take quite a lot of time to run, so prepare in advance. (the experiment takes ~3.5 hrs to run - this is why its important to have your compute cluster as low priority to save money)
   - Make sure you finish working with the notebook just before the demo, so that you do not have to enter credentials again.

[Video Link to Demo 3: Azure Machine Learning SDK and Hyperdrive](https://youtu.be/sccNTPO3PwU)


## Demo Time!

During the demo, we recommend to show the following:

1. **Demo 1.1**: Just open the browser with [Text Analytics Page](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=msignitethetour2019-github-aiml40) and click **Analyze**. Page should be pre-loaded.
2. **Demo 1.2**: 
  - On the same page, click **Example-English-Positive** to switch to default phrase *I had a wonderful trip to Seattle last week and even visited the Space Needle two times*, and then click **Analyze**
  - Observe good positive score
  - Remove the word **wonderful**
  - Click **Analyze** and observe the score drop significantly
3. **Demo 2:** Azure ML Workspace and Automated ML
  - Open the browser with [Azure ML Workspace](http://ml.azure.com) -- page should be pre-loaded
  - Navigate to **Datasets**
  - Open the dateset
  - Expand **Sample Usage** on **Overview** tab to show the code
  - Switch to **Explore** to show the data
  - Switch to **Automated ML**
  - Put in experiment name, select compute, select dataset (clothing_automl.xlsx)
  - Choose **Classification** task and **Rating** as target column
  - Expand **Advanced settings** and demonstrate available options, including the selection of algorithms
  - Click *Start* (but make sure you have a previously run experiment ready), as it will take a lot of time!
  - Click on the **Automated ML** tab again, and bring up the previous experiment you have performed before during preparation phase
  - Explain the graph showing different model runs, and what the best run is
  - Click on the best model to explore the **ROC**, **Precision-Recall** and other metrics graphs in more detail
  - Demonstrate the **Deploy model** button to show how simple it is to deploy a model
4. **Demo 3:** Using Azure ML Service with Python SDK
  - During this demo, you should follow and explain the cells of `absa.ipynb` notebook
  - To be completely on the safe side, you can just show the code without running it at all - this would be safe, but will not create an impression of code being executed in live demo mode
  - To make more live demo, please refer to [absa-instuctions.ipynb](absa-instuctions.ipynb) notebook, which explains which cells should *not* be run during the demo, and which can be safely run
  - In general, what we want to avoid is long-running tasks

## Tear Down

Because the demo is resource-intensive, please do not forget to:
* Delete the compute cluster (especially because auto-scale is turned off in our demo to save on cluster preparation time)
* If you are running with Azure Machine Learning compute - make sure the minimum nodes are edited to 0 during down time and 1 during demo time - this will save cost
* You may also delete the Azure ML Workspace and Resource group -- instructions are provided in the [Public Readme](http://github.com/microsoft/ignite-learning-paths/aiml/aiml40/README.md)

