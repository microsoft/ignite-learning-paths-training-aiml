<a name="bulk-bing-image-downloader"></a>Bulk Bing Image Downloader
==========================
*Bulk Bing Image Downloader (BBID)* は、次のようなダウンローダーです。
- bing イメージの検索結果からフルサイズのイメージをダウンロードする。
- 非同期の場合にイメージをダウンロードするプロセスが非常に高速である。
- クロスプラットフォームである。
- bing API をバイパスする。
- アダルト コンテンツのフィルター処理を無効にするオプションがある。
- Python 3 で記述されている。
- SSL 接続を使用する。

### <a name="usage"></a>使用法
```
bbid.py [-h] [-s SEARCH_STRING] [-f SEARCH_FILE] [-o OUTPUT]
               [--adult-filter-on] [--adult-filter-off] [--filters FILTERS]
               [--limit LIMIT]

```
### <a name="example"></a>例
`./bbid.py -s "hello world"`

### <a name="advanced-filtering"></a>高度なフィルター処理
一部の Bing のフィルター (ライセンスやイメージ サイズなどによるフィルター) を適用できます。BBID では、人間が判読できるフィルター バリアントは公開されていませんが、Bing Web サイトで公開されているすべてのフィルターを利用できます。
必要なのは、Bing Web サイトで必要なフィルターを適用し、URL からこれらをコピーすることだけです。 これらは `&qft=` の後、`&` の前に配置されます。

たとえば、`code` を検索し、フィルター `past week` とイメージ サイズ `large` を適用すると、次のような URL が表示されます: `http://www.bing.com/images/search?sp=-1&pq=code&sc=0-0&sk=&cvid=39A810C4AF314AB6A5A923F4FB6E5282&q=code&qft=+filterui:age-lt10080+filterui:imagesize-large&FORM=IRFLTR`。

この URL から抽出するフィルター文字列は `+filterui:age-lt10080+filterui:imagesize-large` です。 その後 BBID で、たとえば --filters を使用して、これらの文字列を適用できます。
```
./bbid.py -s code --filters +filterui:age-lt10080+filterui:imagesize-large
```
