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
    mdp BINARY(64) NOT NULL
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
('Quel est votre nombre préféré ?'),
('Plutôt sucré ou salé ?'),
('Quel objet choisissez-vous ?'),
('Quel logiciel Adobe êtes-vous ?'),
('Quel langage êtes-vous ?'),
('Lequel de ces pouvoirs aimeriez-vous avoir ?'),
('Votre plat préféré ?'),
('Votre destination préférée ?'),
('Quel est votre groupe préféré ?'),
("Quel M&M's êtes-vous ?"),
('Plutôt mer (1) ou montagne (6) ?'),
('Quel est votre signe astrologique préféré ?');

/*réponses question Quel est votre nombre préféré ?*/
INSERT INTO reponse (Libelle, Photo, ID_Q) VALUES 
('7','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre nombre préféré ?')),
('42','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre nombre préféré ?')),
('118','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre nombre préféré ?')),
('712','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre nombre préféré ?')),
('13','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre nombre préféré ?')),
('2','',(SELECT ID_Q FROM question WHERE Libelle = 'Quel est votre nombre préféré ?'));

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
('1 (mer)','',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt mer ou montagne ?')),
('2','',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt mer ou montagne ?')),
('3','',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt mer ou montagne ?')),
('4','',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt mer ou montagne ?')),
('5','',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt mer ou montagne ?')),
('6 (montagne)','',(SELECT ID_Q FROM question WHERE Libelle = 'Plutôt mer ou montagne ?'));

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
('CHERRIER', 'Sylvain', 'cherrier', "Leader du groupe IMAC (ou de son groupe de rock), Sylvain Cherrier est soucieux du bien-être de ses étudiants. Parfois maladroit, il sait se remettre en question et donne tout ce qu'il peut pour aider ses élèves. Soyez soyeux comme Sylvain Cherrier. (et on ne dit pas ça parce qu'il va nous noter ;) )"),
('AKYUREK', 'Keven', 'akyurek', "Keven Akyurek ne loupe pas une occasion pour amuser la galerie. Grand maître de l'audiovisuel, Les objectifs et les micros n'ont plus de secret pour lui !"),
('ROUX', 'Gabrielle', 'roux', "Grande adepte du google form, Gabrielle Roux vous demandera toujours de remplir un questionnaire créatif afin de savoir si vous avez compris la leçon. Faites attention, elle vous embarquera sûrement dans un ARG sans que vous ne vous en rendiez compte !"),
('RIEU', 'Alexandre', 'rieu', "Si vous vous demandez combien font 2+2, Alexandre Rieu vous répondra que c'est égal à 3 bien sûr ! Si vous jouez au foot avec lui, attention à ses passes en diagonale ! Vous ne pourrez pas dire qu'on ne vous a pas prévenu."),
('BIRI', 'Venceslas', 'biri', "Venceslas Biri, grand maître des lumières, son sourire rayonne peut-être même plus qu'un algorithme de lancer de rayon."),
('CHARPENTIER', 'Gaëlle', 'charpentier', "Gaëlle Charpentier est surement en train d'examiner le css du site en ce moment même. Accompagnée de ses fidèles félins, nous l'entendons déjà dire 'Mais il fallait mettre du display flex ici ! Olala mais où sont les alt des images...'"),
('LAPORTE', 'Eric', 'laporte', "Eric Laporte est très généreux, il paraît même qu'à Noël, il enchaîne les listes de cadeaux pour faire plaisir à ses proches."),
('HERNANDEZ', 'Jerome', 'hernandes', "Comme dirait Alaric (personnage très reconnu au sein de l'IMAC) : 'Plutot cool le boug'. Apprenez à nager car Jérome Hernandez vous fera surfer sur le web !"),
('VERGER', 'Émilie', 'verger', "Vous révez d'une version téléréalité d'artistes ? Emilie Verger est là pour vous ! Elle vous racontera tous les potins d'antant. Quoi ? Vlaminck a été mis sur le côté au début du fauvisme ? Mais c'est pas possible ça !"),
('SALVI', 'Patricia', 'salvi', "If you do not understand this paragraph, you probably never met Patricia Salvi. Thanks to her IMAC students are able to se la péter en codant in english :) "),
('DE SMET', 'Enguerrand', 'desmet', "Enguerrand de Smet est un service après vente disponible 24h/24h. Il vous réparera tous vos bugs en un clin d'oeil et peut même réparer à domicile grâce à son One Wheel, un moyen de transport révolutionnaire"),
('NOVELLI', 'Jean-Christophe', 'novelli', "Passionné par tout ce qui se termine en -TIQUE. comme la zétéTIQUE ou les mathémaTIQUES, Jean-Christophe, tel un mousTIQUE saura piquer votre curiosité pour ces matières fantasTIQUES"),
('FOUCHY', 'Jules', 'fouchy', "Jules Fouchy est une pile électrique. Passionné, il vous en fera voir de toutes les couleurs avec son art génératif ! Attention sa jovialité est contagieuse. Après une courte discussion avec Jules vous vous trouverez peut-être à sautiller comme un cabri dans la rue"),
('VINCENT', 'Steeve', 'vincent', "Steeve aka Stev aka Stive aka Stiv aka..., vous l'aurez compris, cet énergumène a su se faire un nom (ou plusieurs) dans le domaine de la programmation."),
('DE ROBILLARD', 'Gaëtan', 'robillard', "Gaëtan de Robillard, enfant star de l'IMAC, tous les élèves le connaissent, le reconnaissent et lui vouent un culte particulier."),
('SULAK', 'Özlem', 'sulak', "Özlem Sualak est à la racine d'une fascination envers le grand McLuhan, qui se passe de promo en promo. Si son nom ne vous évoque rien...Gare à vous !");

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
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "1 (mer)")),
((SELECT ID_prof FROM prof WHERE Nom = 'AKYUREK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sagittaire"));

/*rep ROUX*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "2" AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Quel est votre nombre préféré ?"))),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sucré")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le pistolet à eau")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Photoshop")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "C++")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Burger frites")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "La Mongolie")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Les Beatles")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "Verte")),
((SELECT ID_prof FROM prof WHERE Nom = 'ROUX'),(SELECT ID_rep FROM reponse WHERE Libelle = "2" AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Plutôt mer (1) ou montagne (6) ?"))),
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
((SELECT ID_prof FROM prof WHERE Nom = 'LAPORTE'),(SELECT ID_rep FROM reponse WHERE Libelle = "2" AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Quel est votre nombre préféré ?"))),
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
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "6 (montagne)")),
((SELECT ID_prof FROM prof WHERE Nom = 'HERNANDEZ'),(SELECT ID_rep FROM reponse WHERE Libelle = "Taureau"));

/*rep VERGER*/
INSERT INTO quizz_Prof (ID_prof, ID_rep) VALUES
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "2" AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Quel est votre nombre préféré ?"))),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sucré")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "La cuillère")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Photoshop")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Le breton")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Être invisible")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Couscous")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Les États-Unis")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Kool and the gang")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "Rouge")),
((SELECT ID_prof FROM prof WHERE Nom = 'VERGER'),(SELECT ID_rep FROM reponse WHERE Libelle = "1 (mer)")),
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
((SELECT ID_prof FROM prof WHERE Nom = 'SALVI'),(SELECT ID_rep FROM reponse WHERE Libelle = "1 (mer)")),
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
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "2" AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Quel est votre nombre préféré ?"))),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "Sucré")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "La cuillère")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "Qu'est-ce ?")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "C++")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "Pouvoir se téléporter")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "Burger frites")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "La Creuse")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "Daft Punk")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "Jaune")),
((SELECT ID_prof FROM prof WHERE Nom = 'FOUCHY'),(SELECT ID_rep FROM reponse WHERE Libelle = "2"  AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Plutôt mer (1) ou montagne (6) ?"))),
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
((SELECT ID_prof FROM prof WHERE Nom = 'DE ROBILLARD'),(SELECT ID_rep FROM reponse WHERE Libelle = "6 (montagne)")),
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
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "2"  AND ID_Q = (SELECT ID_Q FROM question WHERE Libelle = "Plutôt mer (1) ou montagne (6) ?"))),
((SELECT ID_prof FROM prof WHERE Nom = 'SULAK'),(SELECT ID_rep FROM reponse WHERE Libelle = "Lion"));
