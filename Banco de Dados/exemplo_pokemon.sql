CREATE TABLE pokemon (
  cod_pokemon INT NOT NULL PRIMARY KEY,
  nome_pokemon VARCHAR(50) NOT NULL,
  class_pokemon VARCHAR(50) NOT NULL
);

INSERT INTO 
	pokemon 
    (cod_pokemon, nome_pokemon, class_pokemon) 
    VALUES 
    	(1, 'PICACHU', 'ELÉTRICO'),
        (2, 'CHARMANDER', 'FOGO');

/*
	sintaxe abstração SELECT
	select
		<colunas>
	from <nome_tabela>
*/

select 
	* 
from pokemon 
where cod_pokemon = 2;
