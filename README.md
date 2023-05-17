<h1 align="center"> Banco De Dados - Hospital Database </h1>
<br>
<h2 align="Center"> Banco de dados de um hospital, modelagem e MySQL.</h2>
<h2 align="center">1ª PARTE - O Hospital Fundamental. </h2>
<h3 align="center"> Modelagem Conceitual </h3>



O hospital precisa de um sistema para sua área clínica que facilite o controle das consultas realizadas. Os médicos que atuam no hospital podem ser generalistas, especialistas ou residentes, e seus dados pessoais são cadastrados em planilhas digitais. Cada médico pode ter uma ou mais especialidades, como pediatria, clínica geral, gastroenterologia e dermatologia. Alguns registros antigos ainda estão em formulários de papel, mas é necessário inserir esses dados no novo sistema.

Os pacientes também precisam ser cadastrados no sistema, contendo informações pessoais, como nome, data de nascimento, endereço, telefone e e-mail, além de documentos como CPF e RG. É importante registrar o convênio de cada paciente, incluindo nome, CNPJ e tempo de carência.

As consultas também são registradas em planilhas, contendo a data e a hora da realização, o médico responsável, o paciente e o valor da consulta ou o nome do convênio, juntamente com o número da carteira. Além disso, é necessário indicar a especialidade médica procurada pelo paciente durante a consulta.

Além disso, pretende-se informatizar as receitas médicas de modo que, ao encerrar a consulta, o médico possa registrar os medicamentos prescritos, suas quantidades e as instruções de uso. A partir dessas informações, o sistema deverá gerar um relatório da receita que poderá ser impresso e entregue ao paciente ou visualizado online.

Com esse novo sistema, o hospital terá um controle mais eficiente das consultas realizadas, facilitando o acesso às informações dos médicos, pacientes, convênios e receitas médicas, além de permitir a migração dos registros antigos para o formato digital. Isso contribuirá para um atendimento mais ágil e preciso, melhorando o cuidado com os pacientes.

<img src="Diagrama Entidade-Relacionamento_ Hospital (1).png"> </img>
<br>
<hr>
<h2 align="center">2ª PARTE - Os Segredos do Hospital. </h2>
<h3 align="center"> Modelagem lógica</h3>
<p> No hospital, as internações têm sido registradas por meio de formulários eletrônicos que gravam os dados em arquivos. Para cada internação, são anotadas a data de entrada, a data prevista de alta e a data efetiva de alta, além da descrição textual dos procedimentos a serem realizados. As internações precisam ser vinculadas a quartos, com a numeração e o tipo. Cada tipo de quarto tem sua descrição e o seu valor diário (a princípio, o hospital trabalha com apartamentos, quartos duplos e enfermaria).</p>
<p> Também é necessário controlar quais profissionais de enfermagem estarão responsáveis por acompanhar o paciente durante sua internação. Para cada enfermeiro(a), é necessário nome, CPF e registro no conselho de enfermagem (CRE).</p>
<p> A internação, obviamente, é vinculada a um paciente – que pode se internar mais de uma vez no hospital – e a um único médico responsável.</p>
<img align="center" src="Diagrama Entidade-Relacionamento_ Hospital (2).png"> </img>
<br>
<hr>
<h2 align="center">3ª PARTE - O Prisioneiro dos Dados  </h2>
<h3 align="center"> Povoamento inicial do sistema </h3>
Este repositório contém os scripts de povoamento das tabelas desenvolvidas na atividade anterior, conforme as regras estabelecidas. <br>Para garantir o bom funcionamento do sistema, é essencial que as seguintes atividades sejam observadas durante o povoamento inicial:

- Inclusão de pelo menos dez médicos de diferentes especialidades;
- Inclusão de pelo menos sete especialidades (considerando a afirmação de que “entre as especialidades há pediatria, clínica geral, gastrenterologia e dermatologia”);
- Inclusão de pelo menos 15 pacientes;
- Registro de 20 consultas de diferentes pacientes e médicos, com datas entre 01/01/2015 e 01/01/2022. Pelo menos dez consultas devem ter receituário com dois ou mais medicamentos;
- Inclusão de pelo menos quatro convênios médicos, com associação a pelo menos cinco pacientes e cinco consultas;
- Criação de entidade de relacionamento entre médico e especialidade;
- Criação de entidade de relacionamento entre internação e enfermeiro;
- Correção da chave estrangeira no relacionamento entre convênio e médico;
- Criação de entidade entre internação e enfermeiro;
- Inclusão de chaves estrangeiras dentro da tabela de internação (chaves de Médico e Paciente);
- Registro de pelo menos sete internações, com datas entre 01/01/2015 e 01/01/2022. Pelo menos dois pacientes devem ter se internado mais de uma vez. Pelo menos três quartos devem ser cadastrados;
- Inclusão dos dados de pelo menos três tipos de quarto (apartamento, quarto duplo e enfermaria), com valores diferentes;
- Inclusão dos dados de dez profissionais de enfermagem, com associação de cada internação a pelo menos dois enfermeiros.
Por fim, é importante destacar que os dados de tipo de quarto, convênio e especialidade são essenciais para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado. Assim, garantimos que o sistema esteja completo e funcional desde o seu primeiro uso.

