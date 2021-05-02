/*
    4. How many parts with size below 30 does
    every supplier from CHINA offer? Print the 
    name of thesupplier and the number of parts.
*/


SELECT s_name, COUNT(p_size)
FROM part, partsupp, supplier
WHERE 
    p_size < 30
    AND
    ps_partkey = p_partkey
    AND
    ps_suppkey = s_suppkey
    AND
    s_nationkey = 18
    GROUP BY s_name;