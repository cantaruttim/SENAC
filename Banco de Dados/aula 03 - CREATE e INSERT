CREATE TABLE cliente (
  cpf varchar(50) not null primary key,
  primeiro_nome varchar(100) not null, 
  sobre_nome varchar(100) not null,
  telefone varchar(100) not null,
  data_nascimento varchar(100) not null,
  sexo char(1) not null
); 

INSERT 
	INTO cliente (
      cpf, primeiro_nome, sobre_nome, telefone, 
      data_nascimento, sexo
   ) 
    	VALUES 
        	(
              'XXXX010', 
              'Matheus', 
              'Cantarutti', 
              '(11) 95878-4002',
              '1994-07-20', -- yyyy-MM-dd
              'M'
            ), 
            (
              'XXXX011', 
              'Fernanda', 
              'Vasconcelos', 
              '(11) 95878-4002',
              '1994-07-20', -- yyyy-MM-dd
              'F'
            ); -- tupla


CREATE TABLE quarto (	
  num_quarto varchar(50)
  	not null primary key,
  andar_quarto varchar(50) not null,
  vista_do_quarto varchar(50) not null
);


INSERT
	INTO quarto (num_quarto, andar_quarto, vista_do_quarto)
    	VALUES 
        	(
            	'255', '2º andar', 'Para Rua'
            ),
            (
            	'256', '2º andar', 'Para Praia'
            );

CREATE TABLE check_in (
  num_checkin VARCHAR(60) 
  	not null primary key,
  data_checkin VARCHAR(60) not null,
  cpf varchar(50) not null, -- FK
  num_quarto varchar(50) not null, -- FK
  
  FOREIGN KEY (cpf)
  	REFERENCES cliente(cpf)
  		ON DELETE CASCADE,
  
  FOREIGN KEY (num_quarto)
  	REFERENCES quarto(num_quarto)
  		ON DELETE CASCADE
);


INSERT
	INTO check_in (num_checkin, data_checkin, cpf, num_quarto)
    	VALUES 
        	(
            	'ABC1015', '2025-02-10', 'XXXX010', '255'            
            ),
            (
            	'ABC1001', '2025-02-10', 'XXXX011', '256'
            );


SELECT * FROM cliente;
SELECT * FROM quarto;
SELECT * FROM check_in;
