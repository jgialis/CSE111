

    SELECT maker, type, min AS minPrice, max AS maxPrice
    FROM (
        SELECT maker, Product.type AS type, MIN(price) AS min, MAX(price) AS max
        FROM  Product, PC
        WHERE
            Product.model = PC.model AND
            maker = 'A' AND
            Product.type = 'pc'

            UNION ALL

        SELECT maker, Product.type AS type, MIN(price) AS min, MAX(price) AS max
        FROM  Product, Laptop
        WHERE
            Product.model = Laptop.model AND
            maker = 'A' AND
            Product.type = 'laptop'

            UNION ALL

        SELECT maker, Product.type AS type, MIN(price) AS min, MAX(price) AS max
        FROM  Product, Printer
        WHERE
            Product.model = Printer.model AND
            maker = 'A' AND
            Product.type = 'printer'
            ORDER BY maker, type ASC)
        




        

SELECT * FROM master;

DROP VIEW master;

SELECT * 
FROM PriceRange
ORDER BY maker, type ASC;

SELECT * FROM Makers_minMax_type;
DELETE FROM PC WHERE model = 1101;

 
SELECT maker, P.model, speed, ram, hd, price
FROM Product P, PC
WHERE P.model = PC.model;

-- Dunnno which indexes to build? 
--   Use .expert for some recommendations

--SQLITE Commands
.eqp on
.timer on
-- .output out.res.noindex -- To a no index file
.output out.res.index -- To a index file.
----------------------

-- You can check if index is created by .index SQLITE command
.print "CREATING AN INDEX ind_"
CREATE INDEX some_index_name
ON Product(type)

.print "FULL TABLE QUERY"
SELECT *
FROM product;


CREATE VIEW PC_Maker(maker, model, speed, ram, hd, price) AS 
SELECT maker, P.model, speed, ram, hd, price
FROM Product P, PC
WHERE P.model = PC.model

SELECT * FROM PC_Maker;
SELECT maker, P.model, speed, ram, hd, price
FROM Product P, PC
WHERE P.model = PC.model;







UPDATE Printer SET price = 999 WHERE model = 3005;

DELETE FROM Laptop WHERE model = 2001;





DELETE FROM PriceRange;
INSERT INTO PC(model, speed, ram, hd, price) VALUES(1017, 9000, 900, 90, 99);
INSERT INTO PRODUCT(maker, model, type) VALUES('C',1017, 'pc');
INSERT INTO PriceRange 
SELECT maker, Product.type AS type, MIN(price) AS min, MAX(price) AS max
        FROM  Product, PC
        WHERE
            Product.model = PC.model AND
            maker = 'C'
            ORDER BY maker, type ASC 
WHERE Product.model = 1017;





SELECT *
FROM PriceRange
ORDER BY maker, type ASC;
