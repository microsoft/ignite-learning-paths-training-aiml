# <a name="setup-for-aiml20-demos"></a>AIML20 デモ用のセットアップ

これらのタスクは、AIML20 プレゼンテーション用に事前に実行されました。 残りのデモ用原稿に備えるために、同じ手順に従ってください。

## <a name="clone-the-repository-to-your-local-machine"></a>ローカル コンピューターにリポジトリを複製する

ローカル コンピューターに https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml20 の内容が必要になります。 これを行う最も簡単な方法は、[AI ラーニング パスの開発者ガイド リポジトリ](https://github.com/microsoft/ignite-learning-paths-training-aiml)にアクセスし、[Clone or download]\(複製またはダウンロード\) ボタンをクリックすることです。 `aiml20` フォルダーに関連するファイルを参照します。

## <a name="sign-up-for-an-azure-subscription"></a>Azure サブスクリプションにサインアップする

Azure サブスクリプションがまだない場合は、[こちらからサインアップ](https://azure.microsoft.com/free/?WT.mc_id=msignitethetour2019-github-aiml20)し、$200 の Azure クレジットを入手できます。 

## <a name="find-your-azure-subcription-id"></a>Azure サブスクリプション ID を検索する

[Azure Portal](https://portal.azure.com) で、サインインして、左側のメニュー バーの [サブスクリプション] をクリックします。 使用するサブスクリプション名をクリックし、そこに表示されている [サブスクリプション ID] をコピーします。 後でリソースを作成するときに必要になります。

または、Azure CLI で `az account show` を実行し、表示される "id" の値をコピーします。

## <a name="start-fresh"></a>まったく新しい状態で開始します。

 前にデモを行ったことがある場合、そのときのリソース グループが存在する場合は削除します。
 
 - `aiml20-demo`

 Azure Portal を使用するか、Azure CLI の次のコマンドを使用できます。

 ```sh
 az group delete --name aiml20-demo
 ```

## <a name="deploy-the-tailwind-traders-website"></a>Tailwind Traders Web サイトをデプロイします。

下のボタンをクリックしてください。 これにより、Github から [TailwindTraders-Website](https://github.com/Microsoft/TailwindTraders-Website) がデプロイされ、ARM テンプレートを使用して Personalizer の統合および ONNX ベースの Shop by Photo 機能が有効になります。 ([このデプロイに関する詳細](https://github.com/microsoft/TailwindTraders-Website/blob/master/Source/Tailwind.Traders.Web/Standalone/README.md))

[![Azure へのデプロイ](https://azuredeploy.net/deploybutton.svg)](https://portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoft%2FTailwindTraders-Website%2Fmaster%2Fazuredeploy.json)

表示されるフォームで、次のオプションを選択します。

* [サブスクリプション]:リソースをデプロイするサブスクリプションを選択します。

* [リソース グループ]: 指定したリソース グループにリソースが作成されます。
  [新規] を選択し、名前に「`aiml20-demo`」と入力することをお勧めします。 終わったら、このリソース グループを削除してサイトをシャットダウンし、関連付けられているすべてのリソースを削除することができます。

* [場所]:リソースがデプロイされる Azure リージョン。 そのリージョンに SQL Database と App Services をデプロイできる必要があります。 

  注:現在、Personalizer は米国西部 2 と西ヨーロッパでのみ利用できるため、どこを選択してもそこにデプロイされます。

* [サイト名]:これはサイトの URL で使用されて公開され、グローバルに一意である必要があります。 競合を回避するには、`aiml20-xy` を使用して `xy` を自分のイニシャルに置き換えます。ただし、スクリプトではこの名前を `aiml20` としてだけ参照します。 (使用中の名前を選択すると、デプロイ中に "競合" エラーが発生します。)

* [Site Location]\(サイトの場所\): 上の [場所] の短いバージョンを入力します (例: `westus2`)。
  (Azure CLI で `az account
  list-locations -o table` を使用して短い名前の一覧を取得できます)。

* [Deployment mode]\(デプロイ モード\):`standalone` を選択します

* [SQL Login]\(SQL ログイン\):「`twt`」と入力します

* [SQL Password]\(SQL パスワード\): 安全なパスワードを生成して使用します (句読点および大文字と小文字の両方を含める必要がありますが、`;` は使用しないでください)。 このデモでは必要ないので、記録しておく必要はありません。

* [Enable Personalizer]\(Personalizer を有効にする\): [`true`] を選択します

* [Repo URL]\(リポジトリ URL\): 既定値 `https://github.com/microsoft/TailwindTraders-Website` をそのまま使います

* [Branch]\(ブランチ\): 既定値 `master` をそのまま使います

(バックアップとして、リポジトリ URL `https://github.com/revodavid/TailwindTraders-Website` およびブランチ `aiml20` を使用することもできます。
これは 2019-10-25 にフォークされ、機能することがわかっています。)

[I agree to the terms and condtions]\(条項と条件に同意します\) をオンにして、[Purchase]\(購入\) をクリックします。

サイトがデプロイされるまで、少なくとも 15 分待ちます。 

デプロイされた Web サイトの URL は、SITENAME.azurewebsites.net の形式になります (SITENAME は上で指定したもの)。または、次のようにして検索できます。

* [次のステップ] の下にある [リソースに移動] をクリックします

* "App Service" リソースをクリックします

* 右側のペインに表示される "URL" の値を確認します

Web サイトの URL は、[ソース管理を設定しています] ステップの後で表示されます。または、"App Service" リソースを調べることもできます。

### <a name="install-the-simple-onnx-model"></a>"シンプルな" ONNX モデルをインストールする

[DEMO ONNX deployment.md](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model) の「Load the Simple ONNX model」(シンプルな ONNX モデルを読み込む) という見出しの下にある指示に従います。 これにより、アプリの "Photo by Photo" ツールが、ハンマーとドリルのみを認識するようにデグレードされます。

## <a name="configure-visual-studio-code"></a>Visual Studio Code を構成する

拡張機能 [Azure Account](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account) をインストールします。
(Windows では、[node.js をインストールする](https://nodejs.org/)必要もあります)。VS Code で、Azure にログインします。"Azure:Sign In" コマンドを使用します (コマンド パレットを開くには、Ctrl + Shift + P キーを使用します)。 VS Code のスクリプトから Azure CLI コマンドを実行するには、"Terminal:Run Selected Text in Azure Terminal" を使用して、コマンドをコピーします。

または、ローカル環境の Windows、MacOS、または Linux コンピューターに、[Azure CLI をインストールする](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=https://docs.microsoft.com/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=msignitethetour2019-github-aiml20)こともできます。 インストールしていない場合は、[Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20) を起動して、ブラウザー ウィンドウからこれらのコマンドを実行することもできます。 

## <a name="prepare-visual-studio-for-demo"></a>デモ用に Visual Studio を準備する

- `vision_demo.sh` を開きます
- Cloud Shell を起動します ("Azure:Open Bash In Cloud Shell" を使用)。 (好みに応じて、Azure CLI をローカル環境で使用してもかまいません)。   

## <a name="open-browser-pages-ready-to-demo"></a>デモの準備ができたブラウザー ページを開く

* デプロイされた Tailwind Trader アプリ 
* https://portal.azure.com (リソースを参照)  
* https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/
* https://customvision.ai
* https://lutzroeder.github.io/netron/

## <a name="download-image-files-to-local-machine"></a>画像ファイルをローカル コンピューターにダウンロードする

"CV Training Images.zip" をローカル コンピューターにダウンロードし、zip ファイルを展開します。 これにより、"CV Training Images" フォルダーと次のサブフォルダーが作成されます。

* drills
* hammers
* hard hats
* pliers
* screwdrivers

これらの画像を使って Computer Vision サービスをテストし、Custom Vision サービスでモデルを作成します。

これらの画像は Wikimedia Commons から供給され、それぞれの Creative Commons ライセンスの下で使用されます。 詳しくは、ファイル [ATTRIBUTIONS.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/CV%20training%20images/ATTRIBUTIONS.md) を参照してください。

また、"test images" フォルダーもダウンロードします。 これらの画像はトレーニングでは使われませんが、モデルが動作することをテストするために使われます。

## <a name="next-step"></a>次のステップ

[Computer Vision](DEMO%20Computer%20Vision.md)
