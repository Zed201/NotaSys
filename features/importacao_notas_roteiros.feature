Feature: Importação de Notas de Roteiros

    Description: Importar de um arquivo CSV, as notas dos roteiros dos alunos para a composição da avaliação

    Scenario: Importação correta de Notas dos roteiros ao final do período
        Given Estou na página “Avaliações”
        And Busco a opção de importação
        And Não existe um arquivo de notas
        When Carrego um arquivo "notas_roteiros.csv"
        And O csv possui as colunas correspondentes
        Then Recebo uma mensagem de sucesso 

    Scenario: Importação de Notas, tipo errado
        Given Estou na página “Avaliações”
        And Busco a opção de importação
        And Não existe um arquivo de notas
        When Carrego um arquivo "notas_roteiros.xlsl"
        Then Recebo uma mensagem de erro "HTTP error 409" e uma mensagem indicando formato errado de arquivo

    Scenario: Importação de Notas, formato errado
        Given Estou na página “Avaliações”
        And Busco a opção de importação
        And Não existe um arquivo de notas
        When Carrego um arquivo "notas_roteiros.csv"
        And O csv possui uma letra “N” no espaço de uma nota
        Then Recebo uma mensagem de erro "HTTP error 415" e uma mensagem de "formato de arquivo errado"

    Scenario: Importação repetidas de Notas
        Given Estou na página “Avaliações”
        And Busco a opção de importação
        And Existe um arquivo “notas_roteiros.csv”
        When Carrego um arquivo diferente "Notas_roteiros.csv" 
        Then Recebo uma mensagem de “HTTP error 409”, indicando sobreposição de arquivo
