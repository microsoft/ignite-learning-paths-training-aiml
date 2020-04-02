# <a name="personalizer-demo"></a>個人化工具示範

> 💡 您必須先完成[設定](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md)，才能嘗試進行此示範。

在此示範中，觀察網站的版面配置如何使用增強式學習和[認知服務個人化工具](https://docs.microsoft.com/en-us/azure/cognitive-services/personalizer/?WT.mc_id=msignitethetour2019-github-aiml20)來適應訪客動作。

個人化工具會動態地重新設定介面，讓匿名訪客在 [建議] 區段中按一下精選類別的可能性達到最佳化。

1. 部署 Tailwind Traders 網站應用程式 (如果您還未使用 `DEMO Setup.md` 這麼做)

2. 前往 Tailwind Traders 首頁

3. 觀察 [建議] 區段和精選類別的順序

4. 重新整理頁面 (您可能需要執行此動作幾次)。 觀察版面配置是否已變更。

個人化工具服務會追蹤匿名訪客，並記錄按一下類別時的當天時間、星期幾和使用的瀏覽器 OS。 「獎勵」為是否按下大型的精選區段。 

經過一段時間後，個人化工具會根據當天時間、星期幾和 OS，決定最適合設為精選的類別。 它也會花 20% 的時間「探索」，以呈現在其他情況下不會顯示的類別。
