/*BDD test*/

CREATE TABLE surname (
    ID BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    surname VARCHAR(255)
);

INSERT INTO surname (name, surname) VALUES ('Lilou', 'Bidule');
INSERT INTO surname (name, surname) VALUES ('Lou', 'LouCoir');
INSERT INTO surname (name, surname) VALUES ('Pauline', 'Poups');
INSERT INTO surname (name, surname) VALUES ('Benjamin', 'Banjo');

select * from surname;

/*BDD PHP*/
/*création de table*/

CREATE TABLE prof (
    ID_prof BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nom VARCHAR(255) NOT NULL,
    Prenom VARCHAR(255) NOT NULL,
    Photo VARCHAR(255),
    Description TEXT
);

CREATE TABLE internaute (
    ID_ident BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Identifiant VARCHAR(255) NOT NULL,
    ID_prof BIGINT,
    FOREIGN KEY(ID_prof) REFERENCES prof(ID_prof)
);

CREATE TABLE question (
    ID_Q BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Libelle TEXT NOT NULL
);

CREATE TABLE reponse (
    ID_rep BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Libelle TEXT NOT NULL,
    Photo VARCHAR(255),
    ID_Q BIGINT NOT NULL,
    FOREIGN KEY(ID_Q) REFERENCES question(ID_Q)
);

CREATE TABLE quizz_Prof (
    ID_prof BIGINT NOT NULL,
    ID_rep BIGINT NOT NULL,
    FOREIGN KEY(ID_prof) REFERENCES prof(ID_prof),
    FOREIGN KEY(ID_rep) REFERENCES reponse(ID_rep),
    PRIMARY KEY(ID_prof, ID_rep)
);

CREATE TABLE quizz_Internaute (
    ID_ident BIGINT NOT NULL,
    ID_rep BIGINT NOT NULL,
    FOREIGN KEY(ID_ident) REFERENCES internaute(ID_ident),
    FOREIGN KEY(ID_rep) REFERENCES reponse(ID_rep),
    PRIMARY KEY(ID_ident, ID_rep)
);

/*Remplissage par défaut des tables*/

/*questions*/
INSERT INTO question (Libelle) VALUES 
('Quel est votre chiffre préféré ?'),
('Plutôt sucré ou salé ?'),
('Quel objet choisissez-vous ?'),
('Quel logiciel Adobe êtes-vous ?'),
('Quel langage êtes-vous ?'),
('Lequel de ces pouvoirs aimeriez-vous avoir ?'),
('Votre plat préféré ?'),
('Votre destination préférée ?'),
('Quel est votre groupe préféré ?'),
("Quel M&M's êtes-vous ?"),
('Plutôt mer ou montagne ?'),
('Quel est votre signe astrologique préféré ?');

/*réponses question Quel est votre chiffre préféré ?*/
INSERT INTO reponse (Libelle, Photo, ID_Q) VALUES 
('7','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre chiffre préféré ?')),
('42','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre chiffre préféré ?')),
('118','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre chiffre préféré ?')),
('712','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre chiffre préféré ?')),
('13','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre chiffre préféré ?')),
('2','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre chiffre préféré ?'));

/*réponses question Plutôt sucré ou salé ?*/
INSERT INTO reponse (Libelle, Photo, ID_Q) VALUES 
('Sucré','sucre',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt sucré ou salé ?')),
('Salé','sel',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt sucré ou salé ?'));

/*réponses question Quel objet choisissez-vous ?*/
INSERT INTO reponse (Libelle, Photo, ID_Q) VALUES 
('La Cuillère','cuillere',(SELECT ID_Q FROM question WHERE Libelle = 'Quel objet choisissez-vous ?')),
('Le marche-pied rouge (et pliable)','marchepied',(SELECT ID_Q FROM question WHERE Libelle = 'Quel objet choisissez-vous ?')),
("L'arrosoir",'arrosoir',(SELECT ID_Q FROM question WHERE Libelle = 'Quel objet choisissez-vous ?')),
('Le pistolet à eau','pistolet',(SELECT ID_Q FROM question WHERE Libelle = 'Quel objet choisissez-vous ?')),
('Le kazoo','kazoo',(SELECT ID_Q FROM question WHERE Libelle = 'Quel objet choisissez-vous ?')),
('Le verre vide','verre',(SELECT ID_Q FROM question WHERE Libelle = 'Quel objet choisissez-vous ?'));

/*réponses question Quel logiciel Adobe êtes-vous ?*/
INSERT INTO reponse (Libelle, Photo, ID_Q) VALUES 
('After Effects','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel logiciel Adobe êtes-vous ?')),
('Illustrator','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel logiciel Adobe êtes-vous ?')),
('InDesign','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel logiciel Adobe êtes-vous ?')),
('Premiere Pro','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel logiciel Adobe êtes-vous ?')),
('Photoshop','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel logiciel Adobe êtes-vous ?')),
('Audition','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel logiciel Adobe êtes-vous ?')),
("Qu'est-ce ?",'',(SELECT ID_Q FROM question WHERE Libelle = 'Quel logiciel Adobe êtes-vous ?'));

/*réponses question Quel langage êtes-vous ?*/
INSERT INTO reponse (Libelle, Photo, ID_Q) VALUES 
('Scala','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel langage êtes-vous ?')),
('Python','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel langage êtes-vous ?')),
('JavaScript','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel langage êtes-vous ?')),
('HTML/CSS','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel langage êtes-vous ?')),
('C++','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel langage êtes-vous ?')),
('PHP','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel langage êtes-vous ?')),
('Le breton','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel langage êtes-vous ?'));

