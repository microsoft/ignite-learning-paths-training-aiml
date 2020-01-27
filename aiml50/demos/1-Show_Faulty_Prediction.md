# <a name="show-faulty-prediction-and-make-a-change"></a>展示错误的预测并进行更改

> 💡 在尝试执行此演示之前，必须已完成[设置](../DEMO.md)。

## <a name="show-the-faulty-prediction"></a>显示错误的预测

* 导航到 Tailwind Traders 网站
    * https://aiml50{eventname}.azurewebsites.net （将 {eventname} 替换为用于创建演示环境的活动名称参数）

* 单击 `start smart shopping by uploading a photo`
* 上传[测试图像文件夹](../source/test-images)中的图像
* 模型提供了错误的预测。

## <a name="start-the-change"></a>开始进行更改

* 通过更改 `setup_pipeline.py` 调整模型
  * 第 162 行 - 将 `epochs` 更改为 20
  * 第 163 行 - 将 `batch` 更改为 10
* 提交更改并将其推送到主节点。  此操作将触发生成和部署模型。  此过程大约需要 25 或 30 分钟，应可在讲完时结束。
* 我们会在讲完时返回这里查看结果

## <a name="example-demo"></a>示例演示

* [从 2:36 开始排练](https://youtu.be/UgM8_4fAni8?t=158)