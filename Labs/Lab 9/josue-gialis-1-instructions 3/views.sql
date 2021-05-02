--(1)
DROP VIEW V1;
CREATE VIEW V1(c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment, c_comment, c_nation, c_region) AS
SELECT c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment, c_comment, n_name AS c_nation, r_name AS c_region
FROM customer, region, nation
WHERE 
    c_nationkey = n_nationkey AND
    r_regionkey = n_regionkey;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--(2)
DROP VIEW V2;
CREATE VIEW V2(s_suppkey, s_name, s_address, s_phone, s_acctbal, s_comment, s_nation, s_region) AS 
SELECT s_suppkey, s_name, s_address, s_phone, s_acctbal, s_comment, n_name AS s_nation, r_name AS s_region
FROM supplier, region, nation
WHERE 
    s_nationkey = n_nationkey AND
    r_regionkey = n_regionkey;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Rewrite Q3 from Lab 4 with view V1.
SELECT c_nation, COUNT(*)
FROM orders, V1
WHERE 
    o_custkey = c_custkey AND
    c_region = 'ASIA'
    GROUP BY c_nation;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 4. Rewrite Q4 from Lab 4 with view V2.
SELECT s_name, COUNT(*)
FROM partsupp, V2, part
WHERE
    p_partkey = ps_partkey AND
    ps_suppkey = s_suppkey AND
    p_size < 30 AND
    s_nation = 'CHINA'
    GROUP BY s_name;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 5. Create a view V5 that replaces o_orderdate with 
--    the year o_orderyear and contains all the other 
--    attributes in orders. Rewrite Q5 from Lab 4 with 
--    views V1 and V5.
DROP VIEW V5;
CREATE VIEW V5(o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderyear, o_orderpriority, o_clerk, o_shippriority, o_comment) AS
SELECT o_orderkey, o_custkey, o_orderstatus, o_totalprice, strftime('%Y', o_orderdate) AS o_orderyear, o_orderpriority, o_clerk, o_shippriority, o_comment
FROM orders;

SELECT COUNT(*)
FROM V1, V5
WHERE
    o_custkey = c_custkey AND
    c_nation = 'PERU' AND
	o_orderyear = '1996';


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 6. Rewrite Q6 from Lab 4 with view V5.
select s_name, o_orderpriority, count(*)
from partsupp, orders, lineitem, supplier, region, nation
where ps_partkey = l_partkey 
	and ps_suppkey = l_suppkey
	and l_orderkey = o_orderkey
	and ps_suppkey = s_suppkey
	and s_nationkey = n_nationkey
	and n_regionkey = r_regionkey
	and r_name = 'AMERICA'
group by s_name, o_orderpriority;


SELECT s_name, o_orderpriority, COUNT(*)
FROM V5, partsupp, lineitem, supplier, region, nation
WHERE 
        ps_partkey = l_partkey 
	and ps_suppkey = l_suppkey
	and l_orderkey = o_orderkey
	and ps_suppkey = s_suppkey
	and s_nationkey = n_nationkey
	and n_regionkey = r_regionkey
	and r_name = 'AMERICA'
group by s_name, o_orderpriority;




--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 7. Rewrite Q7 from Lab 4 with views V1 and V5.
select n_name, o_orderstatus, count(*)
from orders, customer, nation, region
where o_custkey = c_custkey 
	and c_nationkey = n_nationkey
	and n_regionkey = r_regionkey
	and r_name = 'EUROPE'
group by n_name, o_orderstatus;

SELECT c_nation, o_orderstatus, COUNT(*)
FROM V1, V5
WHERE 
    c_region = 'EUROPE' AND 
    o_custkey = c_custkey
group by c_nation, o_orderstatus;



-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 8. Rewrite Q8 from Lab 4 with views V2 and V5.
select n_name, count(distinct o_orderkey) as tot_orders
from orders, nation, supplier, lineitem
where o_orderdate like '1994%'
	and o_orderstatus = 'F'
	and o_orderkey = l_orderkey 
	and l_suppkey = s_suppkey
	and s_nationkey = n_nationkey
group by n_name
having tot_orders > 300;


SELECT s_nation, count(DISTINCT o_orderkey) AS tot_orders
FROM V2, V5, lineitem
WHERE o_orderyear = '1994'
	AND o_orderstatus = 'F'
	AND o_orderkey = l_orderkey 
	AND l_suppkey = s_suppkey
GROUP BY s_nation
HAVING tot_orders > 300;




-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 9. Rewrite Q9 from Lab 4 with views V2 and V5.
select count(DISTINCT o_clerk)
from orders, supplier, nation, lineitem
where o_orderkey = l_orderkey 
	and l_suppkey = s_suppkey 
	and s_nationkey = n_nationkey 
	and n_name = 'CANADA';


SELECT COUNT(DISTINCT o_clerk)
FROM V2, V5, lineitem
WHERE o_orderkey = l_orderkey 
	AND l_suppkey = s_suppkey
    AND s_nation = 'CANADA';




-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Create a view V10(p type, avg discount) that computes the average discount 
-- for every type of part. Rewrite Q10 from Lab 4 with view V10.
DROP VIEW V10;

CREATE VIEW V10(p_type, avg_discount) AS
SELECT p_type, AVG(l_discount) AS avg_discount
FROM part, lineitem
WHERE 
    p_partkey = l_partkey
    GROUP BY p_type;

SELECT p_type, avg_discount
FROM V10
WHERE p_type LIKE '%PROMO%'
GROUP BY p_type;


-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 11. Rewrite Q11 from Lab 4 with view V2.
select n_name, s_name, s_acctbal
from supplier s, nation n
where s_nationkey = n_nationkey
	and s_acctbal = 
		(select max(s_acctbal)
		from supplier s1
		where s.s_nationkey = s1.s_nationkey
		);


SELECT s_nation, s_name, s_acctbal
FROM V2
WHERE s_acctbal = 
		(select max(s_acctbal)
		from V2 view2
		where view2.s_nation = V2.s_nation
		)
        ORDER BY s_name;



-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 12. Rewrite Q12 from Lab 4 with view V2.
select n_name, avg(s_acctbal)
from supplier, nation
where s_nationkey = n_nationkey
group by n_name;


SELECT s_nation, AVG(s_acctbal)
FROM V2
GROUP BY s_nation;



-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 13. Rewrite Q13 from Lab 4 with views V1 and V2.
select count(*)
from orders, lineitem, customer
where o_orderkey = l_orderkey
	and o_custkey = c_custkey
	and l_suppkey in (
		select s_suppkey
		from supplier, nation, region
		where s_nationkey = n_nationkey
			and n_regionkey = r_regionkey
			and r_name = 'ASIA'
		)
	and c_custkey in (
		select c_custkey
		from customer, nation
		where c_nationkey = n_nationkey
			and n_name = 'ARGENTINA'
		);

SELECT COUNT(*)
FROM orders, lineitem, V1
where o_orderkey = l_orderkey
	and o_custkey = c_custkey
	and l_suppkey in (
		select s_suppkey
		from V2
		where s_region = 'ASIA'
		)
	and c_custkey in (
		select c_custkey
		from V1
		where c_nation = 'ARGENTINA'
		);

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 14. Rewrite Q14 from Lab 4 with views V1 and V2.
select custRegion, suppRegion, count(*) as no
from
	orders
	join
	(select o_orderkey as custOrder, r_name as custRegion
	from orders, nation, region, customer
	where o_custkey = c_custkey
		and c_nationkey = n_nationkey
		and n_regionkey = r_regionkey
	) on o_orderkey = custOrder
	join
	(select l_orderkey as suppOrder, r_name as suppRegion
	from lineitem, region, nation, supplier
	where l_suppkey = s_suppkey
		and s_nationkey = n_nationkey
		and n_regionkey = r_regionkey
	) on o_orderkey = suppOrder
group by custRegion, suppRegion;


select custRegion, suppRegion, count(*) as no
from
	orders
	join
	(select o_orderkey as custOrder, r_name as custRegion
	from orders, nation, region, customer
	where o_custkey = c_custkey
		and c_nationkey = n_nationkey
		and n_regionkey = r_regionkey
	) on o_orderkey = custOrder
	join
	(select l_orderkey as suppOrder, r_name as suppRegion
	from lineitem, region, nation, supplier
	where l_suppkey = s_suppkey
		and s_nationkey = n_nationkey
		and n_regionkey = r_regionkey
	) on o_orderkey = suppOrder
group by custRegion, suppRegion;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 15. Create two views V151(c custkey, c name, c nationkey, c acctbal) and 
-- V152(s suppkey, s name, s nationkey, s acctbal) that contain the customers 
-- and suppliers with negative balance, respectively. Rewrite Q15 from Lab 4 with views V151 and V152.
CREATE VIEW V151(c_custkey, c_name, c_nationkey, c_acctbal) AS
SELECT c_custkey, c_name, c_nationkey, c_acctbal
FROM customer
WHERE c_acctbal < 0;

CREATE VIEW V152(s_suppkey, s_name, s_nationkey, s_acctbal) AS
SELECT s_suppkey, s_name, s_nationkey, s_acctbal
FROM supplier
WHERE s_acctbal < 0;

select count(DISTINCT o_orderkey)
from orders, lineitem
where o_orderkey = l_orderkey
	and o_custkey in
		(select c_custkey
		from V151)
	and l_suppkey in
		(select s_suppkey
		from V152);







select count(DISTINCT o_orderkey)
from orders, lineitem
where o_orderkey = l_orderkey
	and o_custkey in
		(select c_custkey
		from customer
		where c_acctbal < 0)
	and l_suppkey in
		(select s_suppkey
		from supplier
		where s_acctbal < 0);


DROP VIEW V1;
DROP VIEW V2;
DROP VIEW V10;
DROP VIEW V151;
DROP VIEW V152;
