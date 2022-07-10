--
-- File generated with SQLiteStudio v3.3.3 on mer mag 5 21:15:54 2021
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Ballerino
CREATE TABLE Ballerino (
    Codice            INTEGER PRIMARY KEY AUTOINCREMENT
                              NOT NULL,
    Nome              TEXT    NOT NULL,
    Cognome           TEXT    NOT NULL,
    Sesso             TEXT    NOT NULL
                              CHECK (Sesso = 'Maschio' OR 
                                     Sesso = 'Femmina'),
    [Data di Nascita] DATE    NOT NULL,
    Privatista        TEXT    NOT NULL
                              CHECK (Privatista = 'No' OR 
                                     Privatista = 'Si'),
    Scuola            INTEGER REFERENCES ScuolaDiBallo (ID) ON DELETE RESTRICT
                                                            ON UPDATE CASCADE,
    Classe            TEXT    REFERENCES Classe (Nome) ON DELETE RESTRICT
                                                       ON UPDATE RESTRICT
                              NOT NULL,
    Categoria         TEXT    REFERENCES Categoria (Nome) ON DELETE RESTRICT
                                                          ON UPDATE RESTRICT
                              NOT NULL,
    CONSTRAINT RV1 CHECK (Scuola IS NULL AND 
                          Privatista = 'Si' OR 
                          Scuola IS NOT NULL AND 
                          Privatista = 'No') 
);

INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (1, 'Simone', 'Mille', 'Maschio', '05/09/1995', 'Si', NULL, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (2, 'Ritage', 'Almaradi', 'Femmina', '13/03/2000', 'Si', NULL, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (5, 'Lorenzo', 'Bertini', 'Maschio', '13/07/1994', 'Si', NULL, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (6, 'Assunta', 'Rossi', 'Femmina', '18/12/1996', 'Si', NULL, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (7, 'Federica', 'Cafarotti', 'Femmina', '28/05/2000', 'No', 1, 'C', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (8, 'Nicola', 'Battista', 'Maschio', '30/10/1989', 'No', 1, 'C', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (9, 'Federico', 'Berardo', 'Maschio', '18/06/1997', 'No', 1, 'C', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (10, 'Marzia', 'Mostro', 'Femmina', '20/02/1995', 'No', 1, 'C', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (11, 'Massimiliano', 'Placidi', 'Maschio', '07/07/1992', 'No', 2, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (12, 'Samantha', 'Amicucci', 'Femmina', '19/12/1989', 'No', 2, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (13, 'Gianluca', 'Ranucci', 'Maschio', '15/08/1989', 'No', 1, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (14, 'Chiara', 'De Franceschi', 'Femmina', '14/05/1992', 'No', 1, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (15, 'Paolo', 'Rossi', 'Maschio', '04/02/1962', 'Si', NULL, 'D', 'Super-Senior');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (16, 'Genoveffa', 'Saputelli', 'Femmina', '05/12/1993', 'Si', NULL, 'D', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (17, 'Manuel', 'Santelli', 'Maschio', '17/10/1995', 'No', 3, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (18, 'Ludovica', 'Colaiacomo', 'Femmina', '13/05/1993', 'No', 3, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (19, 'Luca', 'Bologna', 'Maschio', '15/10/1995', 'No', 3, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (20, 'Irene', 'Spallotta', 'Femmina', '01/01/1993', 'No', 3, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (21, 'Gabriele', 'Santonastaso', 'Maschio', '12/10/1992', 'No', 1, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (22, 'Vanessa', 'Crincoli', 'Femmina', '16/07/1993', 'No', 1, 'M', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (23, 'Asdrubale', 'Menegildo', 'Maschio', '05/07/1992', 'No', 4, 'C', 'Adulti');
INSERT INTO Ballerino (Codice, Nome, Cognome, Sesso, "Data di Nascita", Privatista, Scuola, Classe, Categoria) VALUES (24, 'Giovanni', 'Rossi', 'Maschio', '14/10/1999', 'No', 4, 'C', 'Adulti');

-- Table: Categoria
CREATE TABLE Categoria (
    Nome          TEXT    PRIMARY KEY
                          NOT NULL,
    [Età minima]  INTEGER NOT NULL,
    [Età massima] INTEGER NOT NULL,
    CHECK (Nome IN ('Baby', 'Juveniles', 'Juniores', 'Youth', 'Adulti', 'Senior', 'Super-Senior') ) 
)
WITHOUT ROWID;

INSERT INTO Categoria (Nome, "Età minima", "Età massima") VALUES ('Adulti', 18, 39);
INSERT INTO Categoria (Nome, "Età minima", "Età massima") VALUES ('Baby', 5, 7);
INSERT INTO Categoria (Nome, "Età minima", "Età massima") VALUES ('Juniores', 12, 14);
INSERT INTO Categoria (Nome, "Età minima", "Età massima") VALUES ('Juveniles', 8, 11);
INSERT INTO Categoria (Nome, "Età minima", "Età massima") VALUES ('Senior', 40, 50);
INSERT INTO Categoria (Nome, "Età minima", "Età massima") VALUES ('Super-Senior', 51, 99);
INSERT INTO Categoria (Nome, "Età minima", "Età massima") VALUES ('Youth', 15, 17);

-- Table: Classe
CREATE TABLE Classe (
    Nome TEXT NOT NULL
            PRIMARY KEY,
    CHECK (Nome IN ('D', 'C', 'B', 'A', 'M') ) 
)
WITHOUT ROWID;

INSERT INTO Classe (Nome) VALUES ('A');
INSERT INTO Classe (Nome) VALUES ('B');
INSERT INTO Classe (Nome) VALUES ('C');
INSERT INTO Classe (Nome) VALUES ('D');
INSERT INTO Classe (Nome) VALUES ('M');

-- Table: Classifica
CREATE TABLE Classifica (
    ID         INTEGER PRIMARY KEY AUTOINCREMENT
                       NOT NULL,
    Classe     STRING  REFERENCES Classe (Nome) ON DELETE RESTRICT
                                                ON UPDATE RESTRICT
                       NOT NULL,
    Categoria  TEXT    REFERENCES Categoria (Nome) ON DELETE RESTRICT
                                                   ON UPDATE RESTRICT
                       NOT NULL,
    Disciplina TEXT    REFERENCES Disciplina (Nome) ON DELETE RESTRICT
                                                    ON UPDATE RESTRICT
                       NOT NULL,
    UNIQUE (
        Classe,
        Categoria,
        Disciplina
    )
);

INSERT INTO Classifica (ID, Classe, Categoria, Disciplina) VALUES (1, 'M', 'Adulti', 'Salsa');

-- Table: ComposizioneG
CREATE TABLE ComposizioneG (
    Gruppo    INTEGER REFERENCES Gruppo (Numero) ON DELETE CASCADE
                                                 ON UPDATE CASCADE
                      NOT NULL,
    Ballerino INTEGER REFERENCES Ballerino (Codice) ON DELETE CASCADE
                                                    ON UPDATE CASCADE
                      NOT NULL,
    PRIMARY KEY (
        Gruppo,
        Ballerino
    )
)
WITHOUT ROWID;

INSERT INTO ComposizioneG (Gruppo, Ballerino) VALUES (3, 1);
INSERT INTO ComposizioneG (Gruppo, Ballerino) VALUES (3, 5);
INSERT INTO ComposizioneG (Gruppo, Ballerino) VALUES (4, 7);
INSERT INTO ComposizioneG (Gruppo, Ballerino) VALUES (4, 8);
INSERT INTO ComposizioneG (Gruppo, Ballerino) VALUES (5, 2);
INSERT INTO ComposizioneG (Gruppo, Ballerino) VALUES (5, 6);
INSERT INTO ComposizioneG (Gruppo, Ballerino) VALUES (5, 7);

-- Table: Concorrente
CREATE TABLE Concorrente (
    Numero    INTEGER PRIMARY KEY AUTOINCREMENT
                      NOT NULL,
    Classe    TEXT    REFERENCES Classe (Nome) ON DELETE RESTRICT
                                               ON UPDATE CASCADE
                      NOT NULL,
    Categoria TEXT    REFERENCES Categoria (Nome) ON DELETE RESTRICT
                                                  ON UPDATE CASCADE
                      NOT NULL
);

INSERT INTO Concorrente (Numero, Classe, Categoria) VALUES (1, 'M', 'Adulti');
INSERT INTO Concorrente (Numero, Classe, Categoria) VALUES (2, 'M', 'Adulti');
INSERT INTO Concorrente (Numero, Classe, Categoria) VALUES (3, 'M', 'Adulti');
INSERT INTO Concorrente (Numero, Classe, Categoria) VALUES (4, 'C', 'Adulti');
INSERT INTO Concorrente (Numero, Classe, Categoria) VALUES (5, 'M', 'Adulti');
INSERT INTO Concorrente (Numero, Classe, Categoria) VALUES (6, 'C', 'Adulti');
INSERT INTO Concorrente (Numero, Classe, Categoria) VALUES (7, 'M', 'Adulti');
INSERT INTO Concorrente (Numero, Classe, Categoria) VALUES (8, 'M', 'Adulti');
INSERT INTO Concorrente (Numero, Classe, Categoria) VALUES (9, 'C', 'Adulti');
INSERT INTO Concorrente (Numero, Classe, Categoria) VALUES (10, 'M', 'Adulti');
INSERT INTO Concorrente (Numero, Classe, Categoria) VALUES (11, 'M', 'Adulti');
INSERT INTO Concorrente (Numero, Classe, Categoria) VALUES (12, 'M', 'Adulti');

-- Table: Coppia
CREATE TABLE Coppia (
    Numero    INTEGER PRIMARY KEY
                      REFERENCES Concorrente (Numero) ON DELETE CASCADE
                                                      ON UPDATE CASCADE
                      NOT NULL,
    Ballerino INTEGER NOT NULL
                      UNIQUE
                      REFERENCES Ballerino (Codice) ON DELETE CASCADE
                                                    ON UPDATE CASCADE,
    Ballerina INTEGER UNIQUE
                      REFERENCES Ballerino (Codice) ON DELETE CASCADE
                                                    ON UPDATE CASCADE
                      NOT NULL
)
WITHOUT ROWID;

INSERT INTO Coppia (Numero, Ballerino, Ballerina) VALUES (1, 1, 2);
INSERT INTO Coppia (Numero, Ballerino, Ballerina) VALUES (2, 5, 6);
INSERT INTO Coppia (Numero, Ballerino, Ballerina) VALUES (6, 9, 10);
INSERT INTO Coppia (Numero, Ballerino, Ballerina) VALUES (7, 11, 12);
INSERT INTO Coppia (Numero, Ballerino, Ballerina) VALUES (8, 13, 14);
INSERT INTO Coppia (Numero, Ballerino, Ballerina) VALUES (9, 8, 7);
INSERT INTO Coppia (Numero, Ballerino, Ballerina) VALUES (10, 21, 22);
INSERT INTO Coppia (Numero, Ballerino, Ballerina) VALUES (11, 19, 20);
INSERT INTO Coppia (Numero, Ballerino, Ballerina) VALUES (12, 17, 18);

-- Table: Disciplina
CREATE TABLE Disciplina (
    Nome         TEXT    PRIMARY KEY
                         NOT NULL,
    NumeroGruppi INTEGER,
    NumeroCoppie INTEGER,
    Tipologia    TEXT    NOT NULL,
    CHECK (Tipologia IN ('Gruppo', 'Coppia') ) 
)
WITHOUT ROWID;

INSERT INTO Disciplina (Nome, NumeroGruppi, NumeroCoppie, Tipologia) VALUES ('Bachata', NULL, 0, 'Coppia');
INSERT INTO Disciplina (Nome, NumeroGruppi, NumeroCoppie, Tipologia) VALUES ('Caribbean Show Dance', 0, NULL, 'Gruppo');
INSERT INTO Disciplina (Nome, NumeroGruppi, NumeroCoppie, Tipologia) VALUES ('Kizomba', NULL, 0, 'Coppia');
INSERT INTO Disciplina (Nome, NumeroGruppi, NumeroCoppie, Tipologia) VALUES ('Latin Show Dance', 3, NULL, 'Gruppo');
INSERT INTO Disciplina (Nome, NumeroGruppi, NumeroCoppie, Tipologia) VALUES ('Salsa', NULL, 3, 'Coppia');

-- Table: Giudice
CREATE TABLE Giudice (
    Codice            INTEGER PRIMARY KEY AUTOINCREMENT
                              NOT NULL,
    Nome              TEXT    NOT NULL,
    Cognome           TEXT    NOT NULL,
    [Data di Nascita] DATE    NOT NULL,
    Internazionale    TEXT    NOT NULL
                              CHECK (Internazionale = 'No' OR 
                                     Internazionale = 'Si'),
    Scuola            TEXT    REFERENCES ScuolaDiBallo (ID) ON DELETE RESTRICT
                                                            ON UPDATE CASCADE
);

INSERT INTO Giudice (Codice, Nome, Cognome, "Data di Nascita", Internazionale, Scuola) VALUES (1, 'Alex', 'Fiorini', '13/07/1987', 'No', '1');
INSERT INTO Giudice (Codice, Nome, Cognome, "Data di Nascita", Internazionale, Scuola) VALUES (2, 'Armando', 'Moras', '15/07/1982', 'No', '1');
INSERT INTO Giudice (Codice, Nome, Cognome, "Data di Nascita", Internazionale, Scuola) VALUES (3, 'Patrizio', 'Marinelli', '16/07/1990', 'No', '2');
INSERT INTO Giudice (Codice, Nome, Cognome, "Data di Nascita", Internazionale, Scuola) VALUES (4, 'Roberto', 'Pugliesi', '12/01/1987', 'No', '3');
INSERT INTO Giudice (Codice, Nome, Cognome, "Data di Nascita", Internazionale, Scuola) VALUES (5, 'Maykel ', 'Fonts', '13/03/1980', 'Si', NULL);
INSERT INTO Giudice (Codice, Nome, Cognome, "Data di Nascita", Internazionale, Scuola) VALUES (6, 'Roly', 'Maden', '14/05/1969', 'Si', NULL);

-- Table: Giudizio
CREATE TABLE Giudizio (
    PartecipazioneC INTEGER NOT NULL,
    PartecipazioneG INTEGER NOT NULL,
    MatchC          INTEGER NOT NULL,
    MatchG          INTEGER NOT NULL,
    Tipologia       TEXT    CHECK (Tipologia = "Finale" OR 
                                   Tipologia = "Eliminatorie") 
                            NOT NULL,
    Posizione       INTEGER CHECK (Posizione <= 6 AND 
                                   Posizione > 0),
    Consenso        TEXT    CHECK (Consenso = 'Si' OR 
                                   Consenso = 'No'),
    CHECK (MatchC = MatchG),
    PRIMARY KEY (
        PartecipazioneC,
        PartecipazioneG,
        MatchC,
        MatchG
    ),
    FOREIGN KEY (
        PartecipazioneC,
        MatchC
    )
    REFERENCES PartecipazioneC (Concorrente,
    [Match]),
    FOREIGN KEY (
        PartecipazioneG,
        MatchG
    )
    REFERENCES PartecipazioneG (Giudice,
    [Match]),
    UNIQUE (
        PartecipazioneG,
        MatchG,
        Posizione
    )
    ON CONFLICT ROLLBACK
)
WITHOUT ROWID;

INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (1, 1, 1, 1, 'Finale', 1, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (1, 1, 4, 4, 'Eliminatorie', NULL, 'Si');
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (1, 2, 1, 1, 'Finale', 1, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (1, 2, 4, 4, 'Eliminatorie', NULL, 'Si');
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (1, 3, 1, 1, 'Finale', 1, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (1, 4, 1, 1, 'Finale', 1, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (1, 5, 1, 1, 'Finale', 1, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (1, 6, 1, 1, 'Finale', 1, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (2, 1, 1, 1, 'Finale', 2, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (2, 1, 4, 4, 'Eliminatorie', NULL, 'Si');
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (2, 2, 1, 1, 'Finale', 4, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (2, 3, 1, 1, 'Finale', 4, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (2, 4, 1, 1, 'Finale', 2, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (2, 5, 1, 1, 'Finale', 2, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (2, 6, 1, 1, 'Finale', 2, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (7, 1, 1, 1, 'Finale', 4, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (7, 1, 4, 4, 'Eliminatorie', NULL, 'Si');
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (7, 2, 1, 1, 'Finale', 3, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (7, 3, 1, 1, 'Finale', 2, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (7, 4, 1, 1, 'Finale', 3, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (7, 5, 1, 1, 'Finale', 4, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (7, 6, 1, 1, 'Finale', 4, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (8, 1, 1, 1, 'Finale', 3, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (8, 1, 4, 4, 'Eliminatorie', NULL, 'Si');
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (8, 2, 1, 1, 'Finale', 2, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (8, 3, 1, 1, 'Finale', 3, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (8, 4, 1, 1, 'Finale', 4, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (8, 5, 1, 1, 'Finale', 3, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (8, 6, 1, 1, 'Finale', 3, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (10, 1, 1, 1, 'Finale', 5, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (10, 1, 4, 4, 'Eliminatorie', NULL, 'Si');
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (10, 2, 1, 1, 'Finale', 6, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (10, 3, 1, 1, 'Finale', 6, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (10, 4, 1, 1, 'Finale', 5, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (10, 5, 1, 1, 'Finale', 5, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (10, 6, 1, 1, 'Finale', 6, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (11, 1, 1, 1, 'Finale', 6, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (11, 1, 4, 4, 'Eliminatorie', NULL, 'Si');
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (11, 2, 1, 1, 'Finale', 5, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (11, 3, 1, 1, 'Finale', 5, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (11, 4, 1, 1, 'Finale', 6, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (11, 5, 1, 1, 'Finale', 6, NULL);
INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione, Consenso) VALUES (11, 6, 1, 1, 'Finale', 5, NULL);

-- Table: Gruppo
CREATE TABLE Gruppo (
    Numero INTEGER PRIMARY KEY
                   REFERENCES Concorrente (Numero) ON DELETE CASCADE
                                                   ON UPDATE CASCADE
                   NOT NULL,
    Nome   TEXT    UNIQUE
                   NOT NULL
)
WITHOUT ROWID;

INSERT INTO Gruppo (Numero, Nome) VALUES (3, 'Pa Los Rumberos');
INSERT INTO Gruppo (Numero, Nome) VALUES (4, 'Selleri');
INSERT INTO Gruppo (Numero, Nome) VALUES (5, 'Primera Vez');

-- Table: IscrizioneCoppia
CREATE TABLE IscrizioneCoppia (
    NumeroCoppia   INTEGER REFERENCES Coppia ON DELETE CASCADE
                                             ON UPDATE CASCADE
                           NOT NULL,
    NomeDisciplina TEXT    REFERENCES Disciplina (Nome) ON DELETE CASCADE
                                                        ON UPDATE CASCADE
                           NOT NULL
                           CONSTRAINT RV15 CHECK (NomeDisciplina IN ("Salsa", "Bachata", "Kizomba") ),
    PRIMARY KEY (
        NumeroCoppia,
        NomeDisciplina
    )
)
WITHOUT ROWID;

INSERT INTO IscrizioneCoppia (NumeroCoppia, NomeDisciplina) VALUES (1, 'Bachata');
INSERT INTO IscrizioneCoppia (NumeroCoppia, NomeDisciplina) VALUES (1, 'Salsa');
INSERT INTO IscrizioneCoppia (NumeroCoppia, NomeDisciplina) VALUES (2, 'Bachata');
INSERT INTO IscrizioneCoppia (NumeroCoppia, NomeDisciplina) VALUES (2, 'Salsa');
INSERT INTO IscrizioneCoppia (NumeroCoppia, NomeDisciplina) VALUES (7, 'Bachata');
INSERT INTO IscrizioneCoppia (NumeroCoppia, NomeDisciplina) VALUES (7, 'Salsa');
INSERT INTO IscrizioneCoppia (NumeroCoppia, NomeDisciplina) VALUES (8, 'Salsa');
INSERT INTO IscrizioneCoppia (NumeroCoppia, NomeDisciplina) VALUES (10, 'Salsa');
INSERT INTO IscrizioneCoppia (NumeroCoppia, NomeDisciplina) VALUES (11, 'Salsa');
INSERT INTO IscrizioneCoppia (NumeroCoppia, NomeDisciplina) VALUES (12, 'Salsa');

-- Table: IscrizioneGruppo
CREATE TABLE IscrizioneGruppo (
    NumeroGruppo   INTEGER REFERENCES Gruppo (Numero) ON DELETE CASCADE
                                                      ON UPDATE CASCADE
                           NOT NULL,
    NomeDisciplina TEXT    REFERENCES Disciplina (Nome) ON DELETE CASCADE
                                                        ON UPDATE CASCADE
                           NOT NULL
                           CHECK (NomeDisciplina = "Latin Show Dance" OR 
                                  NomeDisciplina = "Caribbean Show Dance"),
    PRIMARY KEY (
        NumeroGruppo,
        NomeDisciplina
    )
)
WITHOUT ROWID;

INSERT INTO IscrizioneGruppo (NumeroGruppo, NomeDisciplina) VALUES (3, 'Latin Show Dance');
INSERT INTO IscrizioneGruppo (NumeroGruppo, NomeDisciplina) VALUES (4, 'Latin Show Dance');
INSERT INTO IscrizioneGruppo (NumeroGruppo, NomeDisciplina) VALUES (5, 'Latin Show Dance');

-- Table: Match
CREATE TABLE [Match] (
    ID                INTEGER PRIMARY KEY AUTOINCREMENT
                              NOT NULL,
    Round             TEXT    REFERENCES Round (Tipologia) ON DELETE RESTRICT
                                                           ON UPDATE RESTRICT
                              NOT NULL,
    Classe            TEXT    REFERENCES Classe (Nome) ON DELETE RESTRICT
                                                       ON UPDATE RESTRICT
                              NOT NULL,
    Categoria         TEXT    REFERENCES Categoria (Nome) ON DELETE RESTRICT
                                                          ON UPDATE RESTRICT
                              NOT NULL,
    Disciplina        TEXT    REFERENCES Disciplina (Nome) ON DELETE RESTRICT
                                                           ON UPDATE RESTRICT
                              NOT NULL,
    NumeroConcorrenti INTEGER NOT NULL
);

INSERT INTO "Match" (ID, Round, Classe, Categoria, Disciplina, NumeroConcorrenti) VALUES (1, 'Finale', 'M', 'Adulti', 'Salsa', 6);
INSERT INTO "Match" (ID, Round, Classe, Categoria, Disciplina, NumeroConcorrenti) VALUES (2, 'Ottavi', 'B', 'Adulti', 'Salsa', 16);
INSERT INTO "Match" (ID, Round, Classe, Categoria, Disciplina, NumeroConcorrenti) VALUES (3, 'Finale', 'C', 'Adulti', 'Bachata', 6);
INSERT INTO "Match" (ID, Round, Classe, Categoria, Disciplina, NumeroConcorrenti) VALUES (4, 'Semifinale', 'M', 'Adulti', 'Salsa', 7);

-- Table: PartecipazioneC
CREATE TABLE PartecipazioneC (
    Concorrente INTEGER NOT NULL
                        REFERENCES Concorrente (Numero) ON DELETE CASCADE
                                                        ON UPDATE CASCADE,
    [Match]     INTEGER NOT NULL
                        REFERENCES [Match] (ID) ON DELETE CASCADE
                                                ON UPDATE CASCADE,
    PRIMARY KEY (
        Concorrente,
        [Match]
    )
)
WITHOUT ROWID;

INSERT INTO PartecipazioneC (Concorrente, "Match") VALUES (1, 1);
INSERT INTO PartecipazioneC (Concorrente, "Match") VALUES (1, 4);
INSERT INTO PartecipazioneC (Concorrente, "Match") VALUES (2, 1);
INSERT INTO PartecipazioneC (Concorrente, "Match") VALUES (2, 4);
INSERT INTO PartecipazioneC (Concorrente, "Match") VALUES (7, 1);
INSERT INTO PartecipazioneC (Concorrente, "Match") VALUES (7, 4);
INSERT INTO PartecipazioneC (Concorrente, "Match") VALUES (8, 1);
INSERT INTO PartecipazioneC (Concorrente, "Match") VALUES (8, 4);
INSERT INTO PartecipazioneC (Concorrente, "Match") VALUES (10, 1);
INSERT INTO PartecipazioneC (Concorrente, "Match") VALUES (10, 4);
INSERT INTO PartecipazioneC (Concorrente, "Match") VALUES (11, 1);
INSERT INTO PartecipazioneC (Concorrente, "Match") VALUES (11, 4);
INSERT INTO PartecipazioneC (Concorrente, "Match") VALUES (12, 4);

-- Table: PartecipazioneG
CREATE TABLE PartecipazioneG (
    Giudice INTEGER REFERENCES Giudice (Codice) ON DELETE RESTRICT
                                                ON UPDATE RESTRICT
                    NOT NULL,
    [Match] INTEGER REFERENCES [Match] (ID) ON DELETE CASCADE
                                            ON UPDATE CASCADE
                    NOT NULL,
    PRIMARY KEY (
        Giudice,
        [Match]
    )
)
WITHOUT ROWID;

INSERT INTO PartecipazioneG (Giudice, "Match") VALUES (1, 1);
INSERT INTO PartecipazioneG (Giudice, "Match") VALUES (1, 2);
INSERT INTO PartecipazioneG (Giudice, "Match") VALUES (2, 1);
INSERT INTO PartecipazioneG (Giudice, "Match") VALUES (3, 1);
INSERT INTO PartecipazioneG (Giudice, "Match") VALUES (4, 1);
INSERT INTO PartecipazioneG (Giudice, "Match") VALUES (5, 1);
INSERT INTO PartecipazioneG (Giudice, "Match") VALUES (6, 1);

-- Table: Piazzamento
CREATE TABLE Piazzamento (
    Concorrente INTEGER REFERENCES Concorrente (Numero) ON DELETE RESTRICT
                                                        ON UPDATE RESTRICT
                        NOT NULL,
    Classifica  INTEGER REFERENCES Classifica (ID) ON DELETE CASCADE
                                                   ON UPDATE CASCADE
                        NOT NULL,
    Posizione   INTEGER NOT NULL,
    PRIMARY KEY (
        Concorrente,
        Classifica
    ),
    CHECK (Posizione > 0 AND 
           Posizione <= 6) 
)
WITHOUT ROWID;

INSERT INTO Piazzamento (Concorrente, Classifica, Posizione) VALUES (1, 1, 1);
INSERT INTO Piazzamento (Concorrente, Classifica, Posizione) VALUES (2, 1, 2);
INSERT INTO Piazzamento (Concorrente, Classifica, Posizione) VALUES (7, 1, 4);
INSERT INTO Piazzamento (Concorrente, Classifica, Posizione) VALUES (8, 1, 3);
INSERT INTO Piazzamento (Concorrente, Classifica, Posizione) VALUES (10, 1, 5);
INSERT INTO Piazzamento (Concorrente, Classifica, Posizione) VALUES (11, 1, 5);

-- Table: Round
CREATE TABLE Round (
    Tipologia       TEXT    PRIMARY KEY
                            NOT NULL,
    MaxPartecipanti INTEGER NOT NULL,
    MinPartecipanti INTEGER NOT NULL
)
WITHOUT ROWID;

INSERT INTO Round (Tipologia, MaxPartecipanti, MinPartecipanti) VALUES ('Finale', 6, 1);
INSERT INTO Round (Tipologia, MaxPartecipanti, MinPartecipanti) VALUES ('Ottavi', 16, 15);
INSERT INTO Round (Tipologia, MaxPartecipanti, MinPartecipanti) VALUES ('Quarti', 14, 12);
INSERT INTO Round (Tipologia, MaxPartecipanti, MinPartecipanti) VALUES ('Semifinale', 11, 7);

-- Table: ScuolaDiBallo
CREATE TABLE ScuolaDiBallo (
    ID            INTEGER PRIMARY KEY AUTOINCREMENT
                          NOT NULL,
    Nome          TEXT    NOT NULL,
    Cap           INTEGER NOT NULL,
    Via           TEXT    NOT NULL,
    NumeroCivico  INTEGER NOT NULL,
    NumBalleriniD REAL    NOT NULL
                          DEFAULT (0),
    NumBalleriniC REAL    NOT NULL
                          DEFAULT (0),
    NumBalleriniB REAL    NOT NULL
                          DEFAULT (0),
    NumBalleriniA REAL    NOT NULL
                          DEFAULT (0),
    NumBalleriniM REAL    NOT NULL
                          DEFAULT (0),
    UNIQUE (
        Cap,
        Via,
        NumeroCivico
    )
    ON CONFLICT ABORT
);

INSERT INTO ScuolaDiBallo (ID, Nome, Cap, Via, NumeroCivico, NumBalleriniD, NumBalleriniC, NumBalleriniB, NumBalleriniA, NumBalleriniM) VALUES (1, 'SalsaCrew', 42, 'Nettunense', 48, 0.0, 4.0, 0.0, 0.0, 4.0);
INSERT INTO ScuolaDiBallo (ID, Nome, Cap, Via, NumeroCivico, NumBalleriniD, NumBalleriniC, NumBalleriniB, NumBalleriniA, NumBalleriniM) VALUES (2, 'CubanFlow', 42, 'Laurentina', 78, 0.0, 0.0, 0.0, 0.0, 2.0);
INSERT INTO ScuolaDiBallo (ID, Nome, Cap, Via, NumeroCivico, NumBalleriniD, NumBalleriniC, NumBalleriniB, NumBalleriniA, NumBalleriniM) VALUES (3, 'Sentimiento y Manana', 49, 'Viale dei Volsci', 79, 0.0, 0.0, 0.0, 0.0, 4.0);
INSERT INTO ScuolaDiBallo (ID, Nome, Cap, Via, NumeroCivico, NumBalleriniD, NumBalleriniC, NumBalleriniB, NumBalleriniA, NumBalleriniM) VALUES (4, 'La Gozadera', 40, 'Via delle Pernici', 16, 0.0, 2.0, 0.0, 0.0, 0.0);

-- Table: Telefono
CREATE TABLE Telefono (
    Numero    INTEGER PRIMARY KEY
                      NOT NULL,
    Ballerino         REFERENCES Ballerino (Codice) ON DELETE CASCADE
                                                    ON UPDATE CASCADE
                      NOT NULL
)
WITHOUT ROWID;


-- Trigger: ClasseScuola
CREATE TRIGGER ClasseScuola
         AFTER INSERT
            ON Ballerino
      FOR EACH ROW
          WHEN new.Scuola IS NOT NULL
BEGIN
    UPDATE ScuolaDiBallo
       SET NumBalleriniM = NumBalleriniM + 1
     WHERE new.Scuola = ID AND 
           EXISTS (
               SELECT *
                 FROM Ballerino AS B
                WHERE new.Codice = B.Codice AND 
                      B.Classe = 'M'
           );
    UPDATE ScuolaDiBallo
       SET NumBalleriniA = NumBalleriniA + 1
     WHERE new.Scuola = ID AND 
           EXISTS (
               SELECT *
                 FROM Ballerino AS B
                WHERE new.Codice = B.Codice AND 
                      B.Classe = 'A'
           );
    UPDATE ScuolaDiBallo
       SET NumBalleriniB = NumBalleriniB + 1
     WHERE new.Scuola = ID AND 
           EXISTS (
               SELECT *
                 FROM Ballerino AS B
                WHERE new.Codice = B.Codice AND 
                      B.Classe = 'B'
           );
    UPDATE ScuolaDiBallo
       SET NumBalleriniC = NumBalleriniC + 1
     WHERE new.Scuola = ID AND 
           EXISTS (
               SELECT *
                 FROM Ballerino AS B
                WHERE new.Codice = B.Codice AND 
                      B.Classe = 'C'
           );
    UPDATE ScuolaDiBallo
       SET NumBalleriniD = NumBalleriniD + 1
     WHERE new.Scuola = ID AND 
           EXISTS (
               SELECT *
                 FROM Ballerino AS B
                WHERE new.Codice = B.Codice AND 
                      B.Classe = 'D'
           );
END;


-- Trigger: RV10-11
CREATE TRIGGER [RV10-11]
         AFTER INSERT
            ON Piazzamento
BEGIN
    SELECT RAISE(ABORT, "Un concorrente non deve avere nessun piazzamento in classifiche con classe o categoria a cui il concorrente non è iscritto.
") 
     WHERE NOT EXISTS (
                   SELECT *
                     FROM Concorrente AS C
                          JOIN
                          Piazzamento AS P ON C.Numero = new.Concorrente
                          JOIN
                          Classifica AS CL ON CL.ID = new.Classifica
                    WHERE C.Classe = CL.Classe AND 
                          C.Categoria = CL.Categoria
               );
END;


-- Trigger: RV12
CREATE TRIGGER RV12
         AFTER INSERT
            ON Piazzamento
BEGIN
    SELECT RAISE(ABORT, "Un concorrente non deve avere nessun piazzamento in classifiche con disciplina a cui il concorrente non è iscritto.
") 
     WHERE NOT EXISTS (
                   SELECT *
                     FROM Concorrente AS C
                          JOIN
                          Piazzamento AS P ON C.Numero = new.Concorrente
                          JOIN
                          Classifica AS CL ON CL.ID = new.Classifica
                    WHERE CL.Disciplina IN (
                              SELECT NomeDisciplina
                                FROM IscrizioneCoppia
                               WHERE NumeroCoppia = new.Concorrente
                          )
OR 
                          CL.Disciplina IN (
                              SELECT NomeDisciplina
                                FROM IscrizioneGruppo
                               WHERE NumeroGruppo = new.Concorrente
                          )
               );
END;


-- Trigger: RV13
CREATE TRIGGER RV13
         AFTER INSERT
            ON Coppia
BEGIN
    SELECT RAISE(ABORT, "Una coppia deve essere formata da un ballerino uomo ed una ballerina donna.") 
     WHERE NOT EXISTS (
                   SELECT *
                     FROM Ballerino AS M
                          JOIN
                          Coppia ON new.Ballerino = M.Codice
                          JOIN
                          Ballerino AS F ON new.Ballerina = F.Codice
                    WHERE M.Sesso = "Maschio" AND 
                          F.Sesso = "Femmina"
               );
END;


-- Trigger: RV2
CREATE TRIGGER RV2
         AFTER INSERT
            ON Coppia
BEGIN
    SELECT RAISE(ABORT, "La categoria dei ballerini deve essere uguale a quella della coppia.") 
     WHERE NOT EXISTS (
                   SELECT *
                     FROM Coppia AS C
                          JOIN
                          Concorrente AS Con ON new.Numero = Con.Numero,
                          Ballerino AS B1,
                          Ballerino AS B2
                    WHERE new.Ballerino = B1.Codice AND 
                          new.Ballerina = B2.Codice AND 
                          Con.Categoria = B1.Categoria AND 
                          Con.Categoria = B2.Categoria
               );
END;


-- Trigger: RV3
CREATE TRIGGER RV3
         AFTER INSERT
            ON [Match]
BEGIN
    SELECT RAISE(ABORT, "Il numero di conccorenti in un match deve essere compreso fra il numero minimo di partecipanti ed il numero massimo di partecipanti del round.") 
     WHERE NOT EXISTS (
                   SELECT *
                     FROM Round AS R
                          JOIN
                          [Match] AS M ON new.Round = R.Tipologia
                    WHERE new.NumeroConcorrenti <= R.MaxPartecipanti AND 
                          new.NumeroConcorrenti >= R.MinPartecipanti
               );
END;


-- Trigger: RV7-8
CREATE TRIGGER [RV7-8]
         AFTER INSERT
            ON PartecipazioneC
BEGIN
    SELECT RAISE(ABORT, "Un concorrente non deve partecipare a match con categoria o classe diversa dalla propria.") 
     WHERE NOT EXISTS (
                   SELECT *
                     FROM Concorrente AS C
                          JOIN
                          PartecipazioneC AS PC ON new.Concorrente = C.Numero
                          JOIN
                          [Match] AS M ON new.[Match] = M.ID
                    WHERE C.Categoria = M.Categoria AND 
                          C.Classe = M.Classe
               );
END;


-- Trigger: RV9
CREATE TRIGGER RV9
         AFTER INSERT
            ON PartecipazioneC
BEGIN
    SELECT RAISE(ABORT, "Un concorrente non deve partecipare a match con disciplina a cui il concorrente non è iscritto.
") 
     WHERE NOT EXISTS (
                   SELECT *
                     FROM Coppia AS C
                          JOIN
                          PartecipazioneC ON C.Numero = new.Concorrente
                          JOIN
                          [Match] AS M ON M.ID = new.[Match]
                    WHERE M.Disciplina IN (
                              SELECT NomeDisciplina
                                FROM IscrizioneCoppia
                               WHERE NumeroCoppia = new.Concorrente
                          )
               )
AND 
           NOT EXISTS (
                   SELECT *
                     FROM Gruppo AS G
                          JOIN
                          PartecipazioneC ON G.Numero = new.Concorrente
                          JOIN
                          [Match] AS M ON M.ID = new.[Match]
                    WHERE M.Disciplina IN (
                              SELECT NomeDisciplina
                                FROM IscrizioneGruppo
                               WHERE NumeroGruppo = new.Concorrente
                          )
               );
END;


-- Trigger: UpdateNumeroCoppie
CREATE TRIGGER UpdateNumeroCoppie
         AFTER INSERT
            ON IscrizioneCoppia
BEGIN
    UPDATE Disciplina
       SET NumeroCoppie = NumeroCoppie + 1
     WHERE new.NomeDisciplina = Nome;
END;


-- Trigger: UpdateNumeroGruppi
CREATE TRIGGER UpdateNumeroGruppi
         AFTER INSERT
            ON IscrizioneGruppo
BEGIN
    UPDATE Disciplina
       SET NumeroGruppi = NumeroGruppi + 1
     WHERE new.NomeDisciplina = Nome;
END;


-- View: Ballerini_Classe
CREATE VIEW Ballerini_Classe AS
    SELECT C.Nome AS Nome,
           count( * ) AS Num
      FROM Classe AS C
           JOIN
           Ballerino AS B ON C.Nome = B.Classe
     GROUP BY C.Nome;


-- View: Ballerini_Gruppi
CREATE VIEW Ballerini_Gruppi AS
    SELECT B.Nome,
           B.Cognome,
           count( * ) AS Num
      FROM Ballerino AS B
           JOIN
           ComposizioneG AS CG ON B.Codice = CG.Ballerino
     GROUP BY B.Codice;


-- View: Coppie
CREATE VIEW Coppie AS
    SELECT B1.Nome AS B1Nome,
           B1.Cognome AS B1Cognome,
           B1.Scuola AS B1Scuola,
           B2.Nome AS B2Nome,
           B2.Cognome AS B2Cognome,
           B2.Scuola AS B2Scuola,
           C.Numero AS Numero
      FROM Ballerino AS B1
           JOIN
           Coppia AS C ON Ballerino = B1.Codice
           JOIN
           Ballerino AS B2 ON Ballerina = B2.Codice
     GROUP BY C.Numero;


-- View: Coppie_Discipline
CREATE VIEW Coppie_Discipline AS
    SELECT C.Numero AS Numero,
           count(IC.NomeDisciplina) AS N°_Discipline
      FROM Coppia AS C
           JOIN
           IscrizioneCoppia AS IC ON C.Numero = IC.NumeroCoppia
     GROUP BY C.Numero;


-- View: Giudici_Match
CREATE VIEW Giudici_Match AS
    SELECT G.Nome AS Nome,
           G.Cognome AS Cognome,
           count( * ) AS Num
      FROM Giudice AS G
           JOIN
           PartecipazioneG AS PG ON G.Codice = PG.giudice
     GROUP BY G.Codice;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
