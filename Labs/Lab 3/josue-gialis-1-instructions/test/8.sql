/*
    8. Find the name of the suppliers from ASIA who have less than $1000 on account balance.
*/

SELECT s_name
FROM supplier
WHERE
    s_nationkey = 8
  AND 
  s_acctbal < 1000
UNION
SELECT s_name
FROM supplier
WHERE
    s_nationkey = 12
  AND 
  s_acctbal < 1000
UNION
SELECT s_name
FROM supplier
WHERE
    s_nationkey = 18
  AND 
  s_acctbal < 1000
UNION
SELECT s_name
FROM supplier
WHERE
    s_nationkey = 21
  AND 
  s_acctbal < 1000;
