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
    