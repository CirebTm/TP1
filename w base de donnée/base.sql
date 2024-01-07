CREATE TABLE Peuple(
   ID_Peuple INT,
   Nom VARCHAR(50),
   Faction VARCHAR(50),
   Nombre VARCHAR(50),
   Nb_representant VARCHAR(50),
   PRIMARY KEY(ID_Peuple)
   constraint PK_Peuple primary KEY(ID_Peuple)
);
insert into Peuple(ID_Peuple, Nom, Faction, Nombre, Nb_repr)
values(1, 'Mordor', 'la terre du mal ,dominée par Sauron', 2 )


CREATE TABLE Armes(
   ID_ARME VARCHAR(50),
   Nom_Arme VARCHAR(50),
   Type__arme VARCHAR(50),
   PRIMARY KEY(ID_ARME)
   constraint PK_armes primary KEY(ID_ARME)
);

CREATE TABLE Pays(
   ID_Pays INT,
   Nom VARCHAR(50),
   Description VARCHAR(50),
   ID_Peuple INT NOT NULL,
   PRIMARY KEY(ID_Pays),
   FOREIGN KEY(ID_Peuple) REFERENCES Peuple(ID_Peuple)
   constraint PK_pays primary KEY(ID_Peuple)
   contraint FK_peuple foreign key(ID_Peuple) references Peuple(ID_Peuple)
);
insert into Pays(ID_Pays, Nom, Description, ID_Peuple)
values(1, 'Mordor', 'la terre du mal ,dominée par Sauron', 2 )

CREATE TABLE Race(
   ID_race VARCHAR(50),
   Nom VARCHAR(50),
   ID_ARME VARCHAR(50) NOT NULL,
   ID_Peuple INT NOT NULL,
   PRIMARY KEY(ID_race),
   FOREIGN KEY(ID_ARME) REFERENCES Armes(ID_ARME),
   FOREIGN KEY(ID_Peuple) REFERENCES Peuple(ID_Peuple)
   constraint PK_race primary KEY(ID_race)
   constraint FK_peuple foreign key(ID_Peuple) references Peuple(ID_Peuple)
);

CREATE TABLE Animal(
   ID_Animal VARCHAR(50),
   Nom VARCHAR(50),
   ID_Pays INT,
   PRIMARY KEY(ID_Animal),
   FOREIGN KEY(ID_Pays) REFERENCES Pays(ID_Pays)
);

CREATE TABLE Ville(
   ID_Pays INT,
   ID_Ville VARCHAR(50),
   Nom VARCHAR(50),
   PRIMARY KEY(ID_Pays, ID_Ville),
   FOREIGN KEY(ID_Pays) REFERENCES Pays(ID_Pays)
);

CREATE TABLE Bataille(
   ID_Bataille LOGICAL,
   date_bataille DATE,
   Durée TIME,
   Nom VARCHAR(50),
   Type VARCHAR(50),
   ID_Pays INT NOT NULL,
   ID_Ville VARCHAR(50) NOT NULL,
   PRIMARY KEY(ID_Bataille),
   FOREIGN KEY(ID_Pays, ID_Ville) REFERENCES Ville(ID_Pays, ID_Ville)
);

CREATE TABLE Personnage(
   ID_Pers VARCHAR(50),
   Nom VARCHAR(50),
   Titre VARCHAR(50),
   IsDead LOGICAL,
   Date_mort DATE,
   ID_ARME VARCHAR(50),
   ID_Pays INT,
   ID_Pays_1 INT NOT NULL,
   PRIMARY KEY(ID_Pers),
   FOREIGN KEY(ID_ARME) REFERENCES Armes(ID_ARME),
   FOREIGN KEY(ID_Pays) REFERENCES Pays(ID_Pays),
   FOREIGN KEY(ID_Pays_1) REFERENCES Pays(ID_Pays)
);

CREATE TABLE Entente(
   ID_Peuple INT,
   ID_Peuple_1 INT,
   PRIMARY KEY(ID_Peuple, ID_Peuple_1),
   FOREIGN KEY(ID_Peuple) REFERENCES Peuple(ID_Peuple),
   FOREIGN KEY(ID_Peuple_1) REFERENCES Peuple(ID_Peuple)
);

CREATE TABLE Participer_peuple(
   ID_Peuple INT,
   ID_Bataille LOGICAL,
   IsAttaque LOGICAL,
   Quantité VARCHAR(50),
   Pertes VARCHAR(50),
   PRIMARY KEY(ID_Peuple, ID_Bataille),
   FOREIGN KEY(ID_Peuple) REFERENCES Peuple(ID_Peuple),
   FOREIGN KEY(ID_Bataille) REFERENCES Bataille(ID_Bataille)
);

CREATE TABLE Aimer(
   ID_Pers VARCHAR(50),
   ID_Pers_1 VARCHAR(50),
   PRIMARY KEY(ID_Pers, ID_Pers_1),
   FOREIGN KEY(ID_Pers) REFERENCES Personnage(ID_Pers),
   FOREIGN KEY(ID_Pers_1) REFERENCES Personnage(ID_Pers)
);

CREATE TABLE Inapte(
   ID_race VARCHAR(50),
   ID_ARME VARCHAR(50),
   PRIMARY KEY(ID_race, ID_ARME),
   FOREIGN KEY(ID_race) REFERENCES Race(ID_race),
   FOREIGN KEY(ID_ARME) REFERENCES Armes(ID_ARME)
);

CREATE TABLE Participer_animal(
   ID_Animal VARCHAR(50),
   ID_Bataille LOGICAL,
   IsAttaque VARCHAR(50),
   Quantité VARCHAR(50),
   Pertes VARCHAR(50),
   PRIMARY KEY(ID_Animal, ID_Bataille),
   FOREIGN KEY(ID_Animal) REFERENCES Animal(ID_Animal),
   FOREIGN KEY(ID_Bataille) REFERENCES Bataille(ID_Bataille)
);

CREATE TABLE Mener(
   ID_Bataille NUMBER(1),
   ID_Pers VARCHAR(50),
   IsAttaque NUMBER(1),
   PRIMARY KEY(ID_Bataille, ID_Pers),
   FOREIGN KEY(ID_Bataille) REFERENCES Bataille(ID_Bataille),
   FOREIGN KEY(ID_Pers) REFERENCES Personnage(ID_Pers)
);

CREATE TABLE père(
   ID_Pers VARCHAR(50),
   ID_Pers_1 VARCHAR(50),
   Ispère NUMBER(1),
   PRIMARY KEY(ID_Pers, ID_Pers_1),
   FOREIGN KEY(ID_Pers) REFERENCES Personnage(ID_Pers),
   FOREIGN KEY(ID_Pers_1) REFERENCES Personnage(ID_Pers)
);
