# <a name="setup-for-aiml20-demos"></a>設定 AIML20 示範

這些工作是在 AIML20 簡報之前所執行。 請針對其餘示範指令碼，遵循這些相同步驟。

## <a name="clone-the-repository-to-your-local-machine"></a>將存放庫複製到本機電腦

本機電腦上將需要 https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml20 的內容。 最簡單的做法就是瀏覽 [AI 開發人員指南學習路徑存放庫](https://github.com/microsoft/ignite-learning-paths-training-aiml)，然後按一下 [Clone or download] \(複製或下載\) 按鈕。 我們將參考相對於 `aiml20` 資料夾的檔案。

## <a name="sign-up-for-an-azure-subscription"></a>註冊 Azure 訂用帳戶

如果還沒有 Azure 訂用帳戶，您可以[在這裡註冊](https://azure.microsoft.com/free/?WT.mc_id=msignitethetour2019-github-aiml20)，也可以免費取得及使用美金 $200 元的 Azure 點數。 

## <a name="find-your-azure-subscription-id"></a>尋找 Azure 訂用帳戶識別碼

在 [Azure 入口網站](https://portal.azure.com)中，登入並按一下左側功能表列中的 [訂用帳戶]。 按一下您要使用的訂用帳戶名稱，並複製該處所顯示的「訂用帳戶識別碼」。 稍後建立資源時將需要此資訊。

或者，在 Azure CLI 中執行 `az account show`，並複製顯示的 `id` 值。

## <a name="start-fresh"></a>從頭開始。

 如果您之前曾執行過示範，請刪除這些資源群組 (如果有的話)：
 
 - `aiml20-demo`

 您可以使用 Azure 入口網站，或在 Azure CLI 中執行此命令：

 ```sh
 az group delete --name aiml20-demo
 ```

## <a name="deploy-the-tailwind-traders-website"></a>部署 Tailwind Traders 網站。

按一下以下按鈕。 這會從 Github 部署 [TailwindTraders-Website](https://github.com/Microsoft/TailwindTraders-Website)，並使用 ARM 範本來啟用個人化工具整合，以及以 ONNX 為基礎的「依相片購物」功能 ([深入了解此部署](https://github.com/microsoft/TailwindTraders-Website/blob/master/Source/Tailwind.Traders.Web/Standalone/README.md))。

[![部署至 Azure](https://azuredeploy.net/deploybutton.svg)](https://portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoft%2FTailwindTraders-Website%2Fmaster%2Fazuredeploy.json)

在出現的表單中，選取下列選項：

* 訂用帳戶：選取要部署資源的訂用帳戶

* 資源群組：資源將會在指定的資源群組中建立。
  建議選擇 [新增] 並輸入名稱 `aiml20-demo`。 當完成時，您可以刪除此資源群組來關閉網站並刪除所有相關聯的資源。

* 位置：要部署資源的 Azure 區域。 您必須能夠在該區域中部署 SQL Database 和應用程式服務。 

  注意：由於個人化工具目前只適用於 WestUS2 和 WestEurope，因此不論您選擇哪個區域，都會部署到該處。

* 網站名稱：這會用於網站的 URL 並公開顯示，且必須為全域唯一。 為了避免衝突，請選擇 `aiml20-xy` 並以您姓名縮寫取代 `xy`，但我們會在這些指令碼中直接以 `aiml20` 來參考此名稱。 (如果您選擇使用中的名稱，則會在部署期間收到「衝突」錯誤)。

* 網站位置：輸入上述「位置」的簡短版本，例如 `westus2`
  (您可以在 Azure CLI 中使用 `az account
  list-locations -o table` 取得簡短名稱清單)。

* 部署模式：選擇 [`standalone`]

* SQL 登入：輸入 `twt`

* SQL 密碼：產生及使用安全密碼 (必須包含標點符號和混合大小寫，但不要使用 `;`)。 此示範不需要密碼，因此不需要記下來。

* 啟用個人化工具：選擇 [`true`]

* 存放庫 URL：接受預設值 [`https://github.com/microsoft/TailwindTraders-Website`]

* 分支：接受預設值 [`master`]

(作為備份，您也可以使用存放庫 URL `https://github.com/revodavid/TailwindTraders-Website`，其中包含分支 `aiml20`。
這是在 2019 年 10 月 25 日所派生，已知可正常運作。)

核取 [我同意條款及條件]，然後按一下 [購買]。

至少允許 15 分鐘的時間，讓網站進行部署。 

已部署網站 URL 的格式為 SITENAME.azurewebsites.net (使用您在上方提供的網站名稱)，或可透過下列步驟尋找：

* 按一下 [後續步驟] 下的 [前往資源]

* 按一下 [App Service] 資源

* 查看右窗格中顯示的 [URL] 值

完成 [正在設定原始檔控制] 步驟之後會顯示此網站 URL，您也可以檢查 [App Service] 資源。

### <a name="install-the-simple-onnx-model"></a>安裝「簡單」的 ONNX 模型

遵循 [DEMO ONNX deployment.md](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model) 中標題 "Load the Simple ONNX model" (載入簡單的 ONNX 模型) 底下的指示進行。 這會將應用程式中的「依相片購物」工具降級，只辨識鐵槌和電鑽。

## <a name="configure-visual-studio-code"></a>設定 Visual Studio Code

安裝延伸模組：[Azure 帳戶](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account)
(在 Windows 上，您也需要[安裝 node.js](https://nodejs.org/))。在 VS Code 中，使用 [Azure:登入] 命令登入 Azure (使用 Control-Shift-P 以開啟命令選擇區)。 若要從 VS Code 中的指令碼執行 Azure CLI 命令，請使用 [終端:在 Azure 終端中執行選取的文字] 以複製命令。

或者，您可以在本機 Windows、MacOS 或 Linux 電腦上[安裝 Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=https://docs.microsoft.com/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=msignitethetour2019-github-aiml20)。 如果尚未安裝，您也可以啟動 [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20)，然後從瀏覽器視窗執行這些命令。 

## <a name="prepare-visual-studio-for-demo"></a>準備 Visual Studio 進行示範

- 開啟 `vision_demo.sh`
- 使用 [Azure:在 Cloud Shell 中開啟 Bash] 啟動 Cloud Shell (如果您想要的話，可以在本機使用 Azure CLI)。   

## <a name="open-browser-pages-ready-to-demo"></a>開啟瀏覽器頁面準備進行示範。

* 部署的 Tailwind Traders 應用程式 
* https://portal.azure.com/?feature.customportal=false#home (瀏覽至資源 - 注意此連結會顯示公用入口網站，而不是具有存取權的預覽版本)  
* https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/
* https://customvision.ai
* https://lutzroeder.github.io/netron/

## <a name="find-the-image-files-on-your-local-machine"></a>在本機電腦上尋找影像檔

複製存放庫之後，您可以在 `aiml20/CV Training Images` 資料夾中尋找定型影像。 您將使用這些影像來定型自訂視覺模型。 此資料夾包含下列子資料夾：

* drills
* hammers
* hard hats
* pliers
* screwdrivers

這些影像將用來測試電腦視覺服務，並使用自訂視覺服務來建立模型。

這些影像都來自 Wikipedia Commons，且皆是在遵循各自 Creative Commons 授權的前提下使用。 如需詳細資料，請參閱 [ATTRIBUTIONS.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/CV%20training%20images/ATTRIBUTIONS.md) 檔案。

您可以在 `test images` 資料夾中找到其他測試影像。 這些影像不會用於定型，但會用來測試模型是否正常運作。

## <a name="next-step"></a>後續步驟

[電腦視覺](DEMO%20Computer%20Vision.md)
