-- SELECT class, country FROM classes WHERE bore >= 16;  part a
-- SELECT name FROM ships WHERE launched < 1921; part b
-- SELECT ship FROM outcomes WHERE battle = 'Denmark Strait' AND result = 'sunk'; part c
-- SELECT numGuns - bore FROM classes;

-- SELECT attribute FROM csv_table WHERE attribute = condition;

-- INSERT INTO product(maker, model) VALUES('A', 1001);
-- -- THIS COMMAND REMOVES DUPLICATES (UNION)
-- SELECT maker, model FROM product WHERE type = 'pc' 
-- UNION 
-- SELECT maker,model FROM product WHERE type = 'laptop';



-- -- THIS COMMAND KEEPS DUPLICATES (UNION ALL)




-- UPDATE battles SET date = 05/24/41 WHERE name = 'Denmark Strait';


-- Number 3 on quiz 1
--SELECT class, country FROM classes WHERE bore >= 15;

-- Number 4 on quiz 1
--SELECT name AS launched_before_1918 FROM ships WHERE launched < 1918;




-- Return the maker of the most expensive PC

SELECT DISTINCT maker
FROM product
WHERE
    model IN(
              SELECT model
              FROM pc
              WHERE price = (
                              select MAX(price) 
                              from PC
                            )
     
            )

SELECT * 
FROM pc;


SELECT * 
FROM product;


SELECT *
FROM product
WHERE EXISTS (SELECT ram  
              FROM pc
              WHERE
              product.model = pc.model
              AND price < 900);



SELECT *
FROM Product P, (SELECT * FROM PC WHERE ram = (SELECT MAX(ram) FROM PC)) SQ
WHERE
P.model = SQ.model;



-- 6.3.1 a) Find the makers of PC’s with a speed of at least 3.0.

-- No subquery required
SELECT maker
FROM pc, product
WHERE 
  pc.model = product.model
  AND
  speed > 3
  ORDER BY maker ASC;

-- With subquery 1
SELECT *
FROM product
WHERE
  EXISTS (
    SELECT *
    FROM pc
    WHERE pc.model = product.model
    AND 
    speed > 3
  )
  ORDER BY maker asc;

-- With subquery 2
SELECT *
FROM product
WHERE
   model IN (
     SELECT model
     FROM pc
     WHERE speed > 3
   );
  

-- 6.3.1 b) Find the printers with the higest price.
SELECT *
FROM printer
WHERE price = (SELECT MAX(price) FROM printer);


SELECT *
FROM printer
WHERE NOT EXISTS (SELECT * FROM printer p1 WHERE p1.price < printer.price);


-- 6.3.1 c) Find the laptops whose speed is slower than that of any PC.
SELECT *
FROM laptop
WHERE EXISTS (SELECT speed 
                FROM pc
                WHERE pc.speed > laptop.speed AND 
                pc.ram > laptop.ram AND 
                pc.price > laptop.price);





SELECT *
FROM laptop, product
WHERE
  laptop.model = product.model
  GROUP BY laptop.price, product.maker;

 SELECT *
FROM laptop, product
WHERE
  laptop.model = product.model;