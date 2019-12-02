# <a name="show-faulty-prediction-and-make-a-change"></a>Mostrar previsão com falha e fazer uma alteração

## <a name="show-the-faulty-prediction"></a>Mostrar a previsão com falha

* Navegar até o site do Tailwind Traders
    * https://aiml50{eventname}.azurewebsites.net (substitua {eventname} pelo parâmetro de nome do evento usado para criar o ambiente de demonstração)

* Clique em `start smart shopping by uploading a photo`
* Carregue uma imagem da [pasta de imagens de teste](../source/test-images)
* O modelo fornece uma previsão incorreta.

## <a name="start-the-change"></a>Iniciar a mudança

* Ajuste o modelo alterando `setup_pipeline.py`
  * Linhas 162 – Alterar `epochs` para 20
  * Linhas 163 – Alterar `batch` para 10
* Confirme as alterações e envie por push para o mestre.  Isso dispara um build e a implantação do modelo.  Esse processo levará cerca de 25 ou 30 minutos e deverá ser concluído ao final da conversa.
* Voltaremos para verificar os resultados ao final da conversa

## <a name="example-demo"></a>Exemplo de demonstração

* [Simulação iniciando às 2:36](https://youtu.be/UgM8_4fAni8?t=158)