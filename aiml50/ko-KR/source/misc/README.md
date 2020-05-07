<a name="bulk-bing-image-downloader"></a>대량 Bing 이미지 다운로더
==========================
*대량 Bing 이미지 다운로더(BBID)* 는 다음을 수행하는 다운로더입니다.
- Bing 이미지 검색 결과에서 전체 크기 이미지를 다운로드
- 비동기 -> 이미지를 매우 빠르게 다운로드
- 교차 플랫폼
- Bing API 우회
- 성인 콘텐츠 필터링을 사용하지 않도록 설정하는 옵션 있음
- python 3으로 작성
- SSL 연결 사용

### <a name="usage"></a>사용법
```
bbid.py [-h] [-s SEARCH_STRING] [-f SEARCH_FILE] [-o OUTPUT]
               [--adult-filter-on] [--adult-filter-off] [--filters FILTERS]
               [--limit LIMIT]

```
### <a name="example"></a>예
`./bbid.py -s "hello world"`

### <a name="advanced-filtering"></a>고급 필터링
라이선스 필터링, 이미지 크기 등의 일부 Bing 필터를 적용할 수 있습니다. BBID는 이러한 필터를 사람이 읽기 좋은 변형의 형태로 표시하지는 않지만 Bing 웹 사이트에서 노출된 모든 필터를 활용하도록 해줍니다.
Bing 웹 사이트를 통해 원하는 필터를 적용하고 URL에서 복사하기만 하면 됩니다. 필터는 `&qft=` 뒤와 `&` 앞에 위치합니다.

예를 들어 `code`를 검색하고 `past week` 필터 및 `large` 이미지 크기를 적용하면 표시되는 URL은 `http://www.bing.com/images/search?sp=-1&pq=code&sc=0-0&sk=&cvid=39A810C4AF314AB6A5A923F4FB6E5282&q=code&qft=+filterui:age-lt10080+filterui:imagesize-large&FORM=IRFLTR`입니다.

이 URL에서 추출할 필터 문자열은 `+filterui:age-lt10080+filterui:imagesize-large`입니다. 그런 다음 필터를 사용하여 BBID에 적용할 수 있습니다.
```
./bbid.py -s code --filters +filterui:age-lt10080+filterui:imagesize-large
```
