# <a name="setup-for-aiml20-demos"></a>AIML20 演示设置

这些任务是提前针对 AIML20 演示执行的。 请遵循相同的步骤来准备剩余的演示脚本。

## <a name="clone-the-repository-to-your-local-machine"></a>将存储库克隆到本地计算机

需要在本地计算机上使用 https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml20 的内容。 最简单的克隆方法是访问 [AI 学习路径存储库的开发人员指南](https://github.com/microsoft/ignite-learning-paths-training-aiml)，然后单击“克隆或下载”按钮。 我们将引用相对于 `aiml20` 文件夹的文件。

## <a name="sign-up-for-an-azure-subscription"></a>注册 Azure 订阅

如果你没有 Azure 订阅，可以[在此处注册](https://azure.microsoft.com/free/?WT.mc_id=msignitethetour2019-github-aiml20)，并获取 200 美元的免费 Azure 额度。 

## <a name="find-your-azure-subscription-id"></a>查找 Azure 订阅 ID

在 [Azure 门户](https://portal.azure.com)中登录，然后在左侧菜单栏中单击“订阅”。 单击要使用的订阅名称，并复制此处显示的“订阅 ID”。 稍后在创建资源时会用到此 ID。

或者，在 Azure CLI 中运行 `az account show` 并复制显示的 `id` 值。

## <a name="start-fresh"></a>开始刷新。

 如果以前曾经运行过演示，请删除这些资源组（如果存在）：
 
 - `aiml20-demo`

 可以使用 Azure 门户，或在 Azure CLI 中运行此命令：

 ```sh
 az group delete --name aiml20-demo
 ```

## <a name="deploy-the-tailwind-traders-website"></a>部署 Tailwind Traders 网站。

单击下面的按钮。 随即会使用 ARM 模板从 Github 部署 [TailwindTraders-Website](https://github.com/Microsoft/TailwindTraders-Website)，以实现个性化体验创建服务集成和基于 ONNX 的“按图购物”功能。 （[有关此部署的更多详细信息](https://github.com/microsoft/TailwindTraders-Website/blob/master/Source/Tailwind.Traders.Web/Standalone/README.md)。）

[![部署到 Azure](https://azuredeploy.net/deploybutton.svg)](https://portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoft%2FTailwindTraders-Website%2Fmaster%2Fazuredeploy.json)

在出现的窗体中选择以下选项：

* 订阅：选择要在其中部署资源的订阅

* 资源组：将在指定的资源组中创建资源。
  建议选择“新建”并输入名称 `aiml20-demo`。 完成后，可以删除此资源组以关闭站点，并删除所有关联的资源。

* 位置：要在其中部署资源的 Azure 区域。 必须能够在该区域中部署 SQL 数据库和应用服务。 

  注意：由于个性化体验创建服务目前只能在美国西部 2 区和西欧使用，因此，不管选择哪个区域，都只会在上述两个区域部署该服务。

* 站点名称：将在站点 URL 中使用并公开显示，必须全局唯一。 为了避免冲突，请选择 `aiml20-xy`（将 `xy` 替换为姓名首字母缩写），但在这些脚本中，我们只是简单地使用 `aiml20` 来表示此名称。 （如果选择的名称已被使用，在部署过程中会出现“冲突”错误。）

* 站点位置：输入上面指定的“位置”的简短版本，例如 `westus2`。
  （可以在 Azure CLI 中使用 `az account
  list-locations -o table` 获取短名称列表）。

* 部署模式：选择 `standalone`

* SQL 登录名：输入 `twt`

* SQL 密码：生成并使用安全密码（必须包含标点和混合大小写，但不要使用 `;`）。 我们的演示不需要密码，因此无需记下密码。

* 启用个性化体验创建服务：选择 `true`

* 存储库 URL：接受默认值 `https://github.com/microsoft/TailwindTraders-Website`

* 分支：接受默认值 `master`

（作为备选方法，也可以同时使用存储库 URL `https://github.com/revodavid/TailwindTraders-Website` 和分支 `aiml20`。
此分支是在 2019 年 10 月 25 日创建的，已知可正常工作。）

选中“我同意条款和条件”，然后单击“购买”。

至少等待 15 分钟来部署站点。 

部署的网站 URL 采用 SITENAME.azurewebsites.net 格式（使用前面提供的站点名称），或者可按如下所示查找它：

* 单击“后续步骤”下的“转到资源”

* 单击“应用服务”资源

* 查看右窗格中显示的“URL”值

网站 URL 将显示在“设置源代码管理”步骤后面，或者你可以检查“应用服务”资源。

### <a name="install-the-simple-onnx-model"></a>安装“简单”的 ONNX 模型

按照 [DEMO ONNX deployment.md](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model) 中标题“加载简单的 ONNX 模型”下的说明操作。 这会导致应用中的“按图购物”工具降级，使之只能识别锤子和电钻。

## <a name="configure-visual-studio-code"></a>配置 Visual Studio Code

安装 [Azure 帐户](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account)扩展。
（在 Windows 上，还需要 [安装 Node.js](https://nodejs.org/)。）在 VS Code 中，使用“Azure: 登录”命令登录到 Azure（使用 Ctrl-Shift-P 打开命令面板）。 若要从 VS Code 中的脚本运行 Azure CLI 命令，请使用“终端:在 Azure 终端中运行所选文本”以复制命令。

或者，可以在本地 Windows、MacOS 或 Linux 计算机上[安装 Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=https://docs.microsoft.com/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=msignitethetour2019-github-aiml20)。 如果尚未安装 CLI，也可以在浏览器窗口中启动 [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20) 并运行这些命令。 

## <a name="prepare-visual-studio-for-demo"></a>为演示准备 Visual Studio

- 打开 `vision_demo.sh`
- 使用“Azure:打开 Cloud Shell 中的 Bash”启动 Cloud Shell。 （如果需要，可以在本地使用 Azure CLI。）   

## <a name="open-browser-pages-ready-to-demo"></a>打开随时可用于演示的浏览器页。

* 已部署的 Tailwind Trader 应用 
* https://portal.azure.com/?feature.customportal=false#home （浏览到资源 - 注意此链接显示公共门户，而不是面向具有访问权限的用户的预览版）  
* https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/
* https://customvision.ai
* https://lutzroeder.github.io/netron/

## <a name="find-the-image-files-on-your-local-machine"></a>查找本地计算机上的图像文件

克隆存储库后，可以在 `aiml20/CV Training Images` 文件夹中找到训练图像。 将使用这些图像来训练自定义视觉模型。 此文件夹包含以下子文件夹：

* drills
* hammers
* hard hats
* pliers
* screwdrivers

这些图像用于测试计算机视觉服务，并通过自定义视觉服务创建模型。

这些图像源自 Wikimedia Commons，是根据相应的 Creative Commons 许可条款使用的。 有关详细信息，请参阅文件 [ATTRIBUTIONS.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/CV%20training%20images/ATTRIBUTIONS.md)。

在 `test images` 文件夹中可以找到其他测试图像。 这些图像不会在训练中使用，而是用于测试模型的工作状况。

## <a name="next-step"></a>后续步骤

[计算机视觉](DEMO%20Computer%20Vision.md)
