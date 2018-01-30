insert into clima(idClima,tipo_clima,temperatura) values (1,'tropical',18);
insert into clima(idClima,tipo_clima,temperatura) values (2,'oceanico',10);
insert into clima(idClima,tipo_clima,temperatura) values (3,'polar',0);

insert into ECOSSISTEMA(IDECOSSISTEMA,NOME_ECO,PROFUNDIDADE) values(101,'Zona abissal',2000);
insert into ECOSSISTEMA(IDECOSSISTEMA,NOME_ECO,PROFUNDIDADE) values(102,'Zona costeira',15);
insert into ECOSSISTEMA(IDECOSSISTEMA,NOME_ECO,PROFUNDIDADE) values(103,'Plataforma continental',200);

insert into ordem (IDORDEM,NOME_ORDEM) values (10,'Lamniformes');
insert into ordem (IDORDEM,NOME_ORDEM) values (20,'Carcharhiniformes');
insert into ordem (IDORDEM,NOME_ORDEM) values (30,'Cetacea');
insert into ordem (IDORDEM,NOME_ORDEM) values (40,'Vampyromorphida');
insert into ordem (IDORDEM,NOME_ORDEM) values (50,'Sphenisciformes');
insert into ordem (IDORDEM,NOME_ORDEM) values (60,'Semaeostomeae');
insert into ordem (IDORDEM,NOME_ORDEM) values (70,'Alismatales');
insert into ordem (IDORDEM,NOME_ORDEM) values (80,'Chromalveolata');

	

insert into tipo_animal(IDTIPO_ANIMAL,NOME_TIPO) values (1, 'peixe mamifero');
insert into tipo_animal(IDTIPO_ANIMAL,NOME_TIPO) values (2, 'passaro');
insert into tipo_animal(IDTIPO_ANIMAL,NOME_TIPO) values (3, 'zooplâncton');

insert into REINO(IDREINO,NOME_REINO) VALUES (01, 'Animalia');
insert into REINO(IDREINO,NOME_REINO) VALUES (02, 'Plantae');
insert into REINO(IDREINO,NOME_REINO) VALUES (03, 'Protista');
insert into REINO(IDREINO,NOME_REINO) VALUES (04, 'Relabia');
 

insert into CLASSIFICACAO(IDCLASSIFICACAO,CLASSE,FILO) values (1,'Chondrichthyes','Chordata');
insert into CLASSIFICACAO(IDCLASSIFICACAO,CLASSE,FILO) values (2,'Mammalia','Chordata');
insert into CLASSIFICACAO(IDCLASSIFICACAO,CLASSE,FILO) values (3,'Cephalopoda','Mollusca');
insert into CLASSIFICACAO(IDCLASSIFICACAO,CLASSE,FILO) values (4,'Aves','Chordata');
insert into CLASSIFICACAO(IDCLASSIFICACAO,CLASSE,FILO) values (5,'Scyphozoa','Cnidaria');
insert into CLASSIFICACAO(IDCLASSIFICACAO,CLASSE) values (6,'Liliopsida');
insert into CLASSIFICACAO(IDCLASSIFICACAO,CLASSE) values (7,'Phaeophyceae');


insert into GEOGRAFIA_MAR(IDGEOGRAFIA_MAR,CLIMA_IDCLIMA,Ecossistema_idEcossistema,local_pred) VALUES (1,1,101,'Europa');
insert into GEOGRAFIA_MAR(IDGEOGRAFIA_MAR,CLIMA_IDCLIMA,Ecossistema_idEcossistema,local_pred) VALUES (2,2,101,'Asia');
insert into GEOGRAFIA_MAR(IDGEOGRAFIA_MAR,CLIMA_IDCLIMA,Ecossistema_idEcossistema,local_pred) VALUES (3,2,103,'Antartida');
insert into GEOGRAFIA_MAR(IDGEOGRAFIA_MAR,CLIMA_IDCLIMA,Ecossistema_idEcossistema,local_pred) VALUES (4,1,102,'America do Sul');

insert into VEGETACAO(IDVEGETACAO,CLASSIFICACAO_IDCLASSIFICACAO,Ordem_idOrdem,Reino_idReino,nome_planta) VALUES (1001,6,70,02,'Zosteraceae');
insert into VEGETACAO(IDVEGETACAO,CLASSIFICACAO_IDCLASSIFICACAO,Ordem_idOrdem,Reino_idReino,nome_planta) VALUES (1002,7,80,03,'algas castanhas');

