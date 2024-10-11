Lucas Andrade Gonçalves Pereira 22B
Lista de banco de dados sobre  joins e create view



/*
1. Exibir lista de alunos e seus cursos
Crie uma view que mostre o nome dos alunos e as disciplinas em que estão matriculados, incluindo o nome do curso.

Resposta:
CREATE VIEW AlunosCursos
SELECT 
    a.nome AS aluno,
    d.nome AS disciplina,
    c.nome AS curso
FROM 
    alunos a
JOIN 
    matriculas m ON a.id = m.aluno_id
JOIN 
    disciplinas d ON m.disciplina_id = d.id
JOIN 
    cursos c ON d.curso_id = c.id;
*/

/*
2. Exibir total de alunos por disciplina
Crie uma view que mostre o nome das disciplinas e a quantidade de alunos matriculados em cada uma.

Resposta:
CREATE VIEW AlunoDisciplina
SELECT 
    d.nome AS disciplina,
    COUNT(m.aluno_id) AS total_alunos
FROM 
    disciplinas d
LEFT JOIN 
    matriculas m ON d.id = m.disciplina_id
GROUP BY 
    d.nome;
*/

/*
3. Exibir alunos e status das suas matrículas
Crie uma view que mostre o nome dos alunos, suas disciplinas e o status da matrícula (Ativo, Concluído, Trancado).

Resposta:
CREATE VIEW AlunoMatricula
SELECT 
    a.nome AS aluno,
    d.nome AS disciplina,
    m.status AS status_matricula
FROM 
    alunos a
JOIN 
    matriculas m ON a.id = m.aluno_id
JOIN 
    disciplinas d ON m.disciplina_id = d.id;
*/

/*
4. Exibir professores e suas turmas
Crie uma view que mostre o nome dos professores e as disciplinas que eles lecionam, com os horários das turmas.

Resposta:
CREATE VIEW ProfessoresTurmas
SELECT 
    p.nome AS professor,
    d.nome AS disciplina,
    t.horario AS horario
FROM 
    professores p
JOIN 
    disciplinas d ON p.id = d.professor_id
JOIN 
    turmas t ON d.id = t.disciplina_id;
*/

/*
5. Exibir alunos maiores de 20 anos
Crie uma view que exiba o nome e a data de nascimento dos alunos que têm mais de 20 anos.

Resposta:
CREATE VIEW AlunosMaior20 
SELECT 
    nome,
    data_nascimento
FROM 
    alunos
WHERE 
    DATEDIFF(CURDATE(), data_nascimento) / 365 > 20;
*/

/*
6. Exibir disciplinas e carga horária total por curso
Crie uma view que exiba o nome dos cursos, a quantidade de disciplinas associadas e a carga horária total de cada curso.

Resposta:
CREATE VIEW DisciplinasCurso 
SELECT 
    c.nome AS curso,
    COUNT(d.id) AS total_disciplinas,
    SUM(d.carga_horaria) AS carga_horaria_total
FROM 
    cursos c
JOIN 
    disciplinas d ON c.id = d.curso_id
GROUP BY 
    c.nome;
*/

/*
7. Exibir professores e suas especialidades
Crie uma view que exiba o nome dos professores e suas especialidades.

Resposta:
CREATE VIEW ProfessoresEspecialidades
SELECT 
    nome,
    especialidade
FROM 
    professores;
*/

/*
8. Exibir alunos matriculados em mais de uma disciplina
Crie uma view que mostre os alunos que estão matriculados em mais de uma disciplina.

Resposta:
CREATE VIEW AlunosMultidisciplinas 
SELECT 
    a.nome AS aluno
FROM 
    alunos a
JOIN 
    matriculas m ON a.id = m.aluno_id
GROUP BY 
    a.nome
HAVING 
    COUNT(m.disciplina_id) > 1;
*/

/*
9. Exibir alunos e o número de disciplinas que concluíram
Crie uma view que exiba o nome dos alunos e o número de disciplinas que eles concluíram.

Resposta:
CREATE VIEW AlunosDisciplinaConcluidas
SELECT 
    a.nome AS aluno,
    COUNT(m.disciplina_id) AS disciplinas_concluidas
FROM 
    alunos a
JOIN 
    matriculas m ON a.id = m.aluno_id
WHERE 
    m.status = 'Concluído'
GROUP BY 
    a.nome;
*/

