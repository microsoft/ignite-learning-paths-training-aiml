# <a name="demo-custom-vision"></a>DEMONSTRAÇÃO: Visão Personalizada

Nesta demonstração, criaremos um modelo de visão personalizada usando o serviço em customvision.ai.

## <a name="create-a-custom-model-project-with-custom-vision"></a>Criar um projeto de modelo personalizado com a Visão Personalizada

DICA: É possível concluir esta seção com antecedência para economizar tempo em uma demonstração ao vivo.

1. Entre em [Visão Personalizada](https://customvision.ai) e crie um novo projeto.
   [Siga as instruções aqui](https://docs.microsoft.com/azure/cognitive-services/custom-vision-service/getting-started-build-a-classifier?WT.mc_id=msignitethetour2019-github-aiml20).

1. Seu novo projeto deverá ter as seguintes configurações:

    - Nome: Ferramentas
    - Descrição: Produtos vendidos pela Tailwind Traders
    - Recurso: aiml20-cs-resource
    - Tipo de projeto: classificação
    - Tipos de classificação: Multiclasse
    - Domínios: Varejo (compacto)
    - Exportar funcionalidades: Plataformas Básicas

1. Na ferramenta "Marcas" no lado esquerdo, use o botão "+" para adicionar as seguintes marcas:

    - furadeira
    - martelo
    - alicate
    - chave de fenda

1. Agora, adicionaremos imagens para cada marca da pasta correspondente em "Imagens de Treinamento de CV". Veja como fazer isso para "furadeira"

    - Clique em "Adicionar Imagens" na linha superior
    - Navegue até as Imagens de Treinamento de CV/furadeiras
    - Selecione todos os arquivos: clique em um arquivo e pressione Control-A
    - Clique em Abrir
    - Na caixa de diálogo "Carregamento de Imagem" que aparece em seguida, selecione "furadeira" em "Minhas Marcas" e clique em "Carregar 16 arquivos"
    - repita esse processo para as marcas: martelo, alicate e chave de fenda (faremos o "capacete" posteriormente)

## <a name="add-images-and-train-a-model"></a>Adicionar imagens e treinar um modelo

No Ignite Tour, as etapas anteriores foram todas feitas com antecedência na preparação. Somente as etapas restantes foram feitas ao vivo para economizar tempo.

1. Caso ainda não tenha feito, entre no customvision.ai e abra seu projeto "ferramentas".

1. Esse projeto já foi fornecido com imagens de furadeiras, martelos, alicates e chaves de fenda. Adicionaremos algumas imagens de capacetes também.

- Clique em "Adicionar Imagens" na linha superior
- Navegue até as Imagens de Treinamento de CV/furadeiras
- Selecione todos os arquivos: clique em um arquivo e pressione Control-A
- Clique em Abrir
- Na caixa de diálogo "Carregamento de Imagem" que aparece em seguida, selecione "capacete" em "Minhas Marcas" e clique em "Carregar 16 arquivos"

1. Clique em "Desempenho" na barra de menus superior e, em seguida, clique no botão verde "Treinar". Escolha "Treinamento Rápido" e clique em "Treinar"

1. Clique na iteração mais recente no painel esquerdo para ver os resultados. Você deverá ter uma precisão de 90,9%. Quantas imagens de treinamento o modelo prevê corretamente? Recall de 88,2%. Quando geramos uma previsão, ela estará correta? E PA de 98,7% (medida geral). Observe que eles dependem do limite de probabilidade, reduza-os caso queira evitar falsos positivos.
   Para nosso aplicativo de varejo é seguro aumentá-los.

1. Teste o modelo com uma nova imagem. Clique em "Teste Rápido" e "Procurar Arquivos Locais" e, em seguida, escolha "imagens de teste/homem com capacete. jpg". Veja que ele identifica como um capacete com 99,9% de probabilidade. Experimente o mesmo com "imagens de teste/furadeira.jpg", que também será identificada corretamente.

Agora, salvaremos o modelo no formato ONNX para integração com o aplicativo da Tailwind Traders.

1. Clique em Exportar e escolha "ONNX". Observe também outros formatos específicos de plataforma disponíveis.

1. Selecione a versão ONNX 1.2 e clique em Exportar. O aplicativo TWT espera um arquivo chamado products.onnx, portanto, usaremos aquele que já está salvo no repositório.

## <a name="next-step"></a>Próxima etapa

[Implantação do ONNX](DEMO%20ONNX%20deployment.md)