DROP TABLE Longevidade cascade constraint;

DROP TABLE Especie cascade constraint;

DROP TABLE Ecossistema_Vegetacao cascade constraint;

DROP TABLE Animais_Geo cascade constraint;

DROP TABLE Animais cascade constraint;

DROP TABLE Vegetacao cascade constraint;

DROP TABLE Geografia_mar cascade constraint;

DROP TABLE Classificacao cascade constraint;

DROP TABLE Reino cascade constraint;

DROP TABLE Tipo_Animal cascade constraint;

DROP TABLE Ordem cascade constraint;

DROP TABLE Ecossistema cascade constraint;

DROP TABLE Clima cascade constraint;

CREATE TABLE Clima (
  idClima INTEGER NOT NULL,
  tipo_clima VARCHAR(30),
  temperatura FLOAT,
  PRIMARY KEY(idClima)
);

CREATE TABLE Ecossistema (
  idEcossistema INTEGER NOT NULL,
  nome_eco VARCHAR(30),
  profundidade FLOAT,
  PRIMARY KEY(idEcossistema)
);

CREATE TABLE Ordem (
  idOrdem INTEGER NOT NULL,
  nome_ordem VARCHAR(30),
  PRIMARY KEY(idOrdem)
);

CREATE TABLE Tipo_Animal (
  idTipo_Animal INTEGER NOT NULL,
  nome_tipo VARCHAR(30),
  PRIMARY KEY(idTipo_Animal)
);

CREATE TABLE Reino (
  idReino INTEGER NOT NULL,
  nome_reino VARCHAR(30),
  PRIMARY KEY(idReino)
);

CREATE TABLE Classificacao (
  idClassificacao INTEGER NOT NULL,
  filo VARCHAR(30),
  classe VARCHAR(30),
  PRIMARY KEY(idClassificacao)
);

CREATE TABLE Geografia_mar (
  idGeografia_mar INTEGER NOT NULL,
  Clima_idClima INTEGER,
  Ecossistema_idEcossistema INTEGER,
  local_pred VARCHAR(30),
  PRIMARY KEY(idGeografia_mar),
  FOREIGN KEY(Ecossistema_idEcossistema)
    REFERENCES Ecossistema(idEcossistema),
  FOREIGN KEY(Clima_idClima)
    REFERENCES Clima(idClima)
);

CREATE TABLE Vegetacao (
  idVegetacao INTEGER NOT NULL,
  Reino_idReino INTEGER,
  Ordem_idOrdem INTEGER,
  Classificacao_idClassificacao INTEGER,
  nome_planta VARCHAR(30),
  PRIMARY KEY(idVegetacao),
  FOREIGN KEY(Classificacao_idClassificacao)
    REFERENCES Classificacao(idClassificacao),
  FOREIGN KEY(Ordem_idOrdem)
    REFERENCES Ordem(idOrdem),
  FOREIGN KEY(Reino_idReino)
    REFERENCES Reino(idReino));

CREATE TABLE Animais (
  idAnimais INTEGER NOT NULL,
  Classificacao_idClassificacao INTEGER,
  Reino_idReino INTEGER,
  Tipo_Animal_idTipo_Animal INTEGER,
  nome_animal VARCHAR(30),
  PRIMARY KEY(idAnimais),
  FOREIGN KEY(Tipo_Animal_idTipo_Animal)
    REFERENCES Tipo_Animal(idTipo_Animal),
  FOREIGN KEY(Reino_idReino)
    REFERENCES Reino(idReino),
  FOREIGN KEY(Classificacao_idClassificacao)
    REFERENCES Classificacao(idClassificacao));

CREATE TABLE Animais_Geo (
  Animais_idAnimais INTEGER,
  Geografia_mar_idGeografia_mar INTEGER,
  quantidade_geral INTEGER,
  PRIMARY KEY(Animais_idAnimais, Geografia_mar_idGeografia_mar),
  FOREIGN KEY(Animais_idAnimais)
    REFERENCES Animais(idAnimais),
  FOREIGN KEY(Geografia_mar_idGeografia_mar)
    REFERENCES Geografia_mar(idGeografia_mar));

CREATE TABLE Ecossistema_Vegetacao (
  Vegetacao_idVegetacao INTEGER,
  Ecossistema_idEcossistema INTEGER,
  quantidade_veg INTEGER,
  PRIMARY KEY(Vegetacao_idVegetacao, Ecossistema_idEcossistema),
  FOREIGN KEY(Ecossistema_idEcossistema)
    REFERENCES Ecossistema(idEcossistema),
  FOREIGN KEY(Vegetacao_idVegetacao)
    REFERENCES Vegetacao(idVegetacao)
);

CREATE TABLE Especie (
  idEspecie INTEGER  NOT NULL,
  Animais_idAnimais INTEGER,
  Ordem_idOrdem INTEGER,
  nome_esp VARCHAR(30),
  tamanho FLOAT,
  peso FLOAT NULL,
  reproducao VARCHAR(30),
  PRIMARY KEY(idEspecie),
  FOREIGN KEY(Ordem_idOrdem)
    REFERENCES Ordem(idOrdem),
  FOREIGN KEY(Animais_idAnimais)
    REFERENCES Animais(idAnimais));

CREATE TABLE Longevidade (
  idLongevidade INTEGER NOT NULL,
  Especie_idEspecie INTEGER,
  tempo float,
  PRIMARY KEY(idLongevidade),
  FOREIGN KEY(Especie_idEspecie)
    REFERENCES Especie(idEspecie));
    
    


