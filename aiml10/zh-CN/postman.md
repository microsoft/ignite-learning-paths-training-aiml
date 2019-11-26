# <a name="using-postman"></a>使用 Postman
在所有演示中，进行练习需要了解三个概念：

1. 导入集合
2. 设置集合变量
3. 设使用预请求脚本来设置变量

## <a name="what-you-need"></a>需要什么
整个演示过程使用三个集合：
1. [表单识别器 API 调用](src/Collections/Form_Recognizer.postman_collection.json)
2. [读取者技能 API 调用](src/Collections/Reader_Skill.postman_collection.json)
3. [发票搜索 API 调用](src/Collections/Invoice_Search.postman_collection.json)

## <a name="importing-a-collection"></a>导入集合

1. 下载相应的集合（见上）。
2. 打开 Postman
3. 单击“导入”

![导入集合](images/import_collection.png "导入集合")

4. 选择相应的集合

![导入集合](images/import_collection_file.png "导入集合")

## <a name="modifying-collection-variables"></a>修改集合变量

Postman 可以通过集合变量将 `{variable}` 之类的令牌替换为用户设置的值。 这样可以在更改变量的情况下提高请求的可移植性。 例如，某些练习中的 `endpoint` 变量表示特定表单识别器服务的终结点。 

1. 加载集合以后，单击省略号即可编辑集合变量

![编辑变量](images/edit_variables.png "编辑变量")

2. 若要编辑授权变量，请使用授权选项卡。

![编辑授权](images/edit_authorization.png "编辑授权")

3. 在这些练习中使用的所有其他变量位于变量选项卡下

![编辑变量](images/variables_tab.png "编辑变量")

## <a name="using-pre-request-scripts"></a>使用预请求脚本

某些练习要求更改预请求脚本。 这些脚本可以在单个请求的“预请求脚本”部分访问，如下所示。

![预请求脚本](images/pre_request.png "预请求脚本")

