-- -- 1. What makers produce Printers?
-- SELECT DISTINCT maker
-- FROM Product
-- WHERE type = 'printer';

-- -- 2. What makers produce color Printers cheaper than $200?
-- SELECT maker
-- FROM Product, Printer
-- WHERE 
--     Product.model = Printer.model AND
--     Printer.color = 1 AND
--     Printer.price < 200;

-- -- 3. What makers produce PCs, Laptops, and Printers?
-- SELECT maker
-- FROM Product
-- WHERE type = 'pc'
--     INTERSECT
-- SELECT maker
-- FROM Product
-- WHERE type = 'laptop'
--     INTERSECT
-- SELECT maker
-- FROM Product
-- WHERE type = 'printer';

-- -- 4. What makers produce PCs and Printers but do not produce Laptops?
-- SELECT maker
-- FROM Product
-- WHERE type = 'pc'
--     INTERSECT
-- SELECT maker
-- FROM Product
-- WHERE type = 'printer'
--     EXCEPT
-- SELECT maker
-- FROM Product
-- WHERE type = 'laptop';


-- -- 5. For every maker that sells both PCs and Laptops, 
-- -- find the combination of PC and Laptop that has
-- -- minimum price. 

-- -- Print the maker, the PC model, 
-- -- Laptop model, and the combination price (PC price
-- -- + Laptop price).



-- -- Returns makers and models for laptops and PCs 
-- SELECT SQ.maker, P.model AS P_model, P.price
-- FROM
--     (
--         SELECT * FROM Product WHERE type = 'pc' AND
--         maker IN ( SELECT maker FROM Product WHERE type = 'laptop')
--         UNION ALL
--         SELECT * FROM Product WHERE type = 'laptop' AND
--         maker IN ( SELECT maker FROM Product WHERE type = 'pc')
--     ) SQ,
--     PC P
-- WHERE
--     P.model = SQ.model
-- UNION ALL
-- SELECT SQ.maker, L.model AS L_model, L.price
-- FROM
--     (
--         SELECT * FROM Product WHERE type = 'pc' AND
--         maker IN ( SELECT maker FROM Product WHERE type = 'laptop')
--         UNION ALL
--         SELECT * FROM Product WHERE type = 'laptop' AND
--         maker IN ( SELECT maker FROM Product WHERE type = 'pc')
--     ) SQ,
--     Laptop L
-- WHERE
--     L.model = SQ.model;
    
   

-- -- 6. What is the average price of a Printer?
-- SELECT AVG(price) AS Average_Printer_Price
-- FROM printer;


-- -- 7. How many models of each different type of Printers are offered?
-- SELECT 
--     type, 
--     COUNT(model)
-- FROM Printer
-- GROUP BY type; 

-- -- 8. How many models of laser color Printers are available?
-- SELECT COUNT(model)
-- FROM Printer
-- WHERE 
--     type = 'laser' AND
--     color = 1;

-- -- 9 (COMEBACK). How many makers produce at least 2 different types (not models) of Printers?
-- SELECT DISTINCT COUNT(DISTINCT maker)
-- FROM 
--     Printer, 
--     Product
-- WHERE   
--     Printer.model = Product.model
--     GROUP BY Printer.type
--     HAVING COUNT(Printer.type) >= 2;

 
-- -- 10. For every Laptop screen size, find the minimum 
-- --     price of Laptops having that screen size.
-- SELECT screen, MIN(price)
-- FROM Laptop
-- GROUP BY screen;

-- -- 11. What Laptop screen sizes are offered 
-- --     in at least 3 different models?
-- SELECT screen
-- FROM Laptop
-- GROUP BY screen
-- HAVING COUNT(model) >= 3;

-- -- 12. What Laptop screen sizes are offered with at least 2 different speeds?
-- SELECT screen
-- FROM Laptop
-- GROUP BY screen
-- HAVING COUNT(speed) >= 2;

-- -- 13. What Laptops are more expensive than any PC? Print the model and the price.
-- SELECT model, price
-- FROM Laptop
-- WHERE EXISTS
--             (
--                 SELECT *
--                 FROM PC
--                 WHERE Laptop.Price > PC.Price
--             );

-- -- 14. What Printers produced by the maker of the most expensive 
-- -- PC that also produces Printers are the
-- -- cheapest? Print the model and the price.
-- SELECT 
--     maker, 
--     Printer.model, 
--     Printer.price
-- FROM 
--     Product, 
--     Printer
-- WHERE 
--     Printer.model = Product.model AND
--     price = (SELECT MIN(price) FROM printer) AND 
--     maker IN 
--             (
--             SELECT maker 
--             FROM 
--                 (
--                     SELECT 
--                         maker, 
--                         MAX(price)
--                     FROM 
--                         Product, 
--                         PC
--                     WHERE
--                         maker IN 
--                                 (
--                                     SELECT maker 
--                                     FROM Product
--                                     WHERE Product.type = 'printer'
--                                 ) 
--                         AND
--                     Product.model = PC.model
--                 )
--             )



-- -- 15. Find the average price for each product 
-- --     category (PC, Laptop, Printer) for every maker 
-- --     having products in all the categories.
-- SELECT Product.type, AVG(price)
-- FROM Printer, Product
-- WHERE Product.type = 'printer' AND 
-- Printer.model IN (3001, 3002, 3003)
-- UNION
-- SELECT Product.type, AVG(price)
-- FROM Laptop, Product
-- WHERE Product.type = 'laptop' AND
-- Laptop.model IN (2001, 2002, 2003)
-- UNION
-- SELECT Product.type, AVG(price)
-- FROM PC,Product
-- WHERE Product.type = 'pc' AND 
-- PC.model IN (1011, 1012, 1013);



-- -- 16. What makers produce exactly a single Laptop model?
-- SELECT maker
-- FROM 
--     Laptop L, 
--     Product P
-- WHERE 
--     L.model = P.model
-- GROUP BY maker
-- HAVING COUNT(L.model) = 1;

-- -- 17. What makers do not produce any Laptop model?
-- SELECT DISTINCT maker
-- FROM Product
-- WHERE type = 'pc' OR type = 'printer'
-- EXCEPT
-- SELECT DISTINCT maker
-- FROM Product
-- WHERE type = 'laptop';

-- -- 18. What makers produce a single Laptop model and exactly 3 PC models?
-- SELECT maker
-- FROM Product
-- WHERE type = 'pc' AND
-- maker in 
--         (
--             SELECT maker
--             FROM Product
--             WHERE type = 'laptop'
--             GROUP BY maker
--             HAVING COUNT(model) = 1
--         )
-- GROUP BY maker
-- HAVING COUNT(model) = 3;



    
    
-- -- 19. What makers produce at least a PC or Laptop model and at most 3 Printer models?
-- SELECT maker
-- FROM Product
-- WHERE 
--     type = 'pc' OR 
--     type = 'laptop'
--     INTERSECT
-- SELECT maker
-- FROM Product
-- WHERE type = 'printer'
-- GROUP BY maker
-- HAVING COUNT(model) <= 3;

-- -- 20. List the Laptops with screen size 15 or larger and speed less than 2 made by a maker that also makes
-- -- printers. Print the laptop model, the screen, the speed, and the maker.
-- SELECT 
--     L.model, 
--     screen, 
--     speed, 
--     maker
-- FROM 
--     Laptop L, 
--     Product P
-- WHERE
--     L.model = P.model AND
--     screen > 15 AND
--     speed < 2 AND
--     maker IN 
--             (
--                 SELECT maker
--                 FROM Product
--                 WHERE type = 'printer'
--             );






DELETE Laptop 2001;