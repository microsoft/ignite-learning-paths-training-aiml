# <a name="personalizer-demo"></a>个性化体验创建服务演示

> 💡 在尝试执行此演示之前，必须已完成[设置](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md)。

在此演示中，观察网站的布局如何通过强化学习和[认知服务个性化体验创建服务](https://docs.microsoft.com/en-us/azure/cognitive-services/personalizer/?WT.mc_id=msignitethetour2019-github-aiml20)来适应访问者的操作。

个性化体验创建服务会以动态方式重新配置界面，尽量提高匿名访问者在“推荐”部分单击“特色”类别的可能性。

1. 部署 Tailwind Traders 网站应用（如果尚未使用 `DEMO Setup.md` 这样做）

2. 访问 Tailwind Traders 主页

3. 观察“推荐”部分以及特色类别的顺序

4. 刷新页面（可能需要多次执行此操作）。 可以观察到布局进行了更改。

个性化体验创建服务会跟踪匿名访问者并记录当天的时间、星期几以及单击类别时使用的浏览器 OS。 “奖励”取决于是否单击了大型特色部分。 

随着时间的推移，个性化体验创建服务将根据当天的时间、星期几和 OS 来确定最佳特色类别。 它还将在 20% 的时间进行“浏览”，以显示其他本来不会显示的类别。
