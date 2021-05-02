/*
    4. How many customers and suppliers 
    are in every country from EUROPE?
*/


    
SELECT 
    nation.n_name, 
    COUNT(c_custkey) AS custKeyCount,
    SQ.suppKeyCount
FROM 
    customer, 
    region, 
    nation,
    (
        SELECT 
            n_name, 
            COUNT(s_suppkey) AS suppKeyCount
        FROM 
            supplier, 
            region, 
            nation
        WHERE
            s_nationkey = n_nationkey AND
            r_regionkey = n_regionkey AND
            r_name = 'EUROPE'
            GROUP BY n_name 
    ) SQ
WHERE
    c_nationkey = n_nationkey AND
    r_regionkey = n_regionkey AND
    SQ.n_name = nation.n_name AND
    r_name = 'EUROPE'
    GROUP BY nation.n_name;





    






-- SELECT 
--     n_name, 
--     COUNT(c_custkey),
--     suppKeyCount
-- FROM 
--     customer, 
--     region, 
--     nation,
--         (
--         SELECT 
--             COUNT(s_suppkey) AS suppKeyCount
--         FROM 
--             supplier
--         ) SQ
-- WHERE
--     c_nationkey = n_nationkey AND
--     r_regionkey = n_regionkey AND
--     r_name = 'EUROPE'
--     GROUP BY n_name;







------------------------------------------------------

------------------------------------------------------

------------------------------------------------------

------------------------------------------------------

------------------------------------------------------

------------------------------------------------------
--          Long Solution using UNION       --

-- SELECT 
--     n_name, 
--     COUNT(c_custkey),
--     suppKeyCount
-- FROM 
--     customer, 
--     region, 
--     nation,
--         (
--         SELECT 
--             COUNT(s_suppkey) AS suppKeyCount
--         FROM 
--             supplier, nation, region
--         WHERE
--             s_nationkey = n_nationkey AND
--             r_regionkey = n_regionkey AND
--             n_name = 'FRANCE'
--         ) SQ
-- WHERE
--     c_nationkey = n_nationkey AND
--     r_regionkey = n_regionkey AND
--     n_name = 'FRANCE'
--     GROUP BY n_name


-- UNION




-- SELECT 
--     n_name, 
--     COUNT(c_custkey),
--     suppKeyCount
-- FROM 
--     customer, 
--     region, 
--     nation,
--         (
--         SELECT 
--             COUNT(s_suppkey) AS suppKeyCount
--         FROM 
--             supplier, nation, region
--         WHERE
--             s_nationkey = n_nationkey AND
--             r_regionkey = n_regionkey AND
--             n_name = 'GERMANY'
--         ) SQ
-- WHERE
--     c_nationkey = n_nationkey AND
--     r_regionkey = n_regionkey AND
--     n_name = 'GERMANY'
--     GROUP BY n_name

--     UNION


--     SELECT 
--     n_name, 
--     COUNT(c_custkey),
--     suppKeyCount
-- FROM 
--     customer, 
--     region, 
--     nation,
--         (
--         SELECT 
--             COUNT(s_suppkey) AS suppKeyCount
--         FROM 
--             supplier, nation, region
--         WHERE
--             s_nationkey = n_nationkey AND
--             r_regionkey = n_regionkey AND
--             n_name = 'ROMANIA'
--         ) SQ
-- WHERE
--     c_nationkey = n_nationkey AND
--     r_regionkey = n_regionkey AND
--     n_name = 'ROMANIA'
--     GROUP BY n_name

--     UNION

--     SELECT 
--     n_name, 
--     COUNT(c_custkey),
--     suppKeyCount
-- FROM 
--     customer, 
--     region, 
--     nation,
--         (
--         SELECT 
--             COUNT(s_suppkey) AS suppKeyCount
--         FROM 
--             supplier, nation, region
--         WHERE
--             s_nationkey = n_nationkey AND
--             r_regionkey = n_regionkey AND
--             n_name = 'RUSSIA'
--         ) SQ
-- WHERE
--     c_nationkey = n_nationkey AND
--     r_regionkey = n_regionkey AND
--     n_name = 'RUSSIA'
--     GROUP BY n_name


--     UNION

--     SELECT 
--     n_name, 
--     COUNT(c_custkey),
--     suppKeyCount
-- FROM 
--     customer, 
--     region, 
--     nation,
--         (
--         SELECT 
--             COUNT(s_suppkey) AS suppKeyCount
--         FROM 
--             supplier, nation, region
--         WHERE
--             s_nationkey = n_nationkey AND
--             r_regionkey = n_regionkey AND
--             n_name = 'UNITED KINGDOM'
--         ) SQ
-- WHERE
--     c_nationkey = n_nationkey AND
--     r_regionkey = n_regionkey AND
--     n_name = 'UNITED KINGDOM'
--     GROUP BY n_name;