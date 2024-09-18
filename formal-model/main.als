module main

abstract sig Status {}
sig EmEspera, Apto, Rejeitado extends Status {}

abstract sig Usuario {}
sig Professor extends Usuario {}
sig Aluno extends Usuario {
    avaliacoes: set Avaliacao
}

sig Projeto {
    responsavel: one Professor,
    alunos: set Aluno
}

sig Candidatura {
    projeto: one Projeto,
    aluno: one Aluno,
    status: one Status
}

sig Avaliacao {
    aluno: one Aluno,
    descricao: String,
    autor: one Professor
}

fact TodoAlunoEmProjetoDeveTerCandidatura {
    all a: Aluno, p: Projeto | some c: Candidatura | 
    (a in p.alunos) => (c.projeto = p and c.aluno = a)
}

fact AlunoRejeitadoEmProjetoNaoPodeSeInscreverNovamente {
    all c: Candidatura | all p: Projeto, a: Aluno | 
    a = c.aluno and p = c.projeto and c.aluno in c.projeto.alunos implies 
    (c.status = EmEspera or c.status = Apto)
}

pred avaliarAluno [p: Professor, av: Avaliacao, a: Aluno] {
    av.aluno = a and av.autor = p and a.avaliacoes = a.avaliacoes + av
}

pred lerAvaliacoesAluno [p: Professor, a: Aluno] {
    all av: Avaliacao | av in a.avaliacoes
}

pred aceitarAluno [p: Professor, c: Candidatura] {
    c.status = Apto and c.aluno in c.projeto.alunos
}

pred rejeitarAluno [p: Professor, c: Candidatura] {
    c.status = Rejeitado and c.aluno not in c.projeto.alunos
}

pred demonstrarInteresse [a: Aluno, p: Projeto] {
    some c: Candidatura | a = c.aluno and p in c.projeto and c.status = EmEspera
}

run {} for exactly 3 Aluno, 3 Status, 2 Projeto, 1 Professor, 2 Candidatura, 1 Avaliacao


assert AlunoEmProjetoTemCandidatura {
    all a: Aluno, p: Projeto | 
        (a in p.alunos) implies (some c: Candidatura | c.projeto = p and c.aluno = a)
}

check AlunoEmProjetoTemCandidatura for 10

assert NaoHaAlunoRejeitadoEmProjeto {
    all a: Aluno, p: Projeto | a in p.alunos implies (some c: Candidatura | c.aluno = a and c.projeto = p and c.status != Rejeitado)
}

check NaoHaAlunoRejeitadoEmProjeto for 10

