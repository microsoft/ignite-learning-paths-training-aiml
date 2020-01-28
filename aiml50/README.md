# <a name="machine-learning-operations--applying-devops-to-data-science"></a>機器學習服務作業 ‒ 將 DevOps 套用於資料科學

## <a name="session-abstract"></a>課程摘要

雖然許多公司已採用 DevOps 做法來改善軟體交付，但這些相同的技術很少套用於機器學習專案。 開發人員與資料科學家之間的共同作業可能會受到限制，而以一致且值得信任的方式將模型部署到生產環境通常為白日夢。

在此課程中，您將了解如何使用 Azure DevOps 和 Azure Machine Learning 服務，將 DevOps 做法應用到機器學習服務專案。 我們會為建立版本的模型設定自動定型、評分和儲存，並將模型包裝在 Docker 容器中，然後將其部署至 Azure 容器執行個體和 Azure Kubernetes Service。 我們甚至會針對模型行為收集持續的意見反應，以便知道何時要重新定型。

* [機器學習服務作業 - 將 DevOps 套用於資料科學](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master-SimplifiedChinese/aiml50)

## <a name="table-of-content"></a>目錄
 

| 資源          | 連結                            |
|-------------------|----------------------------------|
| PowerPoint        | - [簡報](presentations.md) |
| 影片            | - [嘗試執行排練](https://youtu.be/UgM8_4fAni8) <br/>- [Microsoft Ignite 奧蘭多錄影](https://myignite.techcommunity.microsoft.com/sessions/83003) |
| 示範             | - [示範 1 - 顯示錯誤的預測並進行變更](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/demos/1-Show_Faulty_Prediction.md) <br/>- [示範 2 - 使用 Jupyter Notebook 建立管線](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/demos/2-Build_a_Pipeline_With_Notebooks.md) <br/>- [示範 3 - 顯示正在進行的組建](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/demos/3-Show_The_Build.md) <br/>- [示範 4 - 顯示發行流程](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/demos/4-Show_The_Release.md)|

## <a name="how-to-use"></a>使用方式

歡迎簡報者！

很高興您的到來，我們期待您傳遞這份精彩的內容。 身為有經驗的簡報者，您知道「如何」做簡報，因此本指南將著重於您需要簡報的內容。 本指南會為您提供由簡報設計小組建立的完整簡報流程。

除了簡報的影片，這份文件也會連結到您完成簡報所需的所有資產，包括 PowerPoint 投影片和示範指示與程式碼。

1. 請完整閱讀整份文件。
2. 觀看影片簡報
3. 向簡報者提出問題

## <a name="assets-in-train-the-trainer-kit"></a>訓練人員套件中的資產

- 本指南
- 您可以在[此處](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/aiml50.pptx)或 [presentations.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml50/presentations.md) 取得包含每張投影片備忘稿的 PowerPoint 簡報
  - [已匯出的演講者備忘稿](./SpeakerNotes.md)
- 您可以在[此處](https://myignite.techcommunity.microsoft.com/sessions/83003)取得 Microsoft Ignite 2019 奧蘭多的課程
- 您可以在[此處](https://youtu.be/UgM8_4fAni8)取得簡報的全長錄影
- 已針對上台準備就緒的實作示範個別錄影
  - [示範 #1](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_1.mp4)
  - [示範 #2](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_2.mp4)
  - [示範 #3](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_3.mp4)
  - [示範 #4](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_4.mp4)
- 示範指南
  - [安裝](./DEMO.md)與[影片逐步解說](https://youtu.be/C9WtOZaUoyA)
  - [示範 #1](./demos/1-Show_Faulty_Prediction.md)
  - [示範 #2](./demos/2-Build_a_Pipeline_With_Notebooks.md)
  - [示範 #3](./demos/3-Show_The_Build.md)
  - [示範 #4](./demos/4-Show_The_Release.md)

## <a name="become-a-trained-presenter"></a>成為經訓練的簡報者

若要成為「經訓練的簡報者」  ，請連絡 [scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com)。 請在您的電子郵件中包含以下內容：

- 完整名稱：
- 這份簡報的代碼：AIML50
- 您的簡報影片連結 (長度在 10 分鐘以內) (例如：未列出的 YouTube 影片)。

> 影片不需要是此內容的影片，其重要性在於展現您的簡報者技能

## <a name="trained-presenters"></a>經訓練的簡報者

感謝這些很棒的人員 ([表情符號](https://allcontributors.org/docs/en/emoji-key))：

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/Damovisa">
        <img src="https://avatars2.githubusercontent.com/u/1887732?s=460&v=4" width="100px;" alt="Damian Brady"/><br />
        <sub><b>Damian Brady</b></sub></a><br />
        <a href="" title="討論">📢</a>
    </td>
    <td align="center"><a href="https://github.com/smurawski">
        <img src="https://avatars1.githubusercontent.com/u/4006985?s=460&v=4" width="100px;" alt="Steven Murawski"/><br />
        <sub><b>Steven Murawski</b></sub></a><br />
            <a href="https://github.com/microsoft/ignite-learning-paths-training-aiml/pull/9" title="文件">📖</a>
    </td>
    <td align="center"><a href="https://github.com/sethjuarez">
        <img src="https://avatars2.githubusercontent.com/u/115409?s=460&v=4" width="100px;" alt="Seth Juarez"/><br />
        <sub><b>Seth Juarez</b></sub></a><br />
            <a href="Add link to powerpoint here" title="討論">📢</a>
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->