/*
10. Exibir todas as turmas de um semestre específico
Crie uma view que exiba todas as turmas que ocorrem em um determinado semestre (ex.: 2024.1).

Resposta:
CREATE VIEW TurmasSemestre
SELECT 
    t.id AS turma_id,
    d.nome AS disciplina,
    t.horario,
    t.semestre
FROM 
    turmas t
JOIN 
    disciplinas d ON t.disciplina_id = d.id
WHERE 
    t.semestre = '2024.1';
*/

/*
11. Exibir alunos com matrículas trancadas
Crie uma view que exiba o nome dos alunos que têm matrículas no status "Trancado".

Resposta:
CREATE VIEW AlunosTrancados
SELECT 
    a.nome AS aluno
FROM 
    alunos a
JOIN 
    matriculas m ON a.id = m.aluno_id
WHERE 
    m.status = 'Trancado';
*/

/*
12. Exibir disciplinas que não têm alunos matriculados
Crie uma view que exiba as disciplinas que não possuem alunos matriculados.

Resposta:
CREATE VIEW DisciplinasSemAlunos
SELECT 
    d.nome AS disciplina
FROM 
    disciplinas d
LEFT JOIN 
    matriculas m ON d.id = m.disciplina_id
WHERE 
    m.aluno_id IS NULL;
*/

/*
13. Exibir a quantidade de alunos por status de matrícula
Crie uma view que exiba a quantidade de alunos para cada status de matrícula (Ativo, Concluído, Trancado).

Resposta:
CREATE VIEW AlunosStatusQuantidade
SELECT 
    m.status AS status_matricula,
    COUNT(m.aluno_id) AS total_alunos
FROM 
    matriculas m
GROUP BY 
    m.status;
*/

/*
14. Exibir o total de professores por especialidade
Crie uma view que exiba a quantidade de professores por especialidade (ex.: Engenharia de Software, Ciência da Computação).

Resposta:
CREATE VIEW TotalProfessoresEspecialidade
SELECT 
    especialidade,
    COUNT(id) AS total_professores
FROM 
    professores
GROUP BY 
    especialidade;
*/

/*
15. Exibir lista de alunos e suas idades
Crie uma view que exiba o nome dos alunos e suas idades com base na data de nascimento.

Resposta:
CREATE VIEW AlunosIdades
SELECT 
    nome,
    FLOOR(DATEDIFF(CURDATE(), data_nascimento) / 365) AS idade
FROM 
    alunos;
*/

/*
16. Exibir alunos e suas últimas matrículas
Crie uma view que exiba o nome dos alunos e a data de suas últimas matrículas.

Resposta:
CREATE VIEW AlunosUltimasMatriculas
SELECT 
    a.nome AS aluno,
    MAX(m.data_matricula) AS ultima_matricula
FROM 
    alunos a
JOIN 
    matriculas m ON a.id = m.aluno_id
GROUP BY 
    a.nome;
*/

/*
17. Exibir todas as disciplinas de um curso específico
Crie uma view que exiba todas as disciplinas pertencentes a um curso específico, como "Engenharia de Software".

Resposta:
CREATE VIEW DisciplinasCursoEspecifico
SELECT 
    d.nome AS disciplina
FROM 
    disciplinas d
JOIN 
    cursos c ON d.curso_id = c.id
WHERE 
    c.nome = 'Engenharia de Software';
*/

/*
18. Exibir os professores que não têm turmas
Crie uma view que exiba os professores que não estão lecionando em nenhuma turma.

Resposta:
CREATE VIEW ProfessoresSemTurmas 
SELECT 
    p.nome AS professor
FROM 
    professores p
LEFT JOIN 
    disciplinas d ON p.id = d.professor_id
LEFT JOIN 
    turmas t ON d.id = t.disciplina_id
WHERE 
    t.id IS NULL;
*/

/*
19. Exibir lista de alunos com CPF e email
Crie uma view que exiba o nome dos alunos, CPF e email.

Resposta:
CREATE VIEW AlunosCPFEmail
SELECT 
    nome,
    cpf,
    email
FROM 
    alunos;
*/

/*
20. Exibir o total de disciplinas por professor
Crie uma view que exiba o nome dos professores e o número de disciplinas que cada um leciona.

Resposta:
CREATE VIEW TotalDisciplinasProfessor
SELECT 
    p.nome AS professor,
    COUNT(d.id) AS total_disciplinas
FROM 
    professores p
JOIN 
    disciplinas d ON p.id = d.professor_id
GROUP BY 
    p.nome;
*/
