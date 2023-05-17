CREATE DATABASE IF NOT EXISTS Hospital;

USE Hospital;

CREATE TABLE IF NOT EXISTS consultas (
  id_consulta INT PRIMARY KEY AUTO_INCREMENT, 
  data_realizacao DATE, 
  hora_realizacao TIME,
  valor_consulta FLOAT(8,2),
  num_carteira INT,
  especialidade varchar(255),
  id_medico int,
  id_paciente int, 
  id_convenio int
  );
  
  ALTER TABLE consultas
		ADD CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES medico (id_medico);
ALTER TABLE consultas
		ADD CONSTRAINT fk_paciente FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente);
ALTER TABLE consultas
		ADD CONSTRAINT fk_convenio FOREIGN KEY (id_convenio) REFERENCES convenio (id_convenio);
  
CREATE TABLE IF NOT EXISTS paciente (
  id_paciente INT PRIMARY KEY AUTO_INCREMENT,
  nome_paciente varchar(255),
  data_nascimento varchar(255),
  endereco varchar(255),
  telefone bigint(14),
  email varchar (100),
  cpf varchar (14),
  rg varchar(20),
  id_convenio int
);

ALTER TABLE paciente
		ADD CONSTRAINT fk_convenio_paciente FOREIGN KEY (id_convenio) REFERENCES convenio (id_convenio);

CREATE TABLE IF NOT EXISTS medico (
  id_medico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome_med varchar(255),
  cpf varchar (14),
  rg varchar(20),
  telefone bigint(14),
  email varchar (100),
  id_especialidade int 
);


ALTER TABLE medico
		ADD CONSTRAINT fk_especialidade FOREIGN KEY (id_especialidade) REFERENCES especialidades (id_especialidade);

CREATE TABLE IF NOT EXISTS convenio (
  id_convenio INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome_convenio varchar(255),
  cnpj varchar(18),
  tempo_carencia int,
  id_paciente int
);

ALTER TABLE convenio
		ADD CONSTRAINT fk_paciente_convenio FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente);

CREATE TABLE IF NOT EXISTS especialidades (
  id_especialidade INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome_especialidade varchar(255),
  id_medico int
);

ALTER TABLE especialidades
		ADD CONSTRAINT fk_medico_especialidades FOREIGN KEY (id_medico) REFERENCES medico (id_medico);

CREATE TABLE IF NOT EXISTS convenio_paciente (
  id_convenio_paciente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  id_paciente int,
  id_convenio int 
); 

ALTER TABLE convenio_paciente
		ADD CONSTRAINT fk_conv_paciente FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente);
ALTER TABLE convenio_paciente
		ADD CONSTRAINT fk_name_convenio FOREIGN KEY (id_convenio) REFERENCES convenio (id_convenio);

CREATE TABLE IF NOT EXISTS receitas (
  id_receita INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  data_emissao date,
  medicamento varchar(255),
  id_paciente int, 
  id_medico int,
  id_consulta int
);

ALTER TABLE receitas
		ADD CONSTRAINT fk_rec_paciente FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente);
ALTER TABLE receitas
		ADD CONSTRAINT fk_rec_medico FOREIGN KEY (id_medico) REFERENCES medico (id_medico);
ALTER TABLE receitas
		ADD CONSTRAINT fk_consulta FOREIGN KEY (id_consulta) REFERENCES consultas (id_consulta);

CREATE TABLE IF NOT EXISTS medicamentos (
  id_medicamento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  medicamento varchar(255),
  quantidade int,
  instrucoes text
);

CREATE TABLE IF NOT EXISTS receita_med (
  id_receita_medicamento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  id_receita int, 
  id_medicamento int
);

ALTER TABLE receita_med
		ADD CONSTRAINT fk_receita FOREIGN KEY (id_receita) REFERENCES receitas (id_receita);
ALTER TABLE receita_med
		ADD CONSTRAINT fk_medicamento FOREIGN KEY (id_medicamento) REFERENCES medicamentos (id_medicamento);

CREATE TABLE IF NOT EXISTS medico_especialidade (
  id_medico_especialidade INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  id_medico int,
  id_especialidade int
);

