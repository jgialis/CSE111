PRAGMA foreign_keys = ON;

DROP TABLE Outcomes;
DROP TABLE Ships;
DROP TABLE Classes;
DROP TABLE Battles;


CREATE TABLE Classes(
    class CHAR(30) PRIMARY KEY,
    type CHAR(10),
    country CHAR(30) NOT NULL,
    numGuns DECIMAL(9, 4),
    bore DECIMAL (9, 4),
    displacement DECIMAL(9,4),
    CHECK (type IN ('bb','bc'))
);


CREATE TABLE Ships(
    name CHAR (20) PRIMARY KEY,
    class CHAR (20) REFERENCES Classes(class) ON DELETE CASCADE NOT NULL,
    launched DECIMAL(9,4)
);


CREATE TABLE Outcomes(
    ship CHAR(30) REFERENCES Ships(name), 
    battle CHAR(30),
    result CHAR(30), CHECK (result IN ('ok', 'sunk', 'damaged'))
);


CREATE TABLE Battles(name CHAR(20) PRIMARY KEY,
 date CHAR(40));


    -- BATTLES INSERTIONS
    INSERT INTO Battles VALUES('Denmark Strait', '05/24/41');
    INSERT INTO Battles VALUES('Guadalcanal', '11/15/42');
    INSERT INTO Battles VALUES('North Cape', '12/26/43');
    INSERT INTO Battles VALUES('Surigao Strait', '10/25/44');


    -- CLASSES INSERTIONS
    INSERT INTO Classes VALUES('Bismarck', 'bb', 'Germany', 8, 15, 42000);
    INSERT INTO Classes VALUES('Iowa', 'bb', 'USA', 9, 16, 46000);
    INSERT INTO Classes VALUES('Kongo', 'bc', 'Japan', 8, 14, 32000);
    INSERT INTO Classes VALUES('North Carolina', 'bb', 'USA', 9, 16, 37000);
    INSERT INTO Classes VALUES('Renown', 'bc', 'Britain', 6, 15, 32000);
    INSERT INTO Classes VALUES('Revenge', 'bb', 'Britain', 8, 15, 29000);
    INSERT INTO Classes VALUES('Tennessee', 'bb', 'USA', 12, 14, 32000);
    INSERT INTO Classes VALUES('Yamato', 'bb', 'Japan', 9, 18, 65000);


    -- OUTCOMES INSERTIONS
    INSERT INTO Outcomes VALUES('California','Surigao Strait','ok');
    INSERT INTO Outcomes VALUES('Kirishima','Guadalcanal','sunk');
    INSERT INTO Outcomes VALUES('Resolution','Denmark Strait','ok');
    INSERT INTO Outcomes VALUES('Wisconsin','Guadalcanal','damaged');
    INSERT INTO Outcomes VALUES('Tennessee','Surigao Strait','ok');
    INSERT INTO Outcomes VALUES('Washington','Guadalcanal','ok');
    INSERT INTO Outcomes VALUES('New Jersey','Surigao Strait','ok');
    INSERT INTO Outcomes VALUES('Yamato','Surigao Strait','sunk');
    INSERT INTO Outcomes VALUES('Wisconsin','Surigao Strait','damaged');


    -- SHIPS INSERTIONS
    INSERT INTO Ships VALUES('California', 'Tennessee', 1915);
    INSERT INTO Ships VALUES('Haruna', 'Kongo', 1915);
    INSERT INTO Ships VALUES('Hiei', 'Kongo', 1915);
    INSERT INTO Ships VALUES('Iowa', 'Iowa', 1933);
    INSERT INTO Ships VALUES('Kirishima', 'Kongo', 1915);
    INSERT INTO Ships VALUES('Kongo', 'Kongo', 1913);
    INSERT INTO Ships VALUES('Missouri', 'Iowa', 1935);
    INSERT INTO Ships VALUES('Musashi', 'Yamato', 1942);
    INSERT INTO Ships VALUES('New Jersey', 'Iowa', 1936);
    INSERT INTO Ships VALUES('North Carolina', 'North Carolina', 1941);
    INSERT INTO Ships VALUES('Ramillies', 'Revenge', 1917);
    INSERT INTO Ships VALUES('Renown', 'Renown', 1916);
    INSERT INTO Ships VALUES('Repulse', 'Renown', 1916);
    INSERT INTO Ships VALUES('Resolution', 'Revenge', 1916);
    INSERT INTO Ships VALUES('Revenge', 'Revenge', 1916);
    INSERT INTO Ships VALUES('Royal Oak', 'Revenge', 1916);
    INSERT INTO Ships VALUES('Royal Sovereign', 'Revenge', 1916);
    INSERT INTO Ships VALUES('Tennessee', 'Tennessee', 1915);
    INSERT INTO Ships VALUES('Washington', 'North Carolina', 1941);
    INSERT INTO Ships VALUES('Wisconsin', 'Iowa', 1940);
    INSERT INTO Ships VALUES('Yamato', 'Yamato', 1941);

-- Delete all the Classes with a displacement larger than 50,000
-- or with numGuns larger than 10.
    DELETE FROM Classes WHERE displacement >50000 OR numGuns >10;













