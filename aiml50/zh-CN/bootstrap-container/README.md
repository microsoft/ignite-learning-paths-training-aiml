# <a name="bootstrap-container"></a>启动容器

此容器映像有助于填补预配过程中的空白。

## <a name="contents"></a>内容

基于 PowerShell Core 容器

软件：

* Curl
* Wget
* Azure CLI
* Az CLI 的 Azure DevOps 扩展
* AzCopy
* VSTeam PowerShell 模块（和支持模块）

内容文件：

* ReleaseSeer.json - Azure DevOps 版本模板
* 图像 - 网站的训练图像和产品图像（从容器生成时间的事件 CDN 拉取）

## <a name="bootstrap-process"></a>启动过程

容器启动 PowerShell 脚本，该脚本（按此顺序）：

* 验证或创建在目标 Azure DevOps 组织中名为 `AIML50` 的项目。
* 验证 `ms-air-aiagility/vss-services-azureml` 扩展或将其添加到组织
* 验证或创建名为 `SeerPackages` 的项目源
* 验证或创建名为 `aiml50-demo` 的变量组
* 验证或导入 ReleaseSeer 版本定义
* 将图像文件复制到部署模板创建的 Azure 存储
* 开始轮询 Tailwind Traders 站点是否已启动并正在运行。 （每 10 秒轮询一次。）
  * 此轮询将在站点运行后触发数据库项目的基架，允许下一步继续。
* 连接到 Azure SQL 数据库，插入一条扳手记录（最多尝试 5 次，每两次尝试之间休眠 120）
  * 检查现有的 ID 号，如果缺失则插入。

如果启动容器无法运行，它应该能够在不影响已配置部件的情况下重新运行。
