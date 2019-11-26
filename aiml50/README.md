# <a name="machine-learning-operations--applying-devops-to-data-science"></a>Machine Learning Operations – データ サイエンスへの DevOps の適用

## <a name="session-abstract"></a>セッションの要約

多くの企業では、ソフトウェアの配布を改善するために DevOps の方法が導入されていますが、これらの同じ手法が機械学習プロジェクトに適用されることはほとんどありません。 開発者とデータ科学者の間のコラボレーションは限られており、一貫した信頼性の高い方法で運用環境にモデルをデプロイすることは、非現実的であることがほとんどです。

このセッションでは、Azure DevOps と Azure Machine Learning サービスを使用して機械学習プロジェクトに DevOps の手法を適用する方法について説明します。 ここでは、バージョン管理されたモデルの自動化されたトレーニング、スコアリング、ストレージを設定し、docker コンテナーにモデルをラップして、それを Azure Container Instances および Azure Kubernetes Service にデプロイします。 再トレーニングのタイミングを把握できるように、モデルの動作についての継続的なフィードバックの収集も行います。

## <a name="how-to-use"></a>使用方法

プレゼンターの皆様、ようこそ。

こちらをご覧いただきありがとうございます。この素晴らしいコンテンツが発表されることを楽しみにしています。 経験豊富な発表者として、プレゼンテーションの方法はご存知であると考え、このガイドでは、何についてプレゼンテーションを行う必要があるかということに焦点を絞ります。 プレゼンテーション デザイン チームが作成したプレゼンテーションを、全体にわたってリハーサルします。

プレゼンテーションのビデオに加えて、このドキュメントは、PowerPoint のスライドやデモの手順とコードなど、プレゼンテーションを成功させるために必要なすべての資産にリンクしています。

1. ドキュメント全体を読む。
2. ビデオ プレゼンテーションを見る
3. リード プレゼンターに質問する

## <a name="assets-in-train-the-trainer-kit"></a>トレーナー トレーニング キットの資産

- 本ガイド
- 各スライドのノートを含む、PowerPoint プレゼンテーションは[こちら](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_MachineLearningOperations–ApplyingDevOpstoDataScience.pptx)
  - [エクスポートされた発表者のノート](./SpeakerNotes.md)
- オーランド州で開催された Microsoft Ignite 2019 でのセッションは[こちら](https://myignite.techcommunity.microsoft.com/sessions/83003)
- プレゼンテーションの全記録は[こちら](https://youtu.be/UgM8_4fAni8)
- ステージ対応ハンズオン デモの個々の記録
  - [デモ #1](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_1.mp4)
  - [デモ #2](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_2.mp4)
  - [デモ #3](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_3.mp4)
  - [デモ #4](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml50/AIML50_demo_4.mp4)
- デモ ガイド
  - [セットアップ](./DEMO.md)および[ビデオ チュートリアル](https://youtu.be/C9WtOZaUoyA)
  - [デモ #1](./demos/1-Show_Faulty_Prediction.md)
  - [デモ #2](./demos/2-Build_a_Pipeline_With_Notebooks.md)
  - [デモ #3](./demos/3-Show_The_Build.md)
  - [デモ #4](./demos/4-Show_The_Release.md)

## <a name="become-a-trained-presenter"></a>トレーニングされたプレゼンターになる

"*トレーニングされたプレゼンター*" になるには、[scalablecontent@microsoft.com](mailto:scalablecontent@microsoft.com) にお問い合わせください。 メールには、次を含めてください。

- フル ネーム:
- このプレゼンテーションのコード:AIML50
- プレゼンテーションのビデオ (最長 10 分間) へのリンク (例: リストにない YouTube 動画)。

> プレゼンターとしてのスキルを示すことが重要であり、このコンテンツである必要はありません

## <a name="trained-presenters"></a>トレーニングされたプレゼンター

次の素晴らしい方々に謝意を表します ([絵文字キー](https://allcontributors.org/docs/en/emoji-key))。

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->

<table>
<tr>
    <td align="center"><a href="https://github.com/Damovisa">
        <img src="https://avatars2.githubusercontent.com/u/1887732?s=460&v=4" width="100px;" alt="Damian Brady"/><br />
        <sub><b>Damian Brady</b></sub></a><br />
        <a href="" title="トーク">📢</a>
    </td>
    <td align="center"><a href="https://github.com/smurawski">
        <img src="https://avatars1.githubusercontent.com/u/4006985?s=460&v=4" width="100px;" alt="Steven Murawski"/><br />
        <sub><b>Steven Murawski</b></sub></a><br />
            <a href="https://github.com/microsoft/ignite-learning-paths-training-aiml/pull/9" title="ドキュメント">📖</a>
    </td>
</tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->
