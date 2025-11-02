import express = require('express');
import bodyParser = require("body-parser");

import { Aluno } from '../../gui/ta-gui/src/app/aluno';
import { CadastroDeAlunos } from './cadastrodealunos';

const multer = require('multer'); // ✅ com CommonJS
const csv_parser = require("csv-parser")
const fs = require("fs")


var app = express();

var cadastro: CadastroDeAlunos = new CadastroDeAlunos();

var allowCrossDomain = function (req: any, res: any, next: any) {
        res.header('Access-Control-Allow-Origin', "*");
        res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
        res.header('Access-Control-Allow-Headers', 'Content-Type');
        next();
}
app.use(allowCrossDomain);

app.use(bodyParser.json());

app.get('/alunos', function (req, res) {
        res.send(JSON.stringify(cadastro.getAlunos()));
})

app.post('/aluno', function (req: express.Request, res: express.Response) {
        var aluno: Aluno = <Aluno>req.body; //verificar se é mesmo Aluno!
        aluno = cadastro.criar(aluno);
        if (aluno) {
                res.send({ "success": "O aluno foi cadastrado com sucesso" });
        } else {
                res.send({ "failure": "O aluno não pode ser cadastrado" });
        }
})

app.put('/aluno', function (req: express.Request, res: express.Response) {
        var aluno: Aluno = <Aluno>req.body;
        aluno = cadastro.atualizar(aluno);
        if (aluno) {
                res.send({ "success": "O aluno foi atualizado com sucesso" });
        } else {
                res.send({ "failure": "O aluno não pode ser atualizado" });
        }
})


// Testes de importacao de metas(por planilha);
// [] Recebimento de um csv(ver alternativa para excel tambem) e interpretacao de seus dados
// [] Checagem de nomes de metas certos(ou receber eles mudados do front, ou faltando)
//  - Talvez a solucao seja receber com um get todos os nomes de metas e tratar isso no front
// [] Checagem de integridade do arquivo

const upload = multer({ dest: 'tmp_dest/' });

app.post("/metas", upload.single('file'), function (req: express.Request, res: express.Response) {
        const filePath = req.file?.path;
        // posso pegar os dados de troca de colunas se isso for passado como outro elemento do body por exemplo
        // no multi dada, como um req.body.data e a partir disso trocar
        var newCols_Name: { [key: string]: string } = { "Col1": "Coluna 1", "Col4": "Coluna two" }
        // campos do csv que devem estar, os que forem fora deles podem permanecer mas esses sao necessarios
        // poderia extender e colocar valor default tambem
        var default_fields = ["Coluna 1", "Coluna 2", "Coluna 3"]

        var lines: any[] = []

        fs.createReadStream(filePath)
                .pipe(csv_parser()) // transforma em csv
                .on('data', (d: any) => {
                        // exemplo de remapeamento
                        // Supondo que 'd' seja um objeto JavaScript
                        var new_line: { [key: string]: string } = Object.fromEntries(
                                Object.entries(d).map(([key, value]) => {
                                        var v: string = String(value) // para ter certeza
                                        // se a coluna existe ele troca se nao ele apenas retorna ela normalmente
                                        if (key in newCols_Name) {
                                                return [newCols_Name[key], v];
                                        }
                                        else {
                                                return [key, v]
                                        }
                                })
                        ) as { [key: string]: string };
                        // alem disso para tratar a falta de certos campos podemos ter
                        // vai adicionar os campos que faltam dando preferencia aos que ja tem caso forem trocados ou nao pelo codigo acima
                        new_line = Object.assign(Object.fromEntries(
                                default_fields.map(f => [f, ""]) // cria um mapa com os campos obrigatorios com valor de ""
                        ), new_line);
                        // junta tudo em um json
                        lines.push(new_line);
                })
                .on('end', () => {
                        console.log(lines);
                        res.json(lines)
                        fs.unlinkSync(filePath)
                });

})

var server = app.listen(3000, function () {
        console.log('Example app listening on port 3000!')
})

function closeServer(): void {
        server.close();
}

export { app, server, closeServer }
