DROP TABLE Product;
DROP TABLE Distributor;
DROP TABLE Price_Cube;

CREATE TABLE Product (
    model INTEGER(10),
    type CHAR(30),
    maker CHAR(30),
    CHECK ((type = 'pc' AND model >= 100000 AND model < 200000) OR
          (type = 'laptop' AND model >= 200000 AND model < 300000) OR
          (type = 'printer' AND model >= 200000 AND model < 300000))
);

CREATE TABLE Distributor (
    model INTEGER(6),
    name CHAR(30),
    price INTEGER(10) DEFAULT('NULL')
);


CREATE TABLE Price_Cube (
    distributor_type CHAR(30),
    product_type CHAR(30),
    num_prod INTEGER(5),
    tot_price INTEGER(10)
);


-- INSERT INTO Distributor VALUES(300004, 'pc', 'P2');