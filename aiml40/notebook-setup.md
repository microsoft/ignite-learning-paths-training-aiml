## <a name="different-jupyter-notebook-usage-options"></a>Diferentes formas de usar Jupyter Notebook

Los cuadernos de Jupyter son una forma habitual de ejecutar el código de Python y, por tanto, gran parte de la demostración se presenta como código de cuadernos de Jupyter. Dispone de diferentes opciones para ejecutar código en Jupyter Notebook:

 - Usar Jupyter Notebook en un área de trabajo de Azure ML. Es el método recomendado y se describe en el [archivo Léame principal](README.md).
 - Instalar el entorno de Python de forma local, como se describe a continuación, en **Instalación del entorno de Python**.
 - Usar [Azure Notebooks](http://aka.ms/whyaznb). En este caso, debe cargar el archivo `absa.ipynb` en un nuevo proyecto de Azure Notebooks. Además, debido a las limitaciones del proceso gratuito en Azure Notebooks (1 GB de espacio en disco), solo podrá ejecutar este cuaderno en una máquina virtual, tal y como se describe [aquí](https://docs.microsoft.com/azure/notebooks/use-data-science-virtual-machine/?wt.mc_id=msignitethetour2019-github-aiml40).

#### <a name="python-environment-installation"></a>Instalación del entorno de Python

Si decide no usar Azure Notebooks y prefiere el entorno local de Python, debe instalar el SDK de Azure ML de Python y asegurarse de instalar notebook y contrib:

```shell
conda create -n azureml -y Python=3.6
source activate azureml
pip install --upgrade azureml-sdk[notebooks,contrib] 
conda install ipywidgets
jupyter nbextension install --py --user azureml.widgets
jupyter nbextension enable azureml.widgets --user --py
```

Después de esta operación tendrá que reiniciar Jupyter. Consulte [aquí](https://docs.microsoft.com/azure/machine-learning/service/quickstart-create-workspace-with-python/?WT.mc_id=msignitethetour2019-github-aiml40) las instrucciones detalladas.
