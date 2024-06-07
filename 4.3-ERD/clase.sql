USE mydb;
SELECT * FROM mydb.alumna;
SELECT * FROM mydb.promo;
SELECT * FROM mydb.profe;
SELECT * FROM mydb.`promo-profes`;
SELECT * FROM mydb.promoprofe;

SELECT promo.name, alumna.name
FROM promo, alumna
WHERE promo.idPromo = alumna.fkPromo and promo.name = 'xia';