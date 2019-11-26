# <a name="shared-access-signatures"></a>共享访问签名

一些演示要求使用[共享访问签名](https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview?WT.mc_id=msignitethetour2019-github-aiml10)来访问 Azure 存储帐户中的 blob。 这些签名用于授予临时访问权限，以便访问 Azure 搜索将要对其进行索引的 blob。 下面我们详细介绍如何通过两种方式来这样做。

## <a name="using-the-portal"></a>使用门户

1. 导航到存储 blob 容器，右键单击所需容器，然后选择`Get Shared Access Signature`

![获取共享访问签名](images/sas_portal.png "获取共享访问签名")

2. 为签名选择适当的“开始时间”和“过期时间”。 对于这些练习，我们需要选择 `Read` 和 `List` 权限（向下滚动，找到 `List` 复选框）

![SAS 设置](images/sas_portal_step1.png "SAS 设置")

3. 复制查询字符串，如下所示： 

![SAS 签名](images/sas_portal_step2.png "SAS 签名")

## <a name="using-microsoft-azure-storage-explorer"></a>使用 Microsoft Azure 存储资源管理器

1. 下载 [Microsoft Azure 存储资源管理器](https://azure.microsoft.com/en-us/features/storage-explorer/?WT.mc_id=msignitethetour2019-github-aiml10)并进行安装。

2. 导航到存储 blob 容器，右键单击所需容器，然后选择`Get Shared Access Signature`

![获取共享访问签名](images/sas_explorer.png "获取共享访问签名")

3. 为签名选择适当的“开始时间”和“过期时间”。 对于这些练习，我们需要选择 `Read` 和 `List` 权限（向下滚动，找到 `List` 复选框）

![SAS 设置](images/sas_explorer_step1.png "SAS 设置")

4. 复制查询字符串，如下所示： 

![SAS 签名](images/sas_explorer_step2.png "SAS 签名")