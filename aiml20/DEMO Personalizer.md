# <a name="personalizer-demo"></a>Demonstração do Personalizador

Nesta demonstração, observe como o layout de um site se adapta às ações do visitante usando o aprendizado por reforço e o [Personalizador de Serviços Cognitivos](https://docs.microsoft.com/en-us/azure/cognitive-services/personalizer/?WT.mc_id=msignitethetour2019-github-aiml20).

O Personalizador reconfigurará dinamicamente a interface para otimizar a probabilidade de um visitante anônimo clicar na categoria em destaque na seção Recomendada.

1. Implantar o aplicativo Web da Tailwind Traders (caso ainda não tenha feito com `DEMO Setup.md`)

2. Visite a home page da Tailwind Traders

3. Observe a seção "Recomendado" e a ordem das categorias em destaque

4. Atualize a página (talvez seja necessário fazer isso algumas vezes). Observe que o layout é alterado.

O serviço Personalizador está acompanhando os visitantes anônimos e registrando a hora do dia, o dia da semana e o SO do navegador usado quando as categorias são clicadas. A "recompensa" indica se a seção grande e em destaque foi clicada. 

Com o tempo, o Personalizador determinará a melhor categoria para o recurso com base na hora do dia, no dia da semana e no SO. Ele também "explorará" 20% do tempo para orientar as categorias que, de outra forma, não seriam apresentadas.
