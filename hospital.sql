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
  cpf int (14),
  rg varchar(20),
  id_convenio int
);

ALTER TABLE paciente
MODIFY COLUMN cpf VARCHAR(14);

ALTER TABLE paciente
		ADD CONSTRAINT fk_convenio_paciente FOREIGN KEY (id_convenio) REFERENCES convenio (id_convenio);

CREATE TABLE IF NOT EXISTS medico (
  id_medico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome_med varchar(255),
  cpf int (14),
  rg varchar(20),
  telefone bigint(14),
  email varchar (100),
  id_especialidade int 
);

ALTER TABLE medico
MODIFY COLUMN cpf VARCHAR(14);

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