insert into ANIMAIS(IDANIMAIS,CLASSIFICACAO_IDCLASSIFICACAO,Reino_idReino,Tipo_Animal_idTipo_Animal,NOME_ANIMAL) VALUES (1,1,01,1,'tubarão');
insert into ANIMAIS(IDANIMAIS,CLASSIFICACAO_IDCLASSIFICACAO,Reino_idReino,Tipo_Animal_idTipo_Animal,NOME_ANIMAL) VALUES (2,2,01,1,'baleia');
insert into ANIMAIS(IDANIMAIS,CLASSIFICACAO_IDCLASSIFICACAO,Reino_idReino,Tipo_Animal_idTipo_Animal,NOME_ANIMAL) VALUES (3,4,01,2,'pinguim');
insert into ANIMAIS(IDANIMAIS,CLASSIFICACAO_IDCLASSIFICACAO,Reino_idReino,Tipo_Animal_idTipo_Animal,NOME_ANIMAL) VALUES (4,3,01,1,'lula');

insert into ANIMAIS_GEO(ANIMAIS_IDANIMAIS,GEOGRAFIA_MAR_IDGEOGRAFIA_MAR,quantidade_geral) VALUES (1,1,50);
insert into ANIMAIS_GEO(ANIMAIS_IDANIMAIS,GEOGRAFIA_MAR_IDGEOGRAFIA_MAR,quantidade_geral) VALUES (1,2,30);
insert into ANIMAIS_GEO(ANIMAIS_IDANIMAIS,GEOGRAFIA_MAR_IDGEOGRAFIA_MAR,quantidade_geral) VALUES (2,4,90);
insert into ANIMAIS_GEO(ANIMAIS_IDANIMAIS,GEOGRAFIA_MAR_IDGEOGRAFIA_MAR,quantidade_geral) VALUES (3,3,150);

insert into ECOSSISTEMA_VEGETACAO(ECOSSISTEMA_IDECOSSISTEMA,VEGETACAO_IDVEGETACAO,quantidade_veg) VALUES (101,1001,15);
insert into ECOSSISTEMA_VEGETACAO(ECOSSISTEMA_IDECOSSISTEMA,VEGETACAO_IDVEGETACAO,quantidade_veg) VALUES (101,1002,25);
insert into ECOSSISTEMA_VEGETACAO(ECOSSISTEMA_IDECOSSISTEMA,VEGETACAO_IDVEGETACAO,quantidade_veg) VALUES (103,1002,45);


insert into ESPECIE(IDESPECIE,ANIMAIS_IDANIMAIS,Ordem_idOrdem,nome_esp,tamanho,peso,reproducao)values (101,1,10,'tubarao-boca-grande',5.5,1.215,'sexuada');
insert into ESPECIE(IDESPECIE,ANIMAIS_IDANIMAIS,Ordem_idOrdem,nome_esp,tamanho,peso,reproducao)values (102,1,20,'tubarao-branco',7.51,2.500,'sexuada');
insert into ESPECIE(IDESPECIE,ANIMAIS_IDANIMAIS,Ordem_idOrdem,nome_esp,tamanho,peso,reproducao)values (103,1,30,'tubarao-martelo',6,580,'sexuada');
insert into ESPECIE(IDESPECIE,ANIMAIS_IDANIMAIS,Ordem_idOrdem,nome_esp,tamanho,peso,reproducao)values (104,2,30,'baleia-azul',30,180000,'sexuada');
insert into ESPECIE(IDESPECIE,ANIMAIS_IDANIMAIS,Ordem_idOrdem,nome_esp,tamanho,peso,reproducao)values (105,4,40,'lula-vampira-do-inferno',0.3,1.2,'assexuada');
insert into ESPECIE(IDESPECIE,ANIMAIS_IDANIMAIS,Ordem_idOrdem,nome_esp,tamanho,peso,reproducao)values (106,3,50,'pinguim-de-barbicha',0.7,6,'assexuada');

insert into LONGEVIDADE(IDLONGEVIDADE,ESPECIE_IDESPECIE,tempo) VALUES(1,101,20);
insert into LONGEVIDADE(IDLONGEVIDADE,ESPECIE_IDESPECIE,tempo) VALUES(2,105,15);
insert into LONGEVIDADE(IDLONGEVIDADE,ESPECIE_IDESPECIE,tempo) VALUES(3,106,10);
insert into LONGEVIDADE(IDLONGEVIDADE,ESPECIE_IDESPECIE,tempo) VALUES(4,102,30);

select*from clima;
select*from ecossistema;
select*from ordem;
select*from TIPO_ANIMAL;
select*from reino;
select*from CLASSIFICACAO;
select*from geografia_mar;
select*from VEGETACAO;
select*from ANIMAIS;
select*from ANIMAIS_GEO;
select*from ECOSSISTEMA_VEGETACAO;
select*from ESPECIE;
select*from LONGEVIDADE;