ALTER TABLE medico_especialidade
		ADD CONSTRAINT fk_med_especialidade  FOREIGN KEY (id_medico) REFERENCES medico (id_medico);
ALTER TABLE medico_especialidade
		ADD CONSTRAINT fk_name_especialidade  FOREIGN KEY (id_especialidade) REFERENCES especialidades (id_especialidade);


CREATE TABLE IF NOT EXISTS Internacao (
  id_internacao INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  data_entrada date,
  data_prev_alta date,
  data_alta date, 
  procedimento text,
  id_paciente int, 
  id_medico int
);

ALTER TABLE Internacao
		ADD CONSTRAINT fk_name_paciente  FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente);
ALTER TABLE Internacao
		ADD CONSTRAINT fk_name_medico  FOREIGN KEY (id_medico) REFERENCES medico (id_medico);

CREATE TABLE IF NOT EXISTS Quarto (
  id_quarto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  numero int,
  tipo varchar(255)
);

CREATE TABLE IF NOT EXISTS tipo_quarto (
  id_tipo_quarto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  descricao VARCHAR(255),
  valor_diaria float(8,2)
);

CREATE TABLE IF NOT EXISTS Enfermeiro (
  id_enfermeiro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome varchar(255),
  cpf varchar(11),
  cre int
);

-- Inserção dos médicos
INSERT INTO medico (nome_med, cpf, rg, telefone, email) VALUES
('Dr. João Silva', 12345678901, '1234567', 1234567890, 'dr.joao@example.com'),
('Dra. Maria Santos', 23456789012, '2345678', 2345678901, 'dra.maria@example.com'),
('Dr. Carlos Oliveira', 34567890123, '3456789', 3456789012, 'dr.carlos@example.com'),
('Dra. Ana Pereira', 45678901234, '4567890', 4567890123, 'dra.ana@example.com'),
('Dr. Eduardo Ferreira', 56789012345, '5678901', 5678901234, 'dr.eduardo@example.com'),
('Dra. Laura Almeida', 67890123456, '6789012', 6789012345, 'dra.laura@example.com'),
('Dr. Marcos Santos', 78901234567, '7890123', 7890123456, 'dr.marcos@example.com'),
('Dra. Beatriz Lima', 89012345678, '8901234', 8901234567, 'dra.beatriz@example.com'),
('Dr. Rodrigo Costa', 90123456789, '9012345', 9012345678, 'dr.rodrigo@example.com'),
('Dra. Sofia Fernandes', 10203040506, '1020304', 1020304050, 'dra.sofia@example.com');

-- Crie um script que adicione uma coluna “em_atividade” para os médicos, indicando se ele ainda está atuando no hospital ou não. 

ALTER TABLE medico ADD em_atividade BOOLEAN NOT NULL DEFAULT TRUE;

-- Atualizando ao menos 2 médicos como inativo
UPDATE medico SET em_atividade = FALSE WHERE cpf = 12345678901;
UPDATE medico SET em_atividade = FALSE WHERE cpf = 23456789012;

-- Definindo os demais médicos como ativos
UPDATE medico SET em_atividade = TRUE WHERE cpf NOT IN (12345678901, 23456789012);


-- Inserção das especialidades
INSERT INTO especialidades (nome_especialidade) VALUES
('Pediatria'),
('Clínica Geral'),
('Gastrenterologia'),
('Dermatologia'),
('Cardiologia'),
('Ortopedia'),
('Ginecologia');

