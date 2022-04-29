/*BDD test

CREATE TABLE surname (
    ID BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    surname VARCHAR(255)
);

INSERT INTO surname (name, surname) VALUES ('Lilou', 'Bidule');
INSERT INTO surname (name, surname) VALUES ('Lou', 'LouCoir');
INSERT INTO surname (name, surname) VALUES ('Pauline', 'Poups');
INSERT INTO surname (name, surname) VALUES ('Benjamin', 'Banjo');

select * from surname;*/

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
    mdp BINARY(16) NOT NULL,
    ID_prof BIGINT,
    mdp BINARY(16) NOT NULL,
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
('La cuillère','cuillere',(SELECT ID_Q FROM question WHERE Libelle = 'Quel objet choisissez-vous ?')),
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

/*Remplissage des profs*/
INSERT INTO prof (Nom, Prenom, Photo, Description) VALUES
('CHERRIER', 'Sylvain', 'cherrier', "bla-bla cherrier"),
('AKYUREK', 'Keven', 'akyurek', "bla-bla akyurek"),
('ROUX', 'Gabrielle', 'roux', "bla-bla roux"),
('RIEU', 'Alexandre', 'rieu', "bla-bla rieu"),
('BIRI', 'Venceslas', 'biri', "bla-bla biri"),
('CHARPENTIER', 'Gaëlle', 'charpentier', "bla-bla charpentier"),
('LAPORTE', 'Eric', 'laporte', "bla-bla laporte"),
('HERNANDEZ', 'Jerome', 'hernandes', "bla-bla hernandez"),
('VERGER', 'Émilie', 'verger', "bla-bla verger"),
('SALVI', 'Patricia', 'salvi', "bla-bla salvi"),
('DE SMET', 'Enguerrand', 'desmet', "bla-bla desmet"),
('NOVELLI', 'Jean-Christophe', 'novelli', "bla-bla novelli"),
('FOUCHY', 'Jules', 'fouchy', "bla-bla fouchy"),
('VINCENT', 'Steeve', 'vincent', "bla-bla vincent"),
('DE ROBILLARD', 'Gaëtan', 'robillard', "bla-bla robillard"),
('SULAK', 'Özlem', 'sulak', "bla-bla sulak");

/*Réponses des profs*/

