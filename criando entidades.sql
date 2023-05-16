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


-- Código com erro 
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