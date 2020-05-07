# <a name="using-postman"></a>Uso do Postman
Há três conceitos necessários para realizar os exercícios em todas as demonstrações:

1. Importar uma coleção
2. Definir variáveis de coleção
3. Usar os scripts de pré-solicitações para definir variáveis

## <a name="what-you-need"></a>Do que você precisa
Três coleções são usadas em todas as demonstrações:
1. [Chamadas de API de Reconhecimento de Formulários](src/Collections/Form_Recognizer.postman_collection.json)
2. [Chamadas da API de Habilidade do Leitor](src/Collections/Reader_Skill.postman_collection.json)
3. [Chamadas de API de Pesquisa de Fatura](src/Collections/Invoice_Search.postman_collection.json)

## <a name="importing-a-collection"></a>Importar uma coleção

1. Baixe a coleção apropriada (veja acima).
2. Abra o Postman
3. Clique em Importar

![Importar Coleção](images/import_collection.png "Importar Coleção")

4. Selecione a coleção apropriada

![Importar Coleção](images/import_collection_file.png "Importar Coleção")

## <a name="modifying-collection-variables"></a>Modificar as variáveis da coleção

As variáveis da coleção permitem que o Postman substitua os tokens, como `{variable}`, por valores definidos pelo usuário. Isso permite que as solicitações sejam mais portáteis com alterações em variáveis. Por exemplo, em alguns dos exercícios, a variável `endpoint` representa o ponto de extremidade de seu serviço específico de Reconhecimento de Formulários. 

1. Depois que uma coleção for carregada, clique nas reticências para editar as variáveis da coleção

![Editar Variáveis](images/edit_variables.png "Editar Variáveis")

2. Para editar as variáveis de autorização, use a guia de autorização.

![Editar Autorização](images/edit_authorization.png "Editar Autorização")

3. Todas as outras variáveis usadas nesses exercícios são encontradas na guia de variáveis

![Editar Variáveis](images/variables_tab.png "Editar Variáveis")

## <a name="using-pre-request-scripts"></a>Usar os scripts de pré-solicitação

Alguns dos exercícios exigem alterações a serem executadas nos scripts de pré-solicitação. É possível acessá-los na seção script de pré-solicitação de solicitações individuais, como mostrado abaixo.

![Scripts de Pré-Solicitação](images/pre_request.png "Scripts de Pré-Solicitação")