/*rep CHERRIER*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'CHERRIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "42")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHERRIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sucré")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHERRIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le kazoo")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHERRIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Qu'est-ce ?")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHERRIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "PHP")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHERRIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Être télépathe")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHERRIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Burger frites")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHERRIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Les États-Unis")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHERRIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Les Beatles")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHERRIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Jaune")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHERRIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "5")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHERRIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Balance"));

/*rep AKYUREK*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "7")),
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sucré")),
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "La cuillère")),
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Premiere Pro")),
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le breton")),
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Couscous")),
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Les États-Unis")),
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Les Beatles")),
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Jaune")),
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "1")),
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sagittaire"));

/*rep ROUX*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "2" AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Quel est votre chiffre préféré ?"))),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sucré")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le pistolet à eau")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Photoshop")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "C++")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Burger frites")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "La Mongolie")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Les Beatles")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Verte")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "2" AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Plutôt mer ou montagne ?"))),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Vierge"));

/*rep RIEU*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'RIEU'),(SELECT ID_rep FROM reponse WHERE Libelle = "42")),
((SELECT ID_prof FROM prof WHERE Nom = 'RIEU'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sucré")),
((SELECT ID_prof FROM prof WHERE Nom = 'RIEU'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le pistolet à eau")),
((SELECT ID_prof FROM prof WHERE Nom = 'RIEU'),(SELECT ID_rep FROM reponse WHERE Libelle = "After Effects")),
((SELECT ID_prof FROM prof WHERE Nom = 'RIEU'),(SELECT ID_rep FROM reponse WHERE Libelle = "Python")),
((SELECT ID_prof FROM prof WHERE Nom = 'RIEU'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'RIEU'),(SELECT ID_rep FROM reponse WHERE Libelle = "Burger frites")),
((SELECT ID_prof FROM prof WHERE Nom = 'RIEU'),(SELECT ID_rep FROM reponse WHERE Libelle = "Les États-Unis")),
((SELECT ID_prof FROM prof WHERE Nom = 'RIEU'),(SELECT ID_rep FROM reponse WHERE Libelle = "Les Spice Girls")),
((SELECT ID_prof FROM prof WHERE Nom = 'RIEU'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bleu")),
((SELECT ID_prof FROM prof WHERE Nom = 'RIEU'),(SELECT ID_rep FROM reponse WHERE Libelle = "3")),
((SELECT ID_prof FROM prof WHERE Nom = 'RIEU'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sagittaire"));

/*rep BIRI*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'BIRI'),(SELECT ID_rep FROM reponse WHERE Libelle = "42")),
((SELECT ID_prof FROM prof WHERE Nom = 'BIRI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Salé")),
((SELECT ID_prof FROM prof WHERE Nom = 'BIRI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le pistolet à eau")),
((SELECT ID_prof FROM prof WHERE Nom = 'BIRI'),(SELECT ID_rep FROM reponse WHERE Libelle = "After Effects")),
((SELECT ID_prof FROM prof WHERE Nom = 'BIRI'),(SELECT ID_rep FROM reponse WHERE Libelle = "C++")),
((SELECT ID_prof FROM prof WHERE Nom = 'BIRI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'BIRI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bœuf bourguignon")),
((SELECT ID_prof FROM prof WHERE Nom = 'BIRI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bora Bora")),
((SELECT ID_prof FROM prof WHERE Nom = 'BIRI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Daft Punk")),
((SELECT ID_prof FROM prof WHERE Nom = 'BIRI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Brown")),
((SELECT ID_prof FROM prof WHERE Nom = 'BIRI'),(SELECT ID_rep FROM reponse WHERE Libelle = "4")),
((SELECT ID_prof FROM prof WHERE Nom = 'BIRI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Cancer"));

/*rep CHARPENTIER*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'CHARPENTIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "7")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHARPENTIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sucré")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHARPENTIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "L'arrosoir")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHARPENTIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Illustrator")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHARPENTIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "HTML/CSS")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHARPENTIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHARPENTIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Couscous")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHARPENTIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bora Bora")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHARPENTIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Daft Punk")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHARPENTIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Orange")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHARPENTIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "5")),
((SELECT ID_prof FROM prof WHERE Nom = 'CHARPENTIER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Gémeaux"));

/*rep LAPORTE*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'LAPORTE'),(SELECT ID_rep FROM reponse WHERE Libelle = "2" AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Quel est votre chiffre préféré ?"))),
((SELECT ID_prof FROM prof WHERE Nom = 'LAPORTE'),(SELECT ID_rep FROM reponse WHERE Libelle = "Salé")),
((SELECT ID_prof FROM prof WHERE Nom = 'LAPORTE'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le pistolet à eau")),
((SELECT ID_prof FROM prof WHERE Nom = 'LAPORTE'),(SELECT ID_rep FROM reponse WHERE Libelle = "Photoshop")),
((SELECT ID_prof FROM prof WHERE Nom = 'LAPORTE'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le breton")),
((SELECT ID_prof FROM prof WHERE Nom = 'LAPORTE'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'LAPORTE'),(SELECT ID_rep FROM reponse WHERE Libelle = "Couscous")),
((SELECT ID_prof FROM prof WHERE Nom = 'LAPORTE'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bora Bora")),
((SELECT ID_prof FROM prof WHERE Nom = 'LAPORTE'),(SELECT ID_rep FROM reponse WHERE Libelle = "Les Beatles")),
((SELECT ID_prof FROM prof WHERE Nom = 'LAPORTE'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bleu")),
((SELECT ID_prof FROM prof WHERE Nom = 'LAPORTE'),(SELECT ID_rep FROM reponse WHERE Libelle = "4")),
((SELECT ID_prof FROM prof WHERE Nom = 'LAPORTE'),(SELECT ID_rep FROM reponse WHERE Libelle = "Cancer"));

/*rep HERNANDEZ*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "42")),
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sucré")),
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le kazoo")),
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "After Effects")),
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "Python")),
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "Couscous")),
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le Japon")),
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "Kool and the gang")),
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bleu")),
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "6")),
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "Taureau"));

/*rep VERGER*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "2" AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Quel est votre chiffre préféré ?"))),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sucré")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "La cuillère")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Photoshop")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le breton")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Être invisible")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Couscous")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Les États-Unis")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Kool and the gang")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Rouge")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "1")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Cancer"));

/*rep SALVI*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'SALVI'),(SELECT ID_rep FROM reponse WHERE Libelle = "7")),
((SELECT ID_prof FROM prof WHERE Nom = 'SALVI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sucré")),
((SELECT ID_prof FROM prof WHERE Nom = 'SALVI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le pistolet à eau")),
((SELECT ID_prof FROM prof WHERE Nom = 'SALVI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Photoshop")),
((SELECT ID_prof FROM prof WHERE Nom = 'SALVI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le breton")),
((SELECT ID_prof FROM prof WHERE Nom = 'SALVI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'SALVI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Couscous")),
((SELECT ID_prof FROM prof WHERE Nom = 'SALVI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Les États-Unis")),
((SELECT ID_prof FROM prof WHERE Nom = 'SALVI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Daft Punk")),
((SELECT ID_prof FROM prof WHERE Nom = 'SALVI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bleu")),
((SELECT ID_prof FROM prof WHERE Nom = 'SALVI'),(SELECT ID_rep FROM reponse WHERE Libelle = "1")),
((SELECT ID_prof FROM prof WHERE Nom = 'SALVI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Taureau"));

/*rep DE SMET*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'DE SMET'),(SELECT ID_rep FROM reponse WHERE Libelle = "42")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE SMET'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sucré")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE SMET'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le marche-pied rouge (et pliable)")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE SMET'),(SELECT ID_rep FROM reponse WHERE Libelle = "Photoshop")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE SMET'),(SELECT ID_rep FROM reponse WHERE Libelle = "Python")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE SMET'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE SMET'),(SELECT ID_rep FROM reponse WHERE Libelle = "Salade composée")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE SMET'),(SELECT ID_rep FROM reponse WHERE Libelle = "L'australie")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE SMET'),(SELECT ID_rep FROM reponse WHERE Libelle = "Daft Punk")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE SMET'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bleu")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE SMET'),(SELECT ID_rep FROM reponse WHERE Libelle = "5")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE SMET'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bélier"));

/*rep NOVELLI*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'NOVELLI'),(SELECT ID_rep FROM reponse WHERE Libelle = "42")),
((SELECT ID_prof FROM prof WHERE Nom = 'NOVELLI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Salé")),
((SELECT ID_prof FROM prof WHERE Nom = 'NOVELLI'),(SELECT ID_rep FROM reponse WHERE Libelle = "La cuillère")),
((SELECT ID_prof FROM prof WHERE Nom = 'NOVELLI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Qu'est-ce ?")),
((SELECT ID_prof FROM prof WHERE Nom = 'NOVELLI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Python")),
((SELECT ID_prof FROM prof WHERE Nom = 'NOVELLI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'NOVELLI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Couscous")),
((SELECT ID_prof FROM prof WHERE Nom = 'NOVELLI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Berck")),
((SELECT ID_prof FROM prof WHERE Nom = 'NOVELLI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Les Spice Girls")),
((SELECT ID_prof FROM prof WHERE Nom = 'NOVELLI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Rouge")),
((SELECT ID_prof FROM prof WHERE Nom = 'NOVELLI'),(SELECT ID_rep FROM reponse WHERE Libelle = "3")),
((SELECT ID_prof FROM prof WHERE Nom = 'NOVELLI'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bélier"));

/*rep FOUCHY*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "2" AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Quel est votre chiffre préféré ?"))),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sucré")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "La cuillère")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "Qu'est-ce ?")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "C++")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "Burger frites")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "La Creuse")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "Daft Punk")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "Jaune")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "2"  AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Plutôt mer ou montagne ?"))),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "Vierge"));

/*rep VINCENT*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'VINCENT'),(SELECT ID_rep FROM reponse WHERE Libelle = "7")),
((SELECT ID_prof FROM prof WHERE Nom = 'VINCENT'),(SELECT ID_rep FROM reponse WHERE Libelle = "Salé")),
((SELECT ID_prof FROM prof WHERE Nom = 'VINCENT'),(SELECT ID_rep FROM reponse WHERE Libelle = "La cuillère")),
((SELECT ID_prof FROM prof WHERE Nom = 'VINCENT'),(SELECT ID_rep FROM reponse WHERE Libelle = "After Effects")),
((SELECT ID_prof FROM prof WHERE Nom = 'VINCENT'),(SELECT ID_rep FROM reponse WHERE Libelle = "Python")),
((SELECT ID_prof FROM prof WHERE Nom = 'VINCENT'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'VINCENT'),(SELECT ID_rep FROM reponse WHERE Libelle = "Salade composée")),
((SELECT ID_prof FROM prof WHERE Nom = 'VINCENT'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bora Bora")),
((SELECT ID_prof FROM prof WHERE Nom = 'VINCENT'),(SELECT ID_rep FROM reponse WHERE Libelle = "Daft Punk")),
((SELECT ID_prof FROM prof WHERE Nom = 'VINCENT'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bleu")),
((SELECT ID_prof FROM prof WHERE Nom = 'VINCENT'),(SELECT ID_rep FROM reponse WHERE Libelle = "4")),
((SELECT ID_prof FROM prof WHERE Nom = 'VINCENT'),(SELECT ID_rep FROM reponse WHERE Libelle = "Vierge"));

/*rep DE ROBILLARD*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'DE ROBILLARD'),(SELECT ID_rep FROM reponse WHERE Libelle = "712")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE ROBILLARD'),(SELECT ID_rep FROM reponse WHERE Libelle = "Salé")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE ROBILLARD'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le verre vide")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE ROBILLARD'),(SELECT ID_rep FROM reponse WHERE Libelle = "InDesign")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE ROBILLARD'),(SELECT ID_rep FROM reponse WHERE Libelle = "JavaScript")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE ROBILLARD'),(SELECT ID_rep FROM reponse WHERE Libelle = "Être trop giga méga fort en maths")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE ROBILLARD'),(SELECT ID_rep FROM reponse WHERE Libelle = "Bœuf bourguignon")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE ROBILLARD'),(SELECT ID_rep FROM reponse WHERE Libelle = "L'Ouzbékistan")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE ROBILLARD'),(SELECT ID_rep FROM reponse WHERE Libelle = "Kiss")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE ROBILLARD'),(SELECT ID_rep FROM reponse WHERE Libelle = "Orange")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE ROBILLARD'),(SELECT ID_rep FROM reponse WHERE Libelle = "6")),
((SELECT ID_prof FROM prof WHERE Nom = 'DE ROBILLARD'),(SELECT ID_rep FROM reponse WHERE Libelle = "Capricorne"));

/*rep SULAK*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "13")),
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Salé")),
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "L'arrosoir")),
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Audition")),
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "HTML/CSS")),
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Être télépathe")),
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Salade composée")),
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "L'Ouzbékistan")),
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Village People")),
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Verte")),
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "2"  AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Plutôt mer ou montagne ?"))),
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Lion"));
