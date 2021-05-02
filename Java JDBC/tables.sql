CREATE TABLE pc (
    model DECIMAL(4,4),
    speed DECIMAL(4,4),
    ram DECIMAL(4,4),
    hd DECIMAL(4,4),
    price DECIMAL(4,4)

);


CREATE TABLE laptop (
    model DECIMAL(4,4),
    speed DECIMAL(4,4),
    ram DECIMAL(4,4),
    hd DECIMAL(4,4),
    screen DECIMAL(4,4),
    price DECIMAL(4,4)
);


CREATE TABLE printer (
    model DECIMAL(4,4),
    color char(30),
    type char(30),
    price DECIMAL(4,4)
);


CREATE TABLE product (
    maker char(30),
    model decimal(10),
    type char(30)
);



DROP TABLE product;
DROP TABLE pc;
DROP TABLE laptop;
DROP TABLE printer;