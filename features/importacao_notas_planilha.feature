Feature: Importação de Notas
        As a professor do sistema
        I want to importar notas de um CSV para a minha turma
        So that eu possa consolidar o desempenho da minha turma

        Scenario: Importação correta de Metas/Notas
        Given Estou na página de importação
        When faço upload de um arquivo "notas.csv"
        And o csv ja tem as colunas correspondentes
        Then Vejo uma mensagem de sucesso 

        Scenario: Importação de Metas/Notas, formato errado
        Given Estou na página de importação
        When faço upload de um arquivo "notas.excel"
        And o sistema tenta importa as notas
        Then Vejo uma mensagem de erro "HTTP error 415" e uma mensagem de "formato de arquivo errado"

        Scenario: Colunas diferentes do formato padrão
        Given Estou na página de importação
        And o formato padrão tem as colunas "cadeira" e "avaliação"
        When faço upload de um arquivo "notas.csv", com as colunas "disciplina" e "nota" 
        And o sistema mostra a interface para eu relacionar as colunas
        And ligo "disciplina" com "cadeira"
        And ligo "nota" com "avaliação"
        Then Vejo uma mensagem de sucesso de formato

        Scenario: Colunas diferentes do formato padrão, colunas faltantes
        Given Estou na página de importação
        And o formato padrão tem as colunas "cadeira" e "avaliação"
        When faço upload de um arquivo "notas.csv", com as colunas "disciplina" e "nota" 
        And o sistema mostra a interface para eu relacionar as colunas
        And ligo "nota" com "avaliação"
        Then Vejo uma mensagem de "HTTP erro 415", indicando a coluna que falta colocar
