Feature: Definição do cálculo de média
As a Professor do sistema
I want to Definir o cálculo da média da minha turma
So that O sistema calcule as notas finais com base nos critérios escolhidos

Scenario: Sucesso da configuração de cálculo de média
Given Eu criando uma turma
And Estou na página "Configuração de Média"
When Eu preencho os campos de quantidade de avaliações
And Preencho os pesos de cada avaliação
And Especifico o cálculo de média
And Confirmo a configuração
Then Estando na mesma página
And Vejo uma mensagem de sucesso que está configurado
And O sistema salva para aquela turma a configuracao

Scenario: Configuração de cálculo de média sem quantidade de avaliações
Given Eu criando uma turma
And Estou na página "Configuração de Média"
When Eu não preencho os campos da quantidade de avaliações
And Preencho os pesos de cada avaliação
And Especifico o cálculo de média
And Confirmo a configuração
Then Estando na mesma página
And Vejo uma mensagem de erro "300" que indica que o campo da quantidade de avaliações não foi definida

Scenario: Configuração de cálculo de média sem todos os pesos
Given Eu criando uma turma
And Estou na página “Configuração de Média”
When Eu preencho os campos da quantidade de avaliações
And Não Preencho 1 dos pesos das avaliações
And Especifico o cálculo de média
And Confirmo a configuração
Then Estando na mesma página
And Vejo uma mensagem de erro “200” que indica que o peso de uma das avaliações não foi definida.

Scenario: Configuração de cálculo de média sem especificação do cálculo
Given Eu criando uma turma
And Estou na página “Configuração de Média”
When Eu não preencho os campos da quantidade de avaliações
And Preencho os pesos de cada avaliação
And Não especifico o cálculo de média
And Confirmo a configuração
Then Estando na mesma página
And Vejo uma mensagem de erro “100” que indica que o cálculo da média não foi especificado
And Novo passo

Scenario: Novo cenário
Given Um estado
When Eu faço algo
Then O estado muda

Scenario: Mais um cenário novo
Given Eu estou em um estado
When Eu faço algo
Then fix(Algo acontece com o estado)
