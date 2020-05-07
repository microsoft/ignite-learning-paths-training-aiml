<a name="bulk-bing-image-downloader"></a>Ferramenta de Download de Imagens Em Massa do Bing
==========================
*O BBID (Ferramenta de Download de Imagens em Massa do Bing)* é uma ferramenta de download que:
- baixa imagens no tamanho original dos resultados de pesquisa de imagem do Bing
- é assíncrona -> baixa imagens super rápido
- é multiplataforma
- ignora a API do Bing
- tem a opção de desabilitar a filtragem de conteúdo para adulto
- está escrita em Python 3.
- usa a conexão SSL

### <a name="usage"></a>Uso
```
bbid.py [-h] [-s SEARCH_STRING] [-f SEARCH_FILE] [-o OUTPUT]
               [--adult-filter-on] [--adult-filter-off] [--filters FILTERS]
               [--limit LIMIT]

```
### <a name="example"></a>Exemplo
`./bbid.py -s "hello world"`

### <a name="advanced-filtering"></a>Filtragem avançada
Convém aplicar alguns dos filtros do Bing, como filtro por licença, tamanho da imagem, etc. O BBID não expõe para você a variantes agradáveis e legíveis, mas permite usar todos os filtros expostos pelo site do Bing.
Agora basta aplicar os filtros desejados por meio do site do Bing e copiá-los da URL. Eles serão alocados após `&qft=` e antes de `&`.

Por exemplo, quando você pesquisar por `code` e aplicar os filtros `past week`, além do tamanho da imagem `large`, a URL exibida será `http://www.bing.com/images/search?sp=-1&pq=code&sc=0-0&sk=&cvid=39A810C4AF314AB6A5A923F4FB6E5282&q=code&qft=+filterui:age-lt10080+filterui:imagesize-large&FORM=IRFLTR`

A cadeia de caracteres dos filtros que você deseja extrair dessa URL será `+filterui:age-lt10080+filterui:imagesize-large`. Em seguida, será possível aplicá-los no BBID com filtros, por exemplo.
```
./bbid.py -s code --filters +filterui:age-lt10080+filterui:imagesize-large
```
