Feature: Importação de notas a partir de uma planilha

  Como professor/administrador
  Eu quero importar notas de uma planilha (.xlsx, .xls, .csv)
  Para que eu possa registrar as notas dos alunos de forma rápida e eficiente, indicando a coluna de notas.

  Scenario: Importação de Planilha Válida com Mapeamento de Coluna
    Given que eu estou na página de importação de notas
    And que eu selecionei um arquivo de notas válido (.csv)
    When eu mapeio a coluna "Nota Final" da planilha para o campo "Notas Finais" do sistema
    And eu confirmo a importação
    Then as notas devem ser atualizadas corretamente para os alunos correspondentes

  Scenario: Importação de Planilha com Formato de Dados Inválido
    Given que eu estou na página de importação de notas
    And que eu selecionei um arquivo onde a coluna de notas contém texto
    When eu tento iniciar a importação
    Then o sistema deve exibir uma mensagem de erro clara
    And as notas não devem ser atualizadas no sistema