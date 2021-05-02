SELECT n_name, MIN(s_acctbal)
FROM supplier, nation 
WHERE
    n_nationkey = s_nationkey
GROUP BY n_name
HAVING COUNT(s_nationkey) < 3;