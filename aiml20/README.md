# <a name="aiml20-using-pre-built-ai-to-solve-business-challenges"></a>AIML20: Uso da IA pré-criada para resolver desafios de negócios

Este é o repositório que oferece suporte ao Microsoft Ignite 2019 e à palestra do Microsoft Ignite the Tour 2019-2020, "Uso da IA pré-criada para resolver desafios de negócios". Aqui você encontrará links para os recursos mencionados na palestra, bem como o código e os scripts de que você precisará para recriar as demonstrações apresentadas na palestra.

[Baixe os slides da apresentação AIML20 aqui](presentations.md). (Use o primeiro link para a versão mais recente.) Os slides estão no formato PPT e incluem anotações detalhadas do orador e vídeos de demonstração incorporados.

[Assista a uma gravação desta apresentação](https://myignite.techcommunity.microsoft.com/sessions/82987?source=sessions) no Microsoft Ignite Orlando, em 7 de novembro de 2019.

Link curto para estes recursos: [aka.ms/AIML20repo](https://aka.ms/AIML20repo). 

Também são fornecidos [recursos para os apresentadores desta palestra](README-Presenters.md).

## <a name="session-abstract"></a>Resumo da Sessão

**Uso da IA pré-criada para resolver desafios de negócios**

Resumo: Na condição de uma empresa controlada por dados, a Tailwind Traders entende a importância de usar inteligência artificial para melhorar os processos de negócios e agradar os clientes. Antes de a empresa investir em uma equipe de IA, os desenvolvedores existentes dela podiam demonstrar alguns ganhos rápidos usando tecnologias de IA pré-criadas. Nesta sessão, mostraremos como é possível usar os Serviços Cognitivos do Azure para extrair insights de dados de varejo. Detalharemos as redes neurais por trás da pesquisa visual computacional e mostraremos como é possível ampliar a IA pré-criada com suas próprias imagens para aplicativos de reconhecimento de imagem personalizados.

## <a name="technologies-used"></a>Tecnologias usadas

* [Serviços Cognitivos do Azure](https://docs.microsoft.com/en-us/azure/cognitive-services/?WT.mc_id=msignitethetour2019-github-aiml20)
* [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20)
* [CLI (Interface de Linha de Comando) do Azure](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest?WT.mc_id=msignitethetour2019-github-aiml20)
* [ONNX](https://github.com/onnx/onnx)
* [Visual Studio Code](https://code.visualstudio.com/)

## <a name="other-resources-mentioned-in-talk"></a>Outros recursos mencionados na palestra

* Como as redes neurais funcionam, por Brandon Rohrer: http://brohrer.github.io/blog.html
* XKCD "Tasks": https://xkcd.com/1425

### <a name="azure-cognitive-services-docs-and-apps"></a>Documentos e aplicativos dos Serviços Cognitivos do Azure

* Pesquisa Visual Computacional dos Serviços Cognitivos: [https://aka.ms/try-computervision](https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/?WT.mc_id=ignitetour-talk-davidsmi)  
* Visão Personalizada dos Serviços Cognitivos: [Documentação](https://docs.microsoft.com/en-us/azure/cognitive-services/custom-vision-service/?WT.mc_id=ignitethetour-github-davidsmi) e aplicativo em [https://customvision.ai](https://www.customvision.ai/?WT.mc_id=ignitethetour-github-davidsmi)
* ONNX Runtime: https://github.com/microsoft/onnxruntime
* Personalizador dos Serviços Cognitivos: [https://aka.ms/personalizer-intro](https://docs.microsoft.com/en-us/azure/cognitive-services/personalizer/?WT.mc_id=msignitethetour2019-github-aiml20)
* Aprendizado de Reforço com o Personalizador: https://aka.ms/personalizerdemo
* Serviços Cognitivos em contêineres: https://aka.ms/cs-containers

### <a name="cognitive-services-information"></a>Informações sobre os Serviços Cognitivos

* Preço dos Serviços Cognitivos: https://aka.ms/cs-pricing 
* Conformidade e privacidade dos Serviços Cognitivos: https://aka.ms/az-compliance
* Abordagem da Microsoft para uma IA ética: [https://microsoft.com/AI/our-approach-to-ai](https://www.microsoft.com/AI/our-approach-to-ai?rtc=1&WT.mc_id=msignitethetour2019-github-aiml20)
* Cursos de treinamento dos Serviços Cognitivos no Microsoft Learn: https://aka.ms/AIML20MSLearnCollection
* Cientista de Dados do Azure Associado com a certificação Microsoft Certified: https://aka.ms/DataScientistCert 
* Engenheiro de IA do Azure Associado com a certificação Microsoft Certified https://aka.ms/AIEngineerCert

## <a name="demonstrations"></a>Demonstrações

Siga os links abaixo para obter detalhes sobre como recriar as demonstrações apresentadas na palestra. Você precisará de uma Assinatura do Azure para executar essas demonstrações; caso não tenha uma, aqui está um link de [US$ 200 em créditos Azure gratuitos para novos assinantes](https://aka.ms/azure-free-credits).

1. [Configuração](DEMO%20Setup.md): crie contas e implante e configure recursos para oferecer suporte às demonstrações abaixo. Siga estas instruções antes de tentar qualquer uma das demonstrações abaixo.

1. [Pesquisa Visual Computacional](DEMO%20Computer%20Vision.md): use a Pesquisa Visual Computacional dos Serviços Cognitivos para analisar uma imagem por meio de um aplicativo Web e da CLI do Azure.

1. [Visão Personalizada](DEMO%20Custom%20Vision.md): crie um modelo de visão personalizada para detectar apenas produtos vendidos pela Tailwind Traders.

1. [Implementação de ONNX](DEMO%20ONNX%20deployment.md): implante um modelo de visão personalizada no formato ONNX no site da Tailwind Traders "Comprar por recurso de foto

1. [Personalizador](DEMO%20Personalizer.md): reconfigure dinamicamente o layout da seção "Recomendado" do site da Tailwind Traders para otimizar a probabilidade de um visitante anônimo clicar no produto "em destaque".

## <a name="feedback-loop"></a>Loop de Comentários

Você tem um comentário, feedback ou sugestão? O melhor loop de comentários para alterações/sugestões/feedback de conteúdo é criar um problema neste repositório GitHub. Para obter todos os detalhes sobre como criar um problema, consulte a [Documentação de contribuição](https://github.com/microsoft/ignite-learning-paths/blob/master/contributing.md)
