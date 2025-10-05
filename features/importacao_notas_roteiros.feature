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
