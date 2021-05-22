# source C:/Users/HP/Documents/GitHub/BazeDeDate/GestionareaFilmelor.sql;   


/*#############################################################*/

DROP DATABASE filmeDB;  
CREATE DATABASE filmeDB;
USE filmeDB;

/*#############################################################*/




/*#############################################################*/

CREATE TABLE tblDirectori(
	idDirector SMALLINT(3) AUTO_INCREMENT PRIMARY KEY,
	numeDirector VARCHAR(50) NOT NULL,
	anNastereDirector YEAR,
	avereDirector$ INT,
	CONSTRAINT numeDir_varstaDir UNIQUE(numeDirector,anNastereDirector)
);

CREATE TABLE tblFilme(
	idFilm SMALLINT(3) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
	codDirector SMALLINT(3) NOT NULL,
	titlu VARCHAR(50) NOT NULL,
	dataAparitie DATE,
	genFilm ENUM("Actiune","Animatie","Aventura","Comedie","Drama","Fantastic","Istoric","Horror","Thriller","Politist","Psihologic","Romantism","Science fiction"),
	notaFilm DECIMAL(3,1) UNSIGNED,
	CONSTRAINT fk_Director FOREIGN KEY(codDirector) REFERENCES tblDirectori(idDirector) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblUtilizatori(
	idUtilizator SMALLINT(3) AUTO_INCREMENT PRIMARY KEY,
	numeUtilizator VARCHAR(25) NOT NULL,
	parolaUtilizator VARCHAR(255) NOT NULL,
	emailUtilizator VARCHAR(50) NOT NULL,
	CONSTRAINT emailUtilizator UNIQUE(emailUtilizator),
	CONSTRAINT numeUtilizator UNIQUE(numeUtilizator)
);

CREATE TABLE tblActori(
	idActor SMALLINT(3) AUTO_INCREMENT PRIMARY KEY,
	numeActor VARCHAR(50) NOT NULL,
	anNastereActor YEAR NOT NULL,
	etnieActor VARCHAR(25),
	oscarActor ENUM("Da","Nu")
);

CREATE TABLE tblRecenzii(
	idRecenzie SMALLINT(4) AUTO_INCREMENT PRIMARY KEY,
	codFilmRecenzie SMALLINT(3) ZEROFILL NOT NULL,
	codUtilizator SMALLINT(3) NOT NULL,
	dataRecenzie DATETIME NOT NULL,
	notaFilmRecenzie DECIMAL(3,1) UNSIGNED,
	textRecenzie TINYBLOB,
	CONSTRAINT fk_FilmRecenzie FOREIGN KEY(codFilmRecenzie) REFERENCES tblFilme(idFilm) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Utilizator FOREIGN KEY(codUtilizator) REFERENCES tblUtilizatori(idUtilizator) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblActori_Filme(
	idActoriFilme SMALLINT(3) AUTO_INCREMENT PRIMARY KEY,
	codFilm SMALLINT(3) ZEROFILL NOT NULL,
	codActor SMALLINT(3),
	numePersonaj VARCHAR(50),
	clasificarePersonaj ENUM("Protagonist","Antagonist","Secundar","Neutru"),
	CONSTRAINT fk_Film FOREIGN KEY(codFilm) REFERENCES tblFilme(idFilm) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Actor FOREIGN KEY(codActor) REFERENCES tblActori(idActor) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT codFi_codAc UNIQUE(codFilm,codActor)
);

/*#############################################################*/




/*#############################################################*/

INSERT INTO tblDirectori VALUES(200,"Joss Whedon",1964,12000000);
INSERT INTO tblDirectori(numeDirector,anNastereDirector,avereDirector$) VALUES("Joe Russo",1978,15000000);
INSERT INTO tblDirectori(numeDirector,anNastereDirector,avereDirector$) VALUES("Quentin Tarantino",1963,120000000);
INSERT INTO tblDirectori(numeDirector,anNastereDirector,avereDirector$) VALUES("Steven Spielberg",1947,10000000);
INSERT INTO tblDirectori(numeDirector,anNastereDirector,avereDirector$) VALUES("Martin Scorsese",1947,150000000);
INSERT INTO tblDirectori(numeDirector,anNastereDirector,avereDirector$) VALUES("James Cameron",1954,900000000);
INSERT INTO tblDirectori(numeDirector,anNastereDirector,avereDirector$) VALUES("Robert Rodriguez",1968,50000000);
INSERT INTO tblDirectori(numeDirector,anNastereDirector,avereDirector$) VALUES("Clint Eastwood",1930,200000000);
INSERT INTO tblDirectori(numeDirector,anNastereDirector,avereDirector$) VALUES("Francis Ford Coppola",1939,100000000);
INSERT INTO tblDirectori(numeDirector,anNastereDirector,avereDirector$) VALUES("Christopher Nolan",1970,80000000);

INSERT INTO tblFilme VALUES(1,200,"Avangers","2012-04-11","Actiune",9);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(201,"Avangers: Infinity War","2018-04-27","Actiune",10);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(201,"Avangers: Endgame","2019-04-28","Actiune",6.3);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(202,"Pulp Fiction","1994-10-14","Thriller",8.9);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(202,"Django","2013-01-18","Drama",8.4);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(203,"Jurassic Park","1993-06-11","Actiune",8.1);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(203,"Lista lui Schindler","1993-12-1","Psihologic",4);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(204,"Irishman","2019-09-27","Actiune",4.9);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(204,"The Wolf of Wall Street","2014-01-10","Comedie",8.2);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(204,"Hugo","2012-04-13","Aventura",3.8);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(205,"Avatar","2009-12-11","Science fiction",9.6);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(207,"Gran Torino","2008-12-09","Thriller",8.2);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(208,"GodFather","1972-03-14","Politist",9.6);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(209,"Batman","2012-03-10","Actiune",8.7);
INSERT INTO tblFilme(codDirector,titlu,dataAparitie,genFilm,notaFilm) VALUES(200,"Frozen","2013-12-27","Animatie",5);

INSERT INTO tblUtilizatori VALUES(800,"BOGDAN23",SHA1("Bogdanul233"),"bogdan232@yahoo.com");
INSERT INTO tblUtilizatori(numeUtilizator,parolaUtilizator,emailUtilizator) VALUES("bogdanel",SHA1("Bagdadi11"),"bagdadibagdadi@yahoo.com");
INSERT INTO tblUtilizatori(numeUtilizator,parolaUtilizator,emailUtilizator) VALUES("florix_28",SHA1("mamatata"),"florin_28@yahoo.ro");
INSERT INTO tblUtilizatori(numeUtilizator,parolaUtilizator,emailUtilizator) VALUES("Bumerang",SHA1("BingBang"),"Yakales234@yahoo.com");
INSERT INTO tblUtilizatori(numeUtilizator,parolaUtilizator,emailUtilizator) VALUES("Fabian_pa",SHA1("Dacia1010"),"Fabianfrumos55@yahoo.ro");
INSERT INTO tblUtilizatori(numeUtilizator,parolaUtilizator,emailUtilizator) VALUES("Bill",SHA1("billareparola"),"billareemmail@yahoo.com");
INSERT INTO tblUtilizatori(numeUtilizator,parolaUtilizator,emailUtilizator) VALUES("Mircea",SHA1("babanul"),"babanulconstanta@yahoo.ro");
INSERT INTO tblUtilizatori(numeUtilizator,parolaUtilizator,emailUtilizator) VALUES("Gigi",SHA1("haisteaua"),"steauasusrasare@yahoo.ro");
INSERT INTO tblUtilizatori(numeUtilizator,parolaUtilizator,emailUtilizator) VALUES("Wolf44",SHA1("44flow"),"Wolfufuf@yahoo.com");
INSERT INTO tblUtilizatori(numeUtilizator,parolaUtilizator,emailUtilizator) VALUES("Grizzly99",SHA1("mieredealbine"),"ursmanancamiere@yahoo.ro");

INSERT INTO tblRecenzii(idRecenzie,codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(1000,001,802,"2012-04-12 14:22:35",8.5,"A fost super, cred, nu sunt sigur...");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(002,800,"2019-07-17 13:27:45",7,"Cred ca pe asta l am vazut SI nu mi a PLACUT!!!!");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(003,801,"2020-06-27 18:30:42",4.2,"In timp ce ma uitam, ma gandeam de ce ma uit?");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(004,803,"2000-04-14 12:10:20",9,"O pelicula foarte interesanta si atractiva");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(004,804,"2001-05-21 18:15:15",7,"Un film ce este mai greu de inteles"); 
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(005,806,"2014-02-14 10:10:10",8,"Un film de poveste");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(006,805,"1994-05-03 16:30:10",7.3,"Extraordinare de bune efectele");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(008,802,"2020-03-05 19:08:02",10,"Mare impact psihologic, nu ma asteptam");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(008,807,"2020-04-02 20:20:13",8.5," O sonorizare excelenta");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(008,808,"2020-11-15 20:32:10",4.9,"Bun de adaugat in lista");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(009,809,"2015-09-03 19:09:02",8,"Un actor foarte talentat");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(011,806,"2020-02-02 08:10:15",9.2,"Incredibil de bun");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(011,805,"2018-02-05 09:09:10",9.0,"Copilului meu i-a placut foarte mult");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(011,800,"2017-03-05 10:10:05",3.3,"M-as mai uita inca o data");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(012,803,"2009-09-04 12:12:34",9,"Extrem de tensionata aciunea");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(013,804,"1999-03-03 16:32:34",10,"Unul dintre cele mai bune filme");
INSERT INTO tblRecenzii(codFilmRecenzie,codUtilizator,dataRecenzie,notaFilmRecenzie,textRecenzie) VALUES(014,809,"2015-03-02 19:08:05",9.2,"Foarte bun");

INSERT INTO tblActori VALUES(400,"Robert Downey Jr.",1965,"Irlandez","Da");
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("Mark Ruffalo",1969,"American","Nu");#401
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("John Travolta",1954,"Italian","Nu");#402
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("Brad Pitt",1954,"American","Da");#403
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("Joaquin Phoenix",1974,"Puertorican","Da");#404
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("Leonardo DiCaprio",1974,"Italian","Da");#405
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("Samuel L. Jackson",1949,"American","Nu");#406
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("Laura Dern",1977,"Irlandeza","Nu");#407
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("Embeth Davidtz",1965,"Olandeza","Nu");#408
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("Robert De Niro",1943,"Italian","Da");#409
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("Margot Robbie",1990,"Australiana","Nu");#410
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("Sam Worthington",1976,"Australian","Nu");#411
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("Scott Eastwood",1984,"Englez","Nu");#412
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("Al Pacino",1940,"Italian","Da");#413
INSERT INTO tblActori(numeActor,anNastereActor,etnieActor,oscarActor) VALUES("Christian Bale",1975,"Englez","Nu");#414

INSERT INTO tblActori_Filme VALUES(600,001,400,"Tony Stark","Protagonist");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(002,401,"Hulk","Secundar");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(003,401,"Hulk","Secundar");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(004,402,"Vicent Vega","Protagonist");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(004,406,"Jules Winfield","Protagonist");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(005,406,"Stephen","Antagonist");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(005,405,"Calvin","Protagonist");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(006,407,"Ellie","Protagonist");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(006,406,"Arnold","Neutru");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(007,408,"Hellen","Neutru");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(008,409,"Frank","Protagonist");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(008,413,"Jimmy","Protagonist");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(009,405,"Jordan","Protagonist");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(009,410,"Naomi","Secundar");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(011,411,"Jake","Protagonist");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(012,412,"Trey","Secundar");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(013,413,"Michael","Protagonist");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(013,409,"Vito Corleone","Secundar");
INSERT INTO tblActori_Filme(codFilm,codActor,numePersonaj,clasificarePersonaj) VALUES(014,414,"Bruce Wayne","Protagonist");
INSERT INTO tblActori_Filme(codFilm,numePersonaj,clasificarePersonaj) VALUES(015,"Elsa","Protagonist");

/*#############################################################*/



/*#############################################################*/
#DESCRIBE tblDirectori;
#DESCRIBE tblFilme;
#DESCRIBE tblUtilizatori;
#DESCRIBE tblRecenzii;
#DESCRIBE tblActori;
#DESCRIBE tblActori_Filme;


#SELECT * FROM tblDirectori;
#SELECT * FROM tblFilme;
#SELECT * FROM tblUtilizatori;
#SELECT * FROM tblRecenzii;
#SELECT * FROM tblActori;
#SELECT * FROM tblActori_Filme;
/*#############################################################*/





#######################################################################################################################
#######################################################################################################################

#######################################################################################################################
#######################################################################################################################

#1. Afisati informatii despre filmele lansate dupa anul 2000 care au o nota mai mare de 8
SELECT *FROM tblFilme WHERE (EXTRACT(YEAR FROM dataAparitie) > 2000) AND (notaFilm > 8);
#2. Afisati toate informatiile despre filmele care au obtinut o nota mai mare decat filmul "Jurassic Park"
SELECT *FROM tblFilme WHERE notaFilm > ALL(SELECT notaFilm FROM tblFilme WHERE titlu = "Jurassic Park");
#3. Pentru fiecare recenzie afisati: numele filmului, numele utilizatorului care a facut recenzia, nota recenzie si comentariu 
SELECT titlu,numeUtilizator,notaFilmRecenzie,textRecenzie FROM tblFilme,tblUtilizatori,tblRecenzii WHERE tblFilme.idFilm=tblRecenzii.codFilmRecenzie AND tblUtilizatori.idUtilizator=tblRecenzii.codUtilizator;
#4. Pentru fiecare film afisati toate informatiile + nota medie obtinuta din recenzii. Afisati info despre filme chiar daca nu au recenzii!
SELECT idFilm,codDirector,titlu,dataAparitie,genFilm,notaFilm,AVG(notaFilmRecenzie) AS notaMedieRecenzie FROM tblFilme LEFT JOIN tblRecenzii ON tblFilme.idFilm=tblRecenzii.codFilmRecenzie GROUP BY idFilm;
#5. Modificati tabelul tblRecenzii astfel incat un utilizator sa nu poata face mai multe recenzii pentru un acelasi film.
ALTER TABLE tblRecenzii ADD UNIQUE (codFilmRecenzie,codUtilizator);
#6. Specificati in cate filme de actiune a jucat fiecare actor. 
SELECT numeActor,COUNT(codActor) AS numarFilmeActiune FROM tblActori,tblActori_Filme,tblFilme WHERE (tblActori.idActor=tblActori_Filme.codActor) AND (tblFilme.idFilm=tblActori_Filme.codFilm AND genFilm = "Actiune") GROUP BY numeActor;
#7. In ce film a jucat Al Pacino si a obtinut cea mai mica nota pe baza recenziilor?
SELECT titlu FROM tblFilme,tblActori,tblActori_Filme,tblRecenzii WHERE (tblActori.idActor=tblActori_Filme.codActor AND numeActor="Al Pacino") AND (tblActori_Filme.codFilm=tblFilme.idFilm) AND (tblFilme.idFilm=tblRecenzii.codFilmRecenzie) GROUP BY notaFilmRecenzie ASC LIMIT 1; 



#######################################################################################################################