-- Inserção dos pacientes
INSERT INTO paciente (nome_paciente, data_nascimento, endereco, telefone, email, cpf, rg) VALUES
('João Silva', '1990-01-01', 'Rua A, 123', 1234567890, 'joao.silva@example.com', 12345678901, '1234567'),
('Maria Santos', '1985-02-15', 'Rua B, 456', 2345678901, 'maria.santos@example.com', 23456789012, '2345678'),
('Pedro Oliveira', '1992-03-10', 'Rua C, 789', 3456789012, 'pedro.oliveira@example.com', 34567890123, '3456789'),
('Ana Pereira', '1988-04-25', 'Rua D, 789', 4567890123, 'ana.pereira@example.com', 45678901234, '4567890'),
('Lucas Fernandes', '1995-05-07', 'Rua E, 987', 5678901234, 'lucas.fernandes@example.com', 56789012345, '5678901'),
('Fernanda Costa', '1991-06-12', 'Rua F, 654', 6789012345, 'fernanda.costa@example.com', 67890123456, '6789012'),
('Rafaela Lima', '1987-07-20', 'Rua G, 321', 7890123456, 'rafaela.lima@example.com', 78901234567, '7890123'),
('Bruno Almeida', '1993-08-02', 'Rua H, 789', 8901234567, 'bruno.almeida@example.com', 89012345678, '8901234'),
('Carlos Santos', '1989-09-18', 'Rua I, 654', 9012345678, 'carlos.santos@example.com', 90123456789, '9012345'),
('Mariana Ferreira', '1994-10-03', 'Rua J, 987', 1020304050, 'mariana.ferreira@example.com', 10203040506, '1020304'),
('Paula Fernandes', '1986-11-16', 'Rua K, 123', 1122334455, 'paula.fernandes@example.com', 11223344556, '1122334'),
('Rodrigo Lima', '1997-12-28', 'Rua L, 321', 1213141516, 'rodrigo.lima@example.com', 12131415161, '1213141'),
('Juliana Costa', '1990-01-01', 'Rua M, 654', 1314151617, 'juliana.costa@example.com', 13141516171, '1314151'),
('Gustavo Oliveira', '1985-02-15', 'Rua N, 987', 1415161718, 'gustavo.oliveira@example.com', 14151617181, '1415161'),
('Maria Silva', '1990-01-01', 'Rua O, 888', 11999990000, 'maria.silva@gmail.com', '11122233344', '1234567');

-- Inserir consultas com data de realização entre 01/01/2015 e 01/01/2022

INSERT INTO consultas (data_realizacao, hora_realizacao, valor_consulta, num_carteira, especialidade)
			VALUES	  ('2016-02-15', '10:00:00', 100.00, 12345, 'Cardiologia'),
					  ('2017-05-10', '14:30:00', 80.50, 54321, 'Dermatologia'),
                      ('2018-09-20', '09:15:00', 120.75, 98765, 'Ginecologia'),
                      ('2019-07-03', '16:45:00', 150.00, 67890, 'Oftalmologia'),
                      ('2020-03-28', '11:30:00', 90.25, 13579, 'Ortopedia'),
                      ('2016-08-12', '15:00:00', 110.00, 24680, 'Cardiologia'),
                      ('2017-11-25', '08:45:00', 85.50, 97531, 'Dermatologia'),
                      ('2018-06-17', '13:15:00', 130.75, 86420, 'Ginecologia'),
                      ('2019-04-30', '10:30:00', 160.00, 15973, 'Oftalmologia'),
                      ('2020-11-05', '17:15:00', 95.25, 68204, 'Ortopedia'),
                      ('2016-03-20', '09:30:00', 100.00, 12345, 'Cardiologia'),
                      ('2017-06-14', '15:45:00', 80.50, 54321, 'Dermatologia'),
                      ('2018-10-25', '10:15:00', 120.75, 98765, 'Ginecologia'),
                      ('2019-08-08', '17:45:00', 150.00, 67890, 'Oftalmologia'),
                      ('2020-04-02', '12:30:00', 90.25, 13579, 'Ortopedia'),
                      ('2016-09-25', '14:00:00', 110.00, 24680, 'Cardiologia'),
                      ('2017-12-09', '07:45:00', 85.50, 97531, 'Dermatologia'),
                      ('2018-07-22', '12:15:00', 130.75, 86420, 'Ginecologia'),
                      ('2019-05-05', '09:30:00', 160.00, 15973, 'Oftalmologia'),
                      ('2020-12-10', '16:15:00', 95.25, 68204, 'Ortopedia');
                      
-- Inserção dos convênios médicos
INSERT INTO convenio (nome_convenio, cnpj, tempo_carencia)
VALUES ('Convenio A', '12345678901234', 30),
	   ('Convenio B', '23456789012345', 60),
       ('Convenio C', '34567890123456', 90),
       ('Convenio D', '45678901234567', 120);
       
-- Atualização do convênio para o quinto paciente	
UPDATE convenio
SET id_paciente = 5
WHERE id_convenio = '0' OR id_convenio = '1';

-- Associação de convênios a consultas
UPDATE consultas
SET id_convenio = 6
WHERE id_consulta = '2';

UPDATE consultas
SET id_convenio = 7
WHERE id_consulta = '3';

UPDATE consultas
SET id_convenio = 8
WHERE id_consulta = '0';

UPDATE consultas
SET id_convenio = 9
WHERE id_consulta = '';

UPDATE consultas
SET id_convenio = 10
WHERE id_consulta = 0;

-- Criando a Entidade de Relacionamento entre internação e enfermeiro. 

CREATE TABLE IF NOT EXISTS internacao_enfermeiro (
  id_internacao INT,
  id_enfermeiro INT,
  FOREIGN KEY (id_internacao) REFERENCES internacao(id_internacao),
  FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro (id_enfermeiro)
);

-- Arrumando a chave estrangeira do relacionamento entre convênio e médico.
ALTER TABLE convenio
ADD COLUMN id_medico INT,
ADD FOREIGN KEY (id_medico) REFERENCES medico(id_medico);

-- Inserindo chaves estrangeiras dentro de internação (Chaves Médico e Paciente).
CREATE TABLE IF NOT EXISTS Internacao (
  id_internacao INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  data_entrada DATE,
  data_prev_alta DATE,
  data_alta DATE, 
  procedimento TEXT,
  id_paciente INT,
  id_medico INT,
  FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
  FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);

-- Registre ao menos sete internações. Pelo menos dois pacientes devem ter se internado mais de uma vez. Ao menos três quartos devem ser cadastrados. As internações devem ter ocorrido entre 01/01/2015 e 01/01/2022.

INSERT INTO Internacao (data_entrada, data_prev_alta, data_alta, procedimento)
			VALUES     ('2016-02-15', '2016-02-22', '2016-02-25', 'Cirurgia de apendicite'),
					   ('2017-05-10', '2017-05-15', '2017-05-18', 'Tratamento de fratura no braço'),
                       ('2018-09-20', '2018-09-25', '2018-09-28', 'Cirurgia de vesícula'),
                       ('2019-03-12', '2019-03-20', '2019-03-22', 'Cirurgia de hérnia'),
                       ('2020-07-05', '2020-07-10', '2020-07-13', 'Tratamento de pneumonia'),
                       ('2021-01-18', '2021-01-25', '2021-01-28', 'Cirurgia de apêndice'),
                       ('2021-09-08', '2021-09-15', '2021-09-18', 'Tratamento de fratura na perna');
                       
-- Inserindo exemplos de quartos
INSERT INTO Quarto (numero, tipo)
VALUES (101, 'Apartamento'),
       (201, 'Quarto Duplo'),
       (301, 'Enfermaria');
 
 -- 
 
INSERT INTO Enfermeiro (nome, cpf, cre) VALUES
('Ana Santos', '12345678901', 1234),
('Pedro Oliveira', '23456789012', 2345),
('Maria Costa', '34567890123', 3456),
('Rafael Silva', '45678901234', 4567),
('Carolina Pereira', '56789012345', 5678),
('João Rodrigues', '67890123456', 6789),
('Juliana Almeida', '78901234567', 7890),
('Marcelo Souza', '89012345678', 8901),
('Laura Fernandes', '90123456789', 9012),
('Lucas Santos', '01234567890', 1023);


--
INSERT INTO Internacao_Enfermeiro (id_internacao, id_enfermeiro) 
						VALUES    (1, 1),(1, 2),
								  (2, 3),(2, 4),
                                  (3, 5),(3, 6),
                                  (4, 7),(4, 8),
								  (5, 9),(5, 10);
                                  
INSERT INTO Convenio (nome_convenio, cnpj, tempo_carencia) VALUES
('Convenio 1', '12345678901234', 30),
('Convenio 2', '98765432109876', 60),
('Convenio 3', '56789012345678', 90);

INSERT INTO especialidades (nome_especialidade) VALUES
('Cardiologia'),
('Pediatria'),
('Ortopedia'),
('Ginecologia'),
('Dermatologia'),
('Cardiologia'),
('Ortopedia'),
('Ginecologia');

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