O script se encontra no repositório, "hospital.sql"
<hr>
<h2 align="center">PARTE 4 - Alterando o banco de dados</h2>
<h3 align="center"> Alterações na tabela e dados. </h3>

-- Crie um script que adicione uma coluna “em_atividade” para os médicos, indicando se ele ainda está atuando no hospital ou não. 

ALTER TABLE medico ADD em_atividade BOOLEAN NOT NULL DEFAULT TRUE;

-- Atualizando ao menos 2 médicos como inativo
UPDATE medico SET em_atividade = FALSE WHERE cpf = 12345678901;
UPDATE medico SET em_atividade = FALSE WHERE cpf = 23456789012;

-- Definindo os demais médicos como ativos
UPDATE medico SET em_atividade = TRUE WHERE cpf NOT IN (12345678901, 23456789012);

<hr>
<h2 align="center">PARTE 5 - Consultas</h2>
<h3 align="center"> As Relíquias dos Dados </h3>

-- Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.

SELECT c.*, AVG(c.valor_consulta) AS valor_consulta
FROM consultas AS c
JOIN convenio AS conv ON c.id_convenio = conv.id_convenio
WHERE YEAR(c.data_realizacao) = 2020
GROUP BY c.id_consulta

-- Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.
SELECT * FROM internacao WHERE data_alta > data_prev_alta;

-- Receituário completo da primeira consulta registrada com receituário associado.
SELECT * FROM consultas AS c JOIN receitas AS r ON c.id_consulta = r.id_consulta ORDER BY c.data_realizacao, c.hora_realizacao LIMIT 1;


-- Para obter os dados da consulta de maior valor e da consulta de menor valor (ambas não realizadas sob convênio).

SELECT * FROM consultas WHERE id_convenio IS NULL ORDER BY valor_consulta DESC LIMIT 1;

SELECT * FROM consultas WHERE id_convenio IS NULL ORDER BY valor_consulta ASC LIMIT 1;

 -- Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.

ALTER TABLE Internacao
ADD COLUMN id_quarto INT;

ALTER TABLE Internacao
		ADD CONSTRAINT fk_id_quarto  FOREIGN KEY (id_quarto) REFERENCES quarto (id_quarto);


SELECT i.*, q.numero, t.valor_diaria,
       DATEDIFF(i.data_alta, i.data_entrada) AS num_dias,
       DATEDIFF(i.data_alta, i.data_entrada) * t.valor_diaria AS total_internacao
FROM Internacao AS i
JOIN Quarto AS q ON i.id_quarto = q.id_quarto
JOIN tipo_quarto AS t ON q.tipo = t.descricao;

-- Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.

SELECT i.data_entrada, i.procedimento, q.numero
FROM Internacao AS i
JOIN Quarto AS q ON i.id_quarto = q.id_quarto
JOIN tipo_quarto AS t ON q.tipo = t.descricao
WHERE t.descricao = 'apartamento';

-- Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.

SELECT p.nome_paciente, c.data_realizacao, c.especialidade
FROM consultas AS c
JOIN paciente AS p ON c.id_paciente = p.id_paciente
WHERE TIMESTAMPDIFF(YEAR, p.data_nascimento, c.data_realizacao) < 18
  AND c.especialidade <> 'pediatria'
ORDER BY c.data_realizacao;

-- Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
SELECT p.nome_paciente, m.nome_med, i.data_entrada, i.procedimento
FROM Internacao AS i
JOIN Medico AS m ON i.id_medico = m.id_medico
JOIN Paciente AS p ON i.id_paciente = p.id_paciente
JOIN Especialidades AS e ON m.id_especialidades = e.id_especialidades
JOIN Quarto AS q ON i.id_quarto = q.id_quarto
JOIN tipo_quarto AS t ON q.tipo = t.descricao
WHERE e.especialidades = 'Gastrenterologia' AND t.descricao = 'enfermaria';

-- Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.

SELECT m.nome_med, m.id_medico, COUNT(c.id_consulta) AS quantidade_consultas
FROM medico AS m
LEFT JOIN consultas AS c ON m.id_medico = c.id_medico
GROUP BY m.id_medico;

-- Todos os médicos que tenham "Gabriel" no nome. 

SELECT *
FROM medico
WHERE nome_med LIKE '%Gabriel%';

-- Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.

SELECT e.nome, e.cre, COUNT(i.id_internacao) AS quantidade_internacoes
FROM enfermeiro AS e
JOIN internacao_enfermeiro AS p ON e.id_enfermeiro = p.id_enfermeiro
JOIN internacao AS i ON p.id_internacao = i.id_internacao
GROUP BY e.id_enfermeiro
HAVING COUNT(i.id_internacao) > 1;
