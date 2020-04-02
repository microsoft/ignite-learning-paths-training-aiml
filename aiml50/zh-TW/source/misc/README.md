<a name="bulk-bing-image-downloader"></a>大量 Bing 影像下載程式
==========================
*大量 Bing 影像下載程式 (BBID)* 這個下載程式會：
- 從 Bing 影像搜尋結果下載完整大小的影像
- 非同步 -> 下載影像非常快速
- 跨平台
- 略過 Bing API
- 有停用成人內容篩選的選項
- 以 python 3 撰寫。
- 使用 SSL 連線

### <a name="usage"></a>使用狀況
```
bbid.py [-h] [-s SEARCH_STRING] [-f SEARCH_FILE] [-o OUTPUT]
               [--adult-filter-on] [--adult-filter-off] [--filters FILTERS]
               [--limit LIMIT]

```
### <a name="example"></a>範例
`./bbid.py -s "hello world"`

### <a name="advanced-filtering"></a>進階篩選
您可能想要套用一些 Bing 的篩選條件，例如依授權、影像大小等篩選。BBID 並不會向您呈現人類看得懂的不錯變化，但可讓您利用 Bing 網站所公開的所有篩選條件。
您只需要透過 Bing 網站套用想要的篩選條件，然後從 URL 複製即可。 它們位於 `&qft=` 之後和 `&` 之前。

例如，當您搜尋 `code` 並套用篩選條件 `past week` 和影像大小 `large` 時，您看到的 URL 會是 `http://www.bing.com/images/search?sp=-1&pq=code&sc=0-0&sk=&cvid=39A810C4AF314AB6A5A923F4FB6E5282&q=code&qft=+filterui:age-lt10080+filterui:imagesize-large&FORM=IRFLTR`

您想要從這個 URL 擷取的篩選條件字串是 `+filterui:age-lt10080+filterui:imagesize-large`。 然後，您可以使用例如 --filters，在 BBID 中套用。
```
./bbid.py -s code --filters +filterui:age-lt10080+filterui:imagesize-large
```
