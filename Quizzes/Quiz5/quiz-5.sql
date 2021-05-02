PRAGMA foreign_keys = ON;

DROP TABLE Classes;
DROP TABLE Ships;
DROP TABLE Battles;
DROP TABLE Outcomes;

CREATE TABLE Classes (
    class CHAR(30) PRIMARY KEY,
    type CHAR(2),
    country CHAR(30) NOT NULL,
    numGuns DECIMAL(3,0),
    bore DECIMAL(3,0),
    displacement DECIMAL(6,0),
    CHECK (type IN ('bb','bc'))
);

CREATE TABLE Ships (
    name CHAR (30) PRIMARY KEY, 
    class CHAR (30) REFERENCES Classes(class) ON DELETE CASCADE NOT NULL,
    launched DECIMAL(4,0)
);

CREATE TABLE Battles (
    name CHAR(30) PRIMARY KEY,
    date date
);

CREATE TABLE Outcomes (
    ship CHAR(30) REFERENCES Ships(name) ON DELETE SET NULL,
    battle CHAR(30) REFERENCES Battles(name) ON UPDATE CASCADE ON DELETE CASCADE,
    result CHAR(30),
    CHECK (result IN ('ok', 'sunk','damaged'))
);


-- -- Test cases for bullet points 1, 2, 3 (Classes constraints):
--     INSERT INTO Classes VALUES ('Bismarck', 'bb', 'Germany', 8, 15, 42000);
--     INSERT INTO Classes VALUES ('Iowa', 'bd', 'USA', 9, 16, 43000);
--     INSERT INTO Classes(class, type, numGuns, bore, displacement) VALUES ('Kongo', 'bb', 10, 17, 44000);

-- -- Test cases for bullet points 4, 8:
--     INSERT INTO Ships VALUES ('California', 'Tennessee', 1915);
--     INSERT INTO Outcomes VALUES('Something', 'STUPID', 'ok');
--     INSERT INTO Outcomes VALUES('Somethiing', 'STUUPID', 'lol');




-- Perform the following operations on the relational schema in the exact order given below:

-- 1. 
    -- Classes
    INSERT INTO Classes VALUES('Bismarck', 'bb', 'Germany', 8, 15, 42000);
    INSERT INTO Classes VALUES('Iowa', 'bb', 'USA', 9, 16, 46000);
    INSERT INTO Classes VALUES('Kongo', 'bc', 'Japan', 8, 14, 32000);
    INSERT INTO Classes VALUES('North Carolina', 'bb', 'USA', 9, 16, 37000);
    INSERT INTO Classes VALUES('Renown', 'bc', 'Britain', 6, 15, 32000);
    INSERT INTO Classes VALUES('Revenge', 'bb', 'Britain', 8, 15, 29000);
    INSERT INTO Classes VALUES('Tennessee', 'bb', 'USA', 12, 14, 32000);
    INSERT INTO Classes VALUES('Yamato', 'bb', 'Japan', 9, 18, 65000);

    -- Ships
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

    -- Battles
    INSERT INTO Battles VALUES('Denmark Strait', '05/24/41');
    INSERT INTO Battles VALUES('Guadalcanal', '11/15/42');
    INSERT INTO Battles VALUES('North Cape', '12/26/43');
    INSERT INTO Battles VALUES('Surigao Strait', '10/25/44');

    -- Outcomes
    INSERT INTO Outcomes VALUES('California','Surigao Strait','ok');
    INSERT INTO Outcomes VALUES('Kirishima','Guadalcanal','sunk');
    INSERT INTO Outcomes VALUES('Resolution','Denmark Strait','ok');
    INSERT INTO Outcomes VALUES('Wisconsin','Guadalcanal','damaged');
    INSERT INTO Outcomes VALUES('Tennessee','Surigao Strait','ok');
    INSERT INTO Outcomes VALUES('Washington','Guadalcanal','ok');
    INSERT INTO Outcomes VALUES('New Jersey','Surigao Strait','ok');
    INSERT INTO Outcomes VALUES('Yamato','Surigao Strait','sunk');
    INSERT INTO Outcomes VALUES('Wisconsin','Surigao Strait','damaged');

-- 2. 
    DELETE FROM Classes WHERE displacement > 50000 OR numGuns > 10;

-- 3
    INSERT INTO Classes VALUES('Missouri','bb', 'USA', 9, 16, 46000);
    UPDATE Ships SET class = 'Missouri' WHERE name = 'Missouri';

    INSERT INTO Classes VALUES('New Jersey','bb', 'USA', 9, 16, 46000);
    UPDATE Ships SET class = 'New Jersey' WHERE name = 'New Jersey';

    INSERT INTO Classes VALUES('Wisconsin','bb', 'USA', 9, 16, 46000);
    UPDATE Ships SET class = 'Wisconsin' WHERE name = 'Wisconsin';

    INSERT INTO Classes VALUES('Washington','bb', 'USA', 9, 16, 37000);
    UPDATE Ships SET class = 'Washington' WHERE name = 'Washington';

-- 4.
    DELETE FROM Battles WHERE name = 'North Cape';

-- 5.
    UPDATE Outcomes SET battle = 'North Cape' WHERE battle = 'Guadalcanal';


-- 6.
    UPDATE Battles SET name = 'Strait of Surigao' WHERE name = 'Surigao Strait';

-- 7.
    DELETE FROM Ships WHERE class IN (SELECT class FROM Ships GROUP BY class HAVING COUNT(name) > 4);

-- 8.
    SELECT * FROM Ships;

-- 9.
    SELECT * FROM Outcomes;




-- -- NUMBER 3 Warm UP!
-- SELECT * FROM Ships
-- WHERE class = 'Iowa' OR class = 'North Carolina' OR class = 'Tennessee';

-- SELECT * FROM Ships
-- WHERE class = 'North Carolina' AND name <> class
-- UNION 
-- SELECT * FROM Ships
-- WHERE class = 'Iowa' AND name <> class
-- UNION 
-- SELECT * FROM Ships
-- WHERE class = 'Tennessee' AND name <> class;






