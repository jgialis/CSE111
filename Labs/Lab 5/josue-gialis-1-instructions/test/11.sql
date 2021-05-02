/*
    11. Find the highest value items (l extendedprice*(1-l discount)) 
    not shipped as of October 2, 1994.
    Print the name of the part corresponding to these items.
*/

SELECT p_name
FROM lineitem, part
WHERE
    p_partkey = l_partkey AND
    l_extendedprice * (1 - l_discount) > (
                        SELECT MAX(l_extendedprice * 1 - l_discount)
                        FROM lineitem
                        WHERE
                        l_shipdate < '1994-10-02'
                      )


