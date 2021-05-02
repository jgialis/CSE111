/*
    11. Find the nation(s) with the largest number of customers.
*/




SELECT n.n_name
FROM
    (
    SELECT n_name, COUNT(c_custkey) AS nationMax
    FROM customer, nation
    WHERE c_nationkey = n_nationkey
    GROUP BY n_name
    ) SQ,
    nation n
WHERE
    SQ.n_name = n.n_name AND
    nationMax = (SELECT MAX(nationMax) 
                FROM (
                        SELECT n_name, 
                        COUNT(c_custkey) AS nationMax
                        FROM customer, nation
                        WHERE c_nationkey = n_nationkey
                        GROUP BY n_name
                      )
                )




