CREATE TABLE School (
    schoolID int NOT NULL,
    schoolName VARCHAR(50) NOT NULL,
    schoolAddress VARCHAR(200) NOT NULL,
    contactName VARCHAR(50) NOT NULL,
    contactNumber VARCHAR(15),
    contactEmail VARCHAR(50) NOT NULL,
    PRIMARY KEY (schoolID)
);

INSERT INTO School VALUES
    (1, 'Hierojakoulu 1', 'Hierojakoulunkatu 1', 'Harri Hieroja', '050545445', 'harri@hieroja.fi'),
    (2, 'Hierontakoulu', 'Hierontakatu 2', 'Heidi Hieroja', '050454545', 'heidi@hieronta.fi'),
    (3, 'Pirkanmaan urheiluhierojakoulu', 'Kuninkaankatu 21, 4. krs, 33210 Tampere', 'Antony Benjamin', '0505344398', 'antony_benjamin@hotmail.com'),
    (4, 'Hieromiskoulu', 'Hieromiskatu 4', 'Henri Hieroja', '0404343443', 'henri@massage.fi'),
    (5, 'Lihaleipomo', 'Hierontakouluntie 10', 'Hermanni Hieroja', '05001112233', 'hermanni@domain.fi');

CREATE TABLE Degree_Part (
    partID int NOT NULL,
    partName VARCHAR(255) NOT NULL,
    partOSP CHAR(6) NOT NULL,
    PRIMARY KEY (partID)
);

INSERT INTO Degree_Part VALUES
    ('201040', 'Tuki- ja liikuntaelinongelmaisen potilaan terveyden ja toimintakyvyn edistäminen', 70),
    ('201455', 'Sosiaali- ja terveydenhuoltoalan yrittäjänä toimiminen', 30),
    ('201456', 'Elimistön nestekierron ylläpitäminen ja edistäminen', 25),
    ('201041', 'Ikääntyvän potilaan hieronta', 25),
    ('201042', 'Kansansairauksien ennaltaehkäiseminen hierojan työssä', 25),
    ('201457', 'Raajanivelten liikkuvuuden edistäminen', 25);

CREATE TABLE Assessor (
    assessorID int NOT NULL,
    Name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(15) NOT NULL,
    PRIMARY KEY (assessorID)
);

INSERT INTO Assessor VALUES
    (1, 'Antony Benjamin', 'antony_benjamin@hotmail.com', '0505344398'),
    (2, 'Auli Arvioija', 'auli@domain.com', '0509999999'),
    (3, 'Anssi Arvioija', 'anssi@domain.com', '0508888888'),
    (4, 'Anni Arvioitsija', 'anni@domain.com', '0507777777'),
    (5, 'Antti Arvioitsija', 'antti@domain.com', '0506666666');

CREATE TABLE Student (
    studentID int NOT NULL,
    schoolID int,
    fName VARCHAR(30) NOT NULL,
    lName VARCHAR(30) NOT NULL,
    phoneNumber VARCHAR(15) NOT NULL,
    email VARCHAR(30) NOT NULL,
    PRIMARY KEY (StudentID),
    FOREIGN KEY (schoolID) REFERENCES School (schoolID)
);

INSERT INTO Student VALUES
    (1, 3, 'Ville', 'Voide', '0500123456', 'ville@domain.com'),
    (2, 2, 'Henkka', 'Hierovainen', '0401234567', 'henkka@domain.com'),
    (3, 2, 'Raili', 'Rasvanen', '0400123456', 'mika@domain.com'),
    (4, 1, 'Helena', 'Hierre', '0407654321', 'helena@domain.com'),
    (5, NULL, 'Ilkka', 'Itsenäinen', '0412345678', 'ilkka@ite.fi');

CREATE TABLE Examination (
    examID int NOT NULL,
    studentID int NOT NULL,
    partID int NOT NULL,
    assessorID int NOT NULL,
    examLocation VARCHAR(50) NOT NULL,
    startDate DATETIME NOT NULL,
    endDate DATE NOT NULL,
    passFail CHAR(4) NOT NULL,
    PRIMARY KEY (examID, studentID, partID),
    FOREIGN KEY (studentID) REFERENCES Student (studentID),
    FOREIGN KEY (partID) REFERENCES Degree_Part (partID),
    FOREIGN KEY (assessorID) REFERENCES Assessor (assessorID)
);

INSERT INTO Examination VALUES
    (1, 1, 201040, 1, 'Tampere', '2020-09-09 10:00:00', '2020-09-11', 'Pass'),
    (1, 2, 201040, 1, 'Tampere', '2020-09-09 10:00:00', '2020-09-11', 'Pass'),
    (1, 3, 201041, 1, 'Tampere', '2020-09-09 10:00:00', '2020-09-11', 'Fail'),
    (1, 4, 201041, 1, 'Tampere', '2020-09-09 10:00:00', '2020-09-11', 'Pass'),
    (1, 5, 201040, 1, 'Tampere', '2020-09-09 10:00:00', '2020-09-11', 'Pass'),
    (2, 1, 201042, 2, 'Turku', '2020-09-14 08:30:00', '2020-09-16', 'Pass'),
    (2, 2, 201042, 2, 'Turku', '2020-09-14 08:30:00', '2020-09-16', 'Pass'),
    (2, 1, 201457, 2, 'Turku', '2020-09-14 08:30:00', '2020-09-16', 'Fail'),
    (2, 4, 201457, 3, 'Turku', '2020-09-14 08:30:00', '2020-09-16', 'Fail'),
    (2, 5, 201457, 3, 'Turku', '2020-09-09 08:30:00', '2020-09-11', 'Fail');