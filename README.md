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

