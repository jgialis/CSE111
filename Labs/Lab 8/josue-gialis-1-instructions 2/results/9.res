--EQP-- 0,0,1,SCAN TABLE nation USING COVERING INDEX nation_idx_n_name_n_nationkey
--EQP-- 0,1,0,SEARCH TABLE supplier USING COVERING INDEX supplier_idx_s_nationkey_s_acctbal (s_nationkey=?)
BRAZIL|2470.84
FRANCE|6201.77
IRAN|237.31
IRAQ|-283.84
JORDAN|2371.51
MOROCCO|4641.08
SAUDI ARABIA|4170.51
