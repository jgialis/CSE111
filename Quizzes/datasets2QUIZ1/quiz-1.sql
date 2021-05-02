/*
    3.Find the class name and the country of the 
    classes that carry guns of at least 15-inch bore.
*/
SELECT class, country FROM Classes WHERE bore >= 15;


/*
    4. Find the ships launched prior to 1918. 
*/
SELECT name FROM Ships WHERE launched < 1918;


/*
    5. Find the ships sunk in the battle of Surigao Strait.
*/
SELECT ship FROM Outcomes WHERE result = 'sunk' AND battle = 'Surigao Strait';


/*
    6. List the ships with a displacement larger than 40,000 tons built after 1921.
*/
SELECT Classes.class AS name 
FROM 
    Classes, Ships WHERE Classes.class = Ships.name 
    AND displacement > 40000 
    AND Ships.launched > 1921 
    GROUP BY name;


/*
    7. List the name, displacement, and number of guns 
    of the ships engaged in the battle of Surigao Strait.
*/
-- SELECT name, displacement, numGuns 
--     FROM Classes, Ships, Outcomes 
--     WHERE 
--         Classes.class = Ships.class 
--           AND 
--         name = ship -- WISCONSIN & NEW JERSEY
--             AND 
--      battle = 'Denmark Strait'
SELECT name, displacement, numguns
FROM 
	(SELECT * FROM  
		(SELECT ship AS name, battle, result FROM Outcomes) 
			NATURAL JOIN  
		Ships
			NATURAL JOIN
		Classes)
WHERE battle = 'Surigao Strait';



/*
    8. List the name of all the ships from the  
    database. Ships appear in Ships, Classes, and Outcomes tables.
    All of them have to be printed.
*/
SELECT name AS shipname
FROM Ships 
	UNION 
SELECT ship AS shipname
FROM Outcomes;


/*
   9. Find the classes that have exactly two ships in the class.
*/
SELECT class FROM Ships GROUP BY class HAVING COUNT(name) = 2;

/*
    10. Find the countries that have both bb and bc ships.
*/
SELECT country FROM Classes WHERE type = 'bc'
INTERSECT
SELECT country FROM Classes WHERE type = 'bb';


/*
    11. Find the ships that survived a battle in which 
    they were damaged and then fought in another battle.
*/


SELECT DISTINCT ship FROM Outcomes WHERE result = 'damaged';