/*réponses question Lequel de ces pouvoirs aimeriez-vous avoir ?*/
INSERT INTO reponse (Libelle, Photo, ID_Q) VALUES 
('Être télépathe','',(SELECT ID_Q FROM question WHERE Libelle = 'Lequel de ces pouvoirs aimeriez-vous avoir ?')),
('Être invisible','',(SELECT ID_Q FROM question WHERE Libelle = 'Lequel de ces pouvoirs aimeriez-vous avoir ?')),
('Pouvoir se téléporter','',(SELECT ID_Q FROM question WHERE Libelle = 'Lequel de ces pouvoirs aimeriez-vous avoir ?')),
('Être trop giga méga fort en maths','',(SELECT ID_Q FROM question WHERE Libelle = 'Lequel de ces pouvoirs aimeriez-vous avoir ?'));

/*réponses question Votre plat préféré ?*/
INSERT INTO reponse (Libelle, Photo, ID_Q) VALUES 
('Burger frites','burger',(SELECT ID_Q FROM question WHERE Libelle = 'Votre plat préféré ?')),
('Couscous','couscous',(SELECT ID_Q FROM question WHERE Libelle = 'Votre plat préféré ?')),
('Salade composée','salade',(SELECT ID_Q FROM question WHERE Libelle = 'Votre plat préféré ?')),
('Bœuf bourguignon','boeuf',(SELECT ID_Q FROM question WHERE Libelle = 'Votre plat préféré ?'));

/*réponses question Votre destination préférée ?*/
INSERT INTO reponse (Libelle, Photo, ID_Q) VALUES 
('La Mongolie','mongolie',(SELECT ID_Q FROM question WHERE Libelle = 'Votre destination préférée ?')),
('Les États-Unis','usa',(SELECT ID_Q FROM question WHERE Libelle = 'Votre destination préférée ?')),
('La Creuse','creuse',(SELECT ID_Q FROM question WHERE Libelle = 'Votre destination préférée ?')),
("L'Ouzbékistan",'ouzbekistan',(SELECT ID_Q FROM question WHERE Libelle = 'Votre destination préférée ?')),
("L'australie",'australie',(SELECT ID_Q FROM question WHERE Libelle = 'Votre destination préférée ?')),
('Le Japon','japon',(SELECT ID_Q FROM question WHERE Libelle = 'Votre destination préférée ?')),
('Bora Bora','bora',(SELECT ID_Q FROM question WHERE Libelle = 'Votre destination préférée ?')),
('Berck','berck',(SELECT ID_Q FROM question WHERE Libelle = 'Votre destination préférée ?'));

/*réponses question Quel est votre groupe préféré ?*/
INSERT INTO reponse (Libelle, Photo, ID_Q) VALUES 
('Les Beatles','beatles',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre groupe préféré ?')),
('Kiss','kiss',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre groupe préféré ?')),
('Kool and the gang','kool',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre groupe préféré ?')),
('Daft Punk','daftpunk',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre groupe préféré ?')),
('Les Spice Girls','spicegirls',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre groupe préféré ?')),
('Village People','villagepeople',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre groupe préféré ?'));

/*réponses question Quel M&M's êtes-vous ?*/
INSERT INTO reponse (Libelle, Photo, ID_Q) VALUES 
('Rouge','rouge',(SELECT ID_Q FROM question WHERE Libelle = "Quel M&M's êtes-vous ?")),
('Jaune','jaune',(SELECT ID_Q FROM question WHERE Libelle = "Quel M&M's êtes-vous ?")),
('Orange','orange',(SELECT ID_Q FROM question WHERE Libelle = "Quel M&M's êtes-vous ?")),
('Verte','verte',(SELECT ID_Q FROM question WHERE Libelle = "Quel M&M's êtes-vous ?")),
('Brown','brown',(SELECT ID_Q FROM question WHERE Libelle = "Quel M&M's êtes-vous ?")),
('Bleu','bleu',(SELECT ID_Q FROM question WHERE Libelle = "Quel M&M's êtes-vous ?"));

/*réponses question Plutôt mer ou montagne ?*/
INSERT INTO reponse (Libelle, Photo, ID_Q) VALUES 
('1','',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt mer ou montagne ?')),
('2','',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt mer ou montagne ?')),
('3','',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt mer ou montagne ?')),
('4','',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt mer ou montagne ?')),
('5','',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt mer ou montagne ?')),
('6','',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt mer ou montagne ?'));

/*réponses question Quel est votre signe astrologique préféré ?*/
INSERT INTO reponse (Libelle, Photo, ID_Q) VALUES 
('Bélier','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre signe astrologique préféré ?')),
('Taureau','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre signe astrologique préféré ?')),
('Gémeaux','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre signe astrologique préféré ?')),
('Cancer','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre signe astrologique préféré ?')),
('Lion','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre signe astrologique préféré ?')),
('Vierge','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre signe astrologique préféré ?')),
('Balance','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre signe astrologique préféré ?')),
('Scorpion','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre signe astrologique préféré ?')),
('Sagittaire','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre signe astrologique préféré ?')),
('Capricorne','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre signe astrologique préféré ?')),
('Verseau','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre signe astrologique préféré ?')),
('Poisson','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre signe astrologique préféré ?'));