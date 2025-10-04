Feature: Identificação de Situação Acadêmica por Cores
    As professor
    I want visualizar cada aluno da turma identificado por uma cor (verde, laranja ou vermelho), de acordo com seu histórico e desempenho atual
    So eu consigo identificar rapidamente quais alunos estão em situação regular, de atenção ou crítica, e agir preventivamente para apoiar aqueles em risco de reprovação

Cenário: Envio bem-sucedido da autoavaliação
    GIVEN estou logado como “Aluno” com o login “egrab” e senha “123”
    AND estou na página "Autoavaliação"
    AND vejo todas as metas de aprendizagem “META 1” e ‘META” com os conceitos do professor na tela, ‘MA’ e ‘MPA’ respectivamente.
    WHEN eu seleciono um conceito nas ‘META 1’ e ,’META 2’ , ‘MA’ e ‘MA’ respectivamente
    AND seleciono em "Enviar"
    AND continua na página "Autoavaliação"
    THEN vejo a mensagem de confirmação "Autoavaliação enviada com sucesso"
    AND seleciono em “Menu”
    AND Visualizo  que meus conceitos, avaliados pelo professor e por mim, ficam salvos para todas as metas, ‘META 1’ e ‘META 2’de aprendizagem.

Cenário: envio mal-sucedido da autoavaliação
    GIVEN estou logado como “Aluno” com o login “egrab” e senha “123”
    AND estou na página "Autoavaliação"
    AND vejo todas as metas de aprendizagem “META 1” e ‘META” com os conceitos do professor na tela, ‘MA’ e ‘MPA’ respectivamente.
    WHEN eu seleciono um conceito na ‘META 1’ como ‘MA’ e não seleciono a ‘META 2’ 
    AND seleciono em "Enviar"
    AND continua na página "Autoavaliação"
    THEN vejo a mensagem de confirmação "TODOS OS CAMPOS DEVEM SER PREENCHIDOS"
    AND seleciono em “Reenviar”
    AND volto para a pagina “Autoavaliação 
    AND vejo todas as metas de aprendizagem “META 1” e ‘META” com os conceitos do professor na tela, ‘MA’ e ‘MPA’ respectivamente.

Cenário: Visualização de relatório sem discrepâncias
    GIVEN estou logado como “Professor” com o login “egrab” e senha “123”
    AND estou na página "MENU"
    AND a “Turma 2” está cadastrada no sistema
    AND há Aluno “José” com 5 metas onde todas tem autoavaliação “MPA” e avaliação do professor “MPA” cadastrado na “Turma 2”
    AND há Aluno “Maria” com 4 metas onde todas tem autoavaliação “MA” e avaliação do professor “MA” e 1 meta com autoavaliação “MA” e avaliação do professor ‘MPA” cadastrada na “Turma 2”
    AND há Aluno “Paulo” com 5 metas onde todas tem autoavaliação “MANA” e avaliação do professor “MANA” cadastrado na “Turma 2”
    WHEN eu seleciono “DISCREPÂNCIAS”
    AND estou na página “DISCREPÂNCIAS”
    AND seleciono a turma como “Turma 2”
    THEN vejo a o resumo do relatório e a lista de alunos
    AND total alunos é igual a 3
    AND discrepâncias é igual a 0
    AND percentual de discrepâncias é igual a 0%

Cenário: Visualização de relatório com 1 aluno com discrepâncias
    GIVEN estou logado como “Professor” com o login “egrab” e senha “123”
    AND estou na página "MENU"
    AND a “Turma 2” está cadastrada no sistema
    AND há Aluno “José” com 5 metas onde todas tem autoavaliação “MPA” e avaliação do professor “MPA” cadastrado na “Turma 2”
    AND há Aluno “Maria” com 2 metas onde todas tem autoavaliação “MA” e avaliação do professor “MA” e 3 metas com autoavaliação “MA” e avaliação do professor ‘MPA” cadastrada na “Turma 2”
    AND há Aluno “Paulo” com 5 metas onde todas tem autoavaliação “MANA” e avaliação do professor “MANA” cadastrado na “Turma 2”
    WHEN eu seleciono “DISCREPÂNCIAS”
    AND estou na página “DISCREPÂNCIAS”
    AND seleciono a turma como “Turma 2”
    THEN vejo a o resumo do relatório e a lista de alunos
    AND total alunos é igual a 3
    AND discrepâncias é igual a 1
    AND percentual de discrepâncias é igual a 33%

Cenário: Visualização de relatório com 100% de discrepâncias

    GIVEN estou logado como “Professor” com o login “egrab” e senha “123”
    AND estou na página "MENU"
    AND a “Turma 2” está cadastrada no sistema
    AND há Aluno “José” com 5 metas onde todas têm autoavaliação “MPA” e avaliação do professor “MA” cadastradas na “Turma 2”
    AND há Aluno “Maria” com 5 metas onde todas têm autoavaliação “MA” e avaliação do professor “MPA” cadastradas na “Turma 2”
    AND há Aluno “Paulo” com 5 metas onde todas têm autoavaliação “MANA” e avaliação do professor “MPA” cadastradas na “Turma 2”
    WHEN eu seleciono “DISCREPÂNCIAS”
    AND estou na página “DISCREPÂNCIAS”
    AND seleciono a turma como “Turma 2”
    THEN vejo o resumo do relatório e a lista de alunos
    AND total de alunos é igual a 3
    AND discrepâncias é igual a 3
    AND percentual de discrepâncias é igual a 100%