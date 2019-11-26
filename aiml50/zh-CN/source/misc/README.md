<a name="bulk-bing-image-downloader"></a>批量必应图像下载程序
==========================
*批量必应图像下载程序 (BBID)* 是一款下载程序，它有以下特征：
- 可从必应图像搜索结果中下载标准尺寸的图像
- 可异步下载 -> 下载图像很快
- 可跨平台
- 可跳过必应 API
- 可选择禁用成人内容筛选
- 是使用 Python 3 编写的。
- 使用 SSL 连接

### <a name="usage"></a>用法
```
bbid.py [-h] [-s SEARCH_STRING] [-f SEARCH_FILE] [-o OUTPUT]
               [--adult-filter-on] [--adult-filter-off] [--filters FILTERS]
               [--limit LIMIT]

```
### <a name="example"></a>示例
`./bbid.py -s "hello world"`

### <a name="advanced-filtering"></a>高级筛选
你可能想要应用某些必应的筛选器，例如按许可证、图像大小等进行筛选。BBID 不会显示这些筛选器的美观的、用户可读的变体，但允许利用必应网站公开的所有筛选器。
只需通过必应网站应用所需的筛选器，并从 URL 复制即可。 筛选器位于 URL 中的 `&qft=` 和 `&` 之间。

例如，如果搜索 `code`，并应用筛选器 `past week` 和图像大小 `large` 时，你看到的 URL 将为 `http://www.bing.com/images/search?sp=-1&pq=code&sc=0-0&sk=&cvid=39A810C4AF314AB6A5A923F4FB6E5282&q=code&qft=+filterui:age-lt10080+filterui:imagesize-large&FORM=IRFLTR`

要从此 URL 中提取的筛选器字符串为 `+filterui:age-lt10080+filterui:imagesize-large`。 然后，可以通过 --filters 在 BBID 中应用它们，例如
```
./bbid.py -s code --filters +filterui:age-lt10080+filterui:imagesize-large
```
