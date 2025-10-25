import { Aluno } from '../common/aluno';

export class CadastroDeAlunos {
   alunos: Aluno[] = [];

    cadastrar(aluno: Aluno): Aluno {
     var result = null;
     if (this.cpfegithubnaocadastrado(aluno.cpf, aluno.github_login)) {
       result = new Aluno();
       result.copyFrom(aluno);
       this.alunos.push(result);
     }
     return result;
   }

    cpfegithubnaocadastrado(cpf: string, github_login: string): boolean {
      return !this.alunos.find(a => a.cpf == cpf) && !this.alunos.find(a => a.github_login == github_login);
   }

    atualizar(aluno: Aluno): Aluno {
     var result: Aluno = this.alunos.find(a => a.cpf == aluno.cpf);
     if (result) result.copyFrom(aluno);
     return result;
   }
   
   // poderia retornar ela mas preferi nao
   delete_elemento_cpf(aluno_cpf: string):boolean{
     // poeria colocar github_login mas o cpf tmabém é único
     var l = this.alunos.length;
     this.alunos = this.alunos.filter(i => i.cpf != aluno_cpf);
     return l > this.alunos.length;
   }

    getAlunos(): Aluno[] {
     return this.alunos;
   }
}
