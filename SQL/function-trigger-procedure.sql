--PROCEDURE
--Procedure que atualize o tamanho de uma determinada especie em uma ordem espec�fica
--Argumentos passados: nome da ordem, o id da especie e o novo valor do tamanho da especie

CREATE OR REPLACE PROCEDURE ATUALIZA_ESPECIE
(NOME_AT VARCHAR, IDESPECIE_AT INTEGER, NOVO_VAL_AT FLOAT)
IS
IDORDEM_AT INTEGER;

BEGIN

SELECT IDORDEM INTO IDORDEM_AT
FROM Ordem
WHERE NOME_ORDEM=NOME_AT;

UPDATE ESPECIE
SET TAMANHO=NOVO_VAL_AT
WHERE IDESPECIE=IDESPECIE_AT;
END ATUALIZA_ESPECIE;

execute atualiza_especie('Lamniformes',102,8);

-- procedure que insira uma animal
--em um geografia_mar j� existente, considerando que
--ser�o passados os seguintes argumentos:
--nome da animal e local_pred (j� existentes no banco de dados) e quantidade geral
CREATE OR REPLACE PROCEDURE Insere_Animais_Geo
(nome_ani IN VARCHAR,
nome_geo IN VARCHAR,
quant IN INTEGER)
IS
vcoda INTEGER;
vcodg INTEGER;
BEGIN
 SELECT IDANIMAIS INTO vcoda
FROM Animais
 WHERE (NOME_ANIMAL = nome_ani);
 SELECT IDGEOGRAFIA_MAR INTO vcodg
FROM GEOGRAFIA_MAR
 WHERE (local_pred = nome_geo );
INSERT
INTO ANIMAIS_GEO (ANIMAIS_IDANIMAIS,GEOGRAFIA_MAR_IDGEOGRAFIA_MAR,quantidade_geral) 
VALUES (vcoda,vcodg,quant);
END Insere_Animais_Geo;

EXECUTE Insere_Animais_Geo ('tubar�o', 'America do Sul', 48);






--FUNCTION

--fun��o que retorna o nome do animal que comp�e uma determinada especie,passando como argumento desta fun��o o c�digo da especie.
create or replace function pegaNomeAnimal
(id_especie INTEGER)
return varchar
is
nomeAnimal varchar(50);
begin
select a.nome_animal into nomeAnimal
from ANIMAIS a
inner join especie e
on a.IDANIMAIS = e.ANIMAIS_IDANIMAIS
where e.IDESPECIE = id_especie;
return nomeAnimal;
end pegaNomeAnimal;

select pegaNomeAnimal(103)
from dual;

--fun��o que retorna a quantidade de reinos que comp�e a vegeta��o, passando como argumento o nome do reino
create or replace function quantidadeReino
(nomeReino VARCHAR)
return integer
is
numReinos integer;
begin
select count(r.idReino) into numReinos
from Reino r
inner join vegetacao v
on r.IDREINO=v.REINO_IDREINO
where r.NOME_REINO=nomeReino;
return numReinos;
end quantidadeReino;

select quantidadeReino('Plantae')
from dual;

--Trigger

--trigger se for feito uma inser��o na tabela ordem, dever� ser inserido na tabela ordem_cria o codigo da nova ordem e a data que foi feita a inser��o
-- se for feito uma atualiza��o na tabela ordem, dever� ser inserido na tabela ordem_upa o codigo antigo feito o update, o nome da antiga ordem, o nome da nova ordem e a data da atualiza��o.
drop table ordem_cria cascade constraint;
drop table ordem_upa cascade constraint;
CREATE TABLE Ordem_cria (
  idOrdem INTEGER NOT NULL,
  Dt_criacao DATE,
  PRIMARY KEY(idOrdem)
);
CREATE TABLE Ordem_upa (
  idOrdem INTEGER NOT NULL,
  nome_ordem_antiga VARCHAR(30),
  nome_ordem_nova VARCHAR(30),
  Dt_criacao DATE,
  PRIMARY KEY(idOrdem)
);

create or replace trigger infoOrdem
after
insert or update of nome_ordem
on ordem
for each row
begin
if inserting then
insert into Ordem_cria (idOrdem,DT_CRIACAO)
values (:new.idOrdem,sysdate);
elsif updating then
insert into Ordem_upa (idOrdem, nome_ordem_antiga,NOME_ORDEM_NOVA,DT_CRIACAO)
values (:old.idOrdem, :old.NOME_ORDEM,:new.nome_ordem,sysdate);
end if;
end;

select * from ordem;
select * from ordem_upa;
select * from ordem_cria;
insert into ordem (IDORDEM,NOME_ORDEM) values (90,'Lamineisopis');
insert into ordem (IDORDEM,NOME_ORDEM) values (100,'Alopsida');
UPDATE Ordem
SET nome_ordem='Alopsida'
WHERE IDORDEM=70;

--trigger que ser disparada na remo��o da tabela reino, ir� inserir na tabela reino_removido o codigo, o nome e um varchar confirmando a remo��o com 'removido' 
drop table reino_removido cascade constraint;
CREATE TABLE Reino_removido (
  idReino INTEGER NOT NULL,
  nome_reino VARCHAR(30),
  confirma VARCHAR(30),
  PRIMARY KEY(idReino)
);

create or replace trigger removReino
after
delete on Reino
for each row
begin
if deleting then
insert into reino_removido (idReino,nome_reino,confirma)
values (:old.idReino, :old.nome_reino,'removido');
end if;
end;

select * from reino;
delete from reino where IDREINO=04;
select * from REINO_REMOVIDO;






