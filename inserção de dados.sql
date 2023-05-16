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
WHERE id_convenio = '' OR id_convenio = '';

-- Associação de convênios a consultas
UPDATE consultas
SET id_convenio = 6
WHERE id_consulta = '';

UPDATE consultas
SET id_convenio = 7
WHERE id_consulta = '';

UPDATE consultas
SET id_convenio = 8
WHERE id_consulta = '';

UPDATE consultas
SET id_convenio = 9
WHERE id_consulta = '';

UPDATE consultas
SET id_convenio = 10
WHERE id_consulta = 2;
			