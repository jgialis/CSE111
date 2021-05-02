CREATE TABLE Classes (
    class char(40) PRIMARY KEY,
    type char(40), 
    country char(40), 
    numGuns decimal(8,4), 
    bore decimal(8,4), 
    displacement decimal(8,4)
);

CREATE TABLE Ships (
    name char(40) PRIMARY KEY,
    class char(40),
    launched decimal(8,4)
);


CREATE TABLE Battles (
    name char(40) PRIMARY KEY,
    date DATE
);


CREATE TABLE Outcomes (
    ship char(40),
    battle char(40),
    result char(10)
);



DROP TABLE outcomes;
DROP TABLE ships;
DROP TABLE battles;
DROP TABLE classes;