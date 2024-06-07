CREATE DATABASE store;
USE store;

CREATE TABLE product (
	idProduct int auto_increment primary key,
    name varchar(45) not null,
    brand varchar(45) not null,
    price float not null,
    stock int not null,
    description text
);

INSERT INTO product (name, brand, price, stock, description) 
VALUES ('reloj', 'Rolex', 599.99, 5, 'reloj de lujo');

INSERT INTO product (name, brand, price, stock, description)
VALUES 	('telefono', 'samsung', 1200, 5, 'telefono inteligente'),
		('portatil', 'HP', 1500, 10, 'portatil rapido'),
        ('reloj', 'rolex', 250, 1, 'reloj usado');
  
select * from product;  
UPDATE product set stock = 4 WHERE idProduct = 1;
UPDATE product set description = 'lorem ipsum', brand = 'casio', price = 500 where idProduct = 4;
UPDATE product set price = price*0.9 where idProduct >= 1;

DELETE FROM product WHERE name = 'portatil';

SELECT * FROM product WHERE name = 'reloj';
SELECT * FROM product WHERE name = 'reloj' AND brand = 'casio';
SELECT name, price, description FROM product WHERE description LIKE '%telefono%'; # %...% = includes, '...%' tiene que empezar estricatamente con esa palabra, %... - igual pero al reves
SELECT * FROM product WHERE price >=520 and stock <10;

SELECT * FROM product ORDER BY price ASC;
SELECT * FROM product ORDER BY name desc;

SELECT distinct name from product;
SELECT * FROM product WHERE brand in ('rolex', 'casio');