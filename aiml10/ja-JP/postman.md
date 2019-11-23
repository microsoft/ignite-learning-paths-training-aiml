# <a name="using-postman"></a>Postman の使用
すべてのデモの演習を実行するには、次の 3 つの概念が必要です。

1. コレクションをインポートする
2. コレクション変数を設定する
3. 要求前スクリプトを使用して変数を設定する

## <a name="what-you-need"></a>必要なもの
このデモでは、3 つのコレクションを使用します。
1. [Form Recognizer API Calls](src/Collections/Form_Recognizer.postman_collection.json)
2. [Reader Skill API Calls](src/Collections/Reader_Skill.postman_collection.json)
3. [Invoice Search API Calls](src/Collections/Invoice_Search.postman_collection.json)

## <a name="importing-a-collection"></a>コレクションのインポート

1. 適切なコレクションをダウンロードします (上記を参照)。
2. Postman を開きます
3. [インポート] をクリックします

![コレクションをインポートする](images/import_collection.png "コレクションをインポートする")

4. 適切なコレクションを選択します

![コレクションをインポートする](images/import_collection_file.png "コレクションをインポートする")

## <a name="modifying-collection-variables"></a>コレクション変数の変更

コレクション変数を使用すると、Postman は、`{variable}` などのトークンをユーザーによって設定された値に置き換えることができます。 これにより、変数への変更により、要求の移植性を高めることができます。 たとえば、一部の演習の `endpoint` 変数は、特定の Form Recognizer サービスのエンドポイントを表します。 

1. コレクションが読み込まれたら、省略記号をクリックしてコレクション変数を編集します

![変数を編集する](images/edit_variables.png "変数を編集する")

2. 認可変数を編集するには、認可タブを使用します。

![認可を編集する](images/edit_authorization.png "認可を編集する")

3. これらの演習で使用されるその他すべての変数は、変数タブにあります

![変数を編集する](images/variables_tab.png "変数を編集する")

## <a name="using-pre-request-scripts"></a>要求前スクリプトの使用

一部の演習では、要求前スクリプトを変更する必要があります。 これらは、次に示すように、個々の要求の要求前スクリプト セクションでアクセスできます。

![要求前スクリプト](images/pre_request.png "要求前スクリプト")

