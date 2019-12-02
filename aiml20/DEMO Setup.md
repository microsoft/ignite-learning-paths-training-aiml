# <a name="setup-for-aiml20-demos"></a>Configuração para demonstrações do AIML20

Estas tarefas foram executadas com antecedência para a apresentação do AIML20. Siga estas mesmas etapas e se prepare para os scripts de demonstração restantes.

## <a name="clone-the-repository-to-your-local-machine"></a>Clone o repositório em seu computador local

Você precisará dos conteúdos de https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml20 em computador local. A maneira mais fácil de fazer isso é visitar o [Guia do Desenvolvedor para o repositório do Roteiro de Aprendizagem de IA](https://github.com/microsoft/ignite-learning-paths-training-aiml) e clicar no botão "Clonar ou baixar". Faremos referências aos arquivos relativos à pasta `aiml20`.

## <a name="sign-up-for-an-azure-subscription"></a>Inscrever-se para uma assinatura do Azure

Caso ainda não tenha uma assinatura do Azure, é possível [inscrever-se aqui](https://azure.microsoft.com/free/?WT.mc_id=msignitethetour2019-github-aiml20) e também obter US$ 200 para usar em créditos gratuitos do Azure. 

## <a name="find-your-azure-subcription-id"></a>Localizar sua ID de assinatura do Azure

No [portal do Azure](https://portal.azure.com), entre e clique em "Assinaturas" na barra de menus à esquerda. Clique no Nome da Assinatura que você usará e copie a "ID da Assinatura" exibida. Você precisará delas posteriormente quando criar os recursos.

Como alternativa, execute `az account show` na CLI do Azure e copie o valor exibido da "ID".

## <a name="start-fresh"></a>Comece de novo.

 Caso tenha executado as demonstrações anteriormente, exclua estes grupos de recursos se eles existirem:
 
 - `aiml20-demo`

 É possível usar o portal do Azure ou executar este comando na CLI do Azure:

 ```sh
 az group delete --name aiml20-demo
 ```

## <a name="deploy-the-tailwind-traders-website"></a>Implantar o site da Tailwind Traders.

Clique no botão abaixo. Isso implantará o [site da TailwindTraders](https://github.com/Microsoft/TailwindTraders-Website) do GitHub usando um modelo ARM para habilitar a integração do Personalizador e do recurso Comprar pela Foto baseado em ONNX. ([Mais detalhes sobre essa implantação](https://github.com/microsoft/TailwindTraders-Website/blob/master/Source/Tailwind.Traders.Web/Standalone/README.md).)

[![Implantar no Azure](https://azuredeploy.net/deploybutton.svg)](https://portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoft%2FTailwindTraders-Website%2Fmaster%2Fazuredeploy.json)

No formulário que aparecer, selecione as seguintes opções:

* Assinatura: Selecione a assinatura na qual deseja implantar os recursos

* Grupo de recursos: os recursos serão criados no grupo de recursos que você especificar.
  Recomendamos escolher "Novo" e inserir o nome `aiml20-demo`. Quando terminar, será possível excluir esse grupo de recursos para desligar o site e excluir todos os recursos associados.

* Local: A região do Azure onde os recursos serão implantados. Será preciso implantar o Banco de Dados SQL e os Serviços de Aplicativos nessa região. 

  Observação: Como o Personalizador atualmente está disponível somente no Oeste dos EUA 2 e no Oeste da Europa, ele será implantado nessas regiões, independentemente de sua escolha.

* Nome do site: Isso será usado na URL do site e visível publicamente, bem como deve ser globalmente exclusivo. Para evitar conflitos, escolha `aiml20-xy` substituindo `xy` por suas iniciais, porém faremos referência a esse nome como `aiml20` nesses scripts. (Caso escolha um nome que esteja em uso, você receberá mensagens de erros de "Conflito" durante a implantação.)

* Local do site: Insira a versão curta do "Local" acima, por exemplo, `westus2`.
  (É possível obter uma lista de nomes curtos na CLI do Azure com: `az account
  list-locations -o table`).

* Modo de implantação: Escolha `standalone`

* Logon do SQL: Inserir `twt`

* Senha do SQL: gere e use uma senha segura (ela deve incluir pontuação e maiúsculas e minúsculas, mas não use `;`). Ela não será necessária para nossas demonstrações, portanto, não há necessidade de escrevê-la.

* Habilitar o Personalizador: escolha `true`

* URL do repositório: aceite o padrão, `https://github.com/microsoft/TailwindTraders-Website`

* Ramificação: aceite o padrão, `master`

(Como um backup, também é possível usar a URL do repositório `https://github.com/revodavid/TailwindTraders-Website` com a ramificação `aiml20`.
Isso foi bifurcado em 25/10/2019 e funciona bem.)

Marque "Concordo com os termos e as condições" e clique em "Comprar".

Aguarde pelo menos 15 minutos para que o site seja implantado. 

A URL do site implantado terá o formato SITENAME.azurewebsites.net (usando o Nome do Site fornecido acima) ou é possível encontrá-lo da seguinte maneira:

* clique em "Ir para o Recurso" em "Próximas Etapas"

* Clique no recurso "Serviço de Aplicativo"

* Veja o valor da "URL" exibido no painel à direita

A URL do site será exibida após a etapa "Configurar o Controle do Código-Fonte" ou será possível inspecionar o recurso "Serviço de Aplicativo".

### <a name="install-the-simple-onnx-model"></a>Instalar o modelo de ONNX "simples"

Siga as instruções em [DEMO ONNX deployment.md](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model) sob o título "Carregar o modelo de ONNX simples". Isso degradará a ferramenta "Comprar pela Foto" no aplicativo para reconhecer somente os martelos e as furadeiras.

## <a name="configure-visual-studio-code"></a>Configurar o código do Visual Studio Code

Instale a extensão [Conta do Azure](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account).
(No Windows, também será necessário [instalar o node.js](https://nodejs.org/).) No VS Code, faça logon no Azure com o comando "Azure: Entrar" (use Control-Shift-P para abrir a Paleta de Comandos). Para executar os comandos da CLI do Azure de um script no VS Code, use "Terminal: Executar o Texto Selecionado no Terminal do Azure" para copiar os comandos.

Como alternativa, será possível [instalar a CLI do Azure](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=https://docs.microsoft.com/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=msignitethetour2019-github-aiml20) em seu computador local com Windows, MacOS ou Linux. Caso ela não esteja instalada, também será possível iniciar o [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20) e executar esses comandos em uma janela do navegador. 

## <a name="prepare-visual-studio-for-demo"></a>Preparar o Visual Studio para demonstração

- Abra `vision_demo.sh`
- inicie um Cloud Shell com "Azure: Abrir o Bash no Cloud Shell". (Se preferir, será possível usar a CLI do Azure localmente.)   

## <a name="open-browser-pages-ready-to-demo"></a>Abra as páginas do navegador prontas para a demonstração.

* O aplicativo da Tailwind Trader implantado 
* https://portal.azure.com (procurar recursos)  
* https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/
* https://customvision.ai
* https://lutzroeder.github.io/netron/

## <a name="download-image-files-to-local-machine"></a>Baixar arquivos de imagem para o computador local

Baixe "Imagens de Treinamento de CV.zip" em seu computador local e expanda o arquivo zip. Isso criará uma pasta "Imagens de Treinamento de CV" com as seguintes subpastas:

* furadeiras
* martelos
* capacetes
* alicate
* chaves de fenda

Essas imagens serão usadas para testar o serviço de Pesquisa Visual Computacional e criar um modelo com o serviço de Visão Personalizada.

Essas imagens foram obtidas do Wikimedia Commons e usadas de acordo com suas respectivas licenças do Creative Commons. Consulte o arquivo [ATTRIBUTIONS.md](Attributions.md) para obter detalhes.

Baixe também a pasta "imagens de teste". Essas imagens não serão usadas no treinamento, e sim para testar se nossos modelos estão funcionando.

## <a name="next-step"></a>Próxima etapa

[Pesquisa Visual Computacional](DEMO%20Computer%20Vision.md)