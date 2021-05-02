SELECT name, displacement, numGuns
FROM Classes C, Ships S, Outcomes
WHERE
    C.class = S.class AND
    battle = 'Surigao Strait' AND
    ship = name;


SELECT C.class AS class,	type,	country,	numGuns,	bore,	displacement,	name,		launched
FROM Classes C, Ships S
WHERE
    C.class = S.class
    AND
    displacement > 40000
    AND
    launched > 1921;


SELECT *
FROM Outcomes,      
     Ships NATURAL JOIN Classes
WHERE 
    name = ship;
    
SELECT name, displacement, numGuns
FROM Outcomes,      
     Ships NATURAL JOIN Classes
WHERE 
    name = ship
    AND
    battle = 'Surigao Strait';


  SELECT *
  FROM Classes 
  WHERE
  type = 'bb'
UNION
  SELECT *
  FROM Classes 
  WHERE
  type = 'bc';


  SELECT country FROM Classes WHERE type = 'bc'
INTERSECT
SELECT country FROM Classes WHERE type = 'bb';




SELECT ship
FROM Outcomes
WHERE result = 'damaged'
INTERSECT
SELECT ship
FROM Outcomes;





SELECT ship
FROM Outcomes
INTERSECT
SELECT ship
FROM Outcomes
WHERE
result = 'sunk';
