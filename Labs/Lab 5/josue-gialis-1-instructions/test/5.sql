/*
    5. For parts whom type contains STEEL, return the 
    name of the supplier from AMERICA that can supply
    them at minimum cost (ps supplycost), for every
    part size. Print the supplier name together with
    the part size and the minimum cost.
*/

-- Parts that contain steel
-- SELECT *
-- FROM part
-- WHERE p_type LIKE '%STEEL%';


-- -- Suppliers from AMERICA
-- SELECT * 
-- FROM supplier, nation, region
-- WHERE s_nationkey = n_nationkey AND
--       n_regionkey = r_regionkey AND
--       r_regionkey = 1;

-- Combining Suppliers from AMERICA that supply parts that contain STEEL
SELECT AmericanSuppliers.s_name, SteelParts.p_size, MIN(ps_supplycost)
FROM partsupp,
    (
        SELECT * 
        FROM supplier, nation, region
        WHERE s_nationkey = n_nationkey AND
            n_regionkey = r_regionkey AND
            r_regionkey = 1
    ) AmericanSuppliers,
    (
        SELECT *
        FROM part
        WHERE p_type LIKE '%STEEL%'
    ) SteelParts
WHERE
    ps_suppkey = AmericanSuppliers.s_suppkey AND
    ps_partkey = SteelParts.p_partkey AND
    ps_supplycost = (SELECT MIN(ps_supplycost) FROM partsupp WHERE ps_suppkey = AmericanSuppliers.s_suppkey AND
    ps_partkey = SteelParts.p_partkey )
    GROUP BY SteelParts.p_size;