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
