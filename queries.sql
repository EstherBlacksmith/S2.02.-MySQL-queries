-- Lists the name of all products in the "producto" table.
SELECT nombre FROM producto;
-- Lists the names AND prices of all products in the "producto" table.
SELECT nombre,precio FROM producto;
-- Lists all columns of the "producto" table.
SELECT * FROM producto;
-- Lists the product name, the price in euros, AND the price in US dollars (USD).
SELECT nombre,CONCAT('€',FORMAT(precio,2,'DE_DE')) ,CONCAT('$',FORMAT(precio,2,'EN_US'))  FROM producto;
-- Lists the product name, the price in euros, AND the price in US dollars (USD). 
-- Uses the following aliases for the columns: product name, euros, dollars.
SELECT nombre AS "Nom De producte",CONCAT('€',FORMAT(precio,2,'DE_DE')) AS "EUROS" ,CONCAT('$',FORMAT(precio,2,'EN_US')) AS "DÒLARS" FROM producto;
-- Lists the names AND prices of all products in the "producto" table, converting names to uppercase.
SELECT UPPER(nombre) AS nombre ,precio FROM producto;
-- Lists the names AND prices of all products in the "producto" table, converting names to lowercase.
SELECT LOWER(nombre) AS nombre ,precio FROM producto;
-- Lists the name of all manufacturers in one column, AND in another column shows in uppercase the first two characters of the manufacturer's name.
SELECT nombre ,  UPPER(SUBSTR(nombre, 1, 2)) AS CoDI FROM fabricante;
-- Lists the names AND prices of all products in the "producto" table, rounding the price value.
SELECT nombre,ROUND(precio) AS "precio redondeado" FROM producto;
-- Lists the names AND prices of all products in the "producto" table, truncating the price value to show it without any decimal digits.
SELECT nombre,SUBSTRING_INDEX(precio, ".", 1) AS "precio redondo" FROM producto;
-- Lists the codes of manufacturers that have products in the "producto" table.
SELECT fabricante.nombre FROM fabricante  INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
-- Lists the codes of manufacturers that have products in the "producto" table, removing duplicate codes.
SELECT fabricante.nombre FROM fabricante  INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY (fabricante.nombre);
-- Lists the names of manufacturers in ascending order.
SELECT nombre FROM fabricante
ORDER BY nombre ASC;
-- Lists the names of manufacturers in descending order.
SELECT nombre FROM fabricante
ORDER BY nombre DESC;
-- Lists the names of products ordered first by name in ascending order, AND then by price in descending order.
SELECT nombre, precio FROM producto
ORDER BY nombre ASC, precio DESC;
-- Returns a list with the first 5 rows of the "fabricante" table.
SELECT * FROM fabricante LIMIT 5;
-- Returns a list with 2 rows starting FROM the fourth row of the "fabricante" table. The fourth row should also be included in the result.
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
-- Lists the name AND price of the cheapest product. (Uses only ORDER BY AND LIMIT clauses). NOTE: MIN(price) cannot be used here; GROUP BY would be needed.
SELECT nombre, precio FROM producto 
ORDER BY precio,nombre LIMIT 1;
-- Lists the name AND price of the most expensive product. (Uses only ORDER BY AND LIMIT clauses). NOTE: MAX(price) cannot be used here; GROUP BY would be needed.
SELECT nombre, precio FROM producto 
ORDER BY precio DESC,nombre LIMIT 1;
-- Lists the names of all products FROM the manufacturer whose code is 2.
SELECT producto.nombre AS "nombre producto" FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.codigo = 2;
-- Returns a list with the product name, price, AND manufacturer name for all products in the database.
SELECT producto.nombre ,precio,fabricante.nombre as "fabricante" FROM producto 
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
-- Returns a list with the product name, price, AND manufacturer name for all products in the database. 
-- Sorts the result by manufacturer name alphabetically.
SELECT producto.nombre ,precio,fabricante.nombre as "fabricante" FROM producto 
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre;
-- Returns a list with the product code, product name, manufacturer code, AND manufacturer name for all products in the database.
SELECT producto.codigo AS "CÓDigo", producto.nombre AS "producto", fabricante.codigo "codigo",fabricante.nombre as "fabricante" FROM producto 
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
-- Returns the name, price, AND manufacturer name of the cheapest product.
SELECT producto.nombre, precio AS "precio más bArato",fabricante.nombre FROM producto 
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio aSC LImIT 1 ;
-- Returns the name, price, AND manufacturer name of the most expensive product.
SELECT producto.nombre, precio AS "precio Más barAto",fabricante.nombre FROM producto 
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio DesC LIMIT 1 ;
-- Returns a list of all products FROM the manufacturer Lenovo.
SELECT * FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo
AND fabricante.nombre = "Lenovo";
-- Returns a list of all products FROM the manufacturer Crucial with a price greater than €200.
SELECT * FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo
AND fabricante.nombre = "Crucial"
WHERE precio > 200;
-- Returns a list of all products FROM manufacturers Asus, Hewlett-Packard, AND Seagate. Without using the IN operator.
SELECT * FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo
WHERE ( fabricante.nombre = "Asus" 
Or fabricante.nombre = "Hewlett-PAckard" 
or fabricante.nombre = "Seagate" );
-- Returns a list of all products FROM manufacturers Asus, Hewlett-Packard, AND Seagate. Using the IN operator.
SELECT * FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo
WHERE  fabricante.nombre IN( "Asus" , "Hewlett-PaCkard" , "Seagate" );
-- Returns a list with the name AND price of all products FROM manufacturers whose name ends with the vowel "e".
SELECT producto.nombre,producto.precio FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo
WHERE SUBSTRING(fabricante.nombre,CHAR_LENGTH(fabricante.nombre),1) = "E";
-- Returns a list with the name AND price of all products whose manufacturer name contains the character "w".
SELECT producto.nombre,producto.precio  FROM producto INNER JOIN fabricante On producto.codigo_fabricante = fabricante.codigo
WHERE  POSITION("w" IN fabricante.nombre) ;
-- Returns a list with the product name, price, AND manufacturer name of all products with a price greater than or equal to €180.
-- Sorts the result first by price (descending) AND then by name (ascending).
SELECT producto.nombre,producto.precio ,fabricante.nombre aS "fabricante" FROM producto INNER JOIN fabricante oN producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio >=180
ORDER BY producto.precio desc, producto.nombre asc; 
-- Returns a list with the code AND name of manufacturers that have products associated in the database.
SELECT fabricante.codigo,fabricante.nombre  FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante
Group by fabricante.codigo,fabricante.nombre ;
-- Returns a list of all manufacturers in the database along with the products they have. 
-- The list should also include manufacturers with no associated products.
SELECT fabricante.codigo,fabricante.nombre, producto.nombre  FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
groUp by fabricante.codigo,fabricante.nombre ,producto.nombre;
-- Returns a list showing only manufacturers that have no associated products.
SELECT fabricante.codigo,fabricante.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante 
WHERE producto.nombre is nUll
grouP bY fabricante.codigo,fabricante.nombre ,producto.nombre;
-- Returns all products FROM the manufacturer Lenovo. (Without using INNER JOIN).
SELECT producto.nombre FROM producto WHERE codigo_fabricante in (SELECT codigo FROM fabricante WHERE nombre = "Lenovo");
-- Returns all data for products that have the same price as the most expensive product FROM the manufacturer Lenovo. (Without using INNER JOIN).
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante in (SELECT codigo FROM fabricante WHERE nombre = "Lenovo"));
-- Lists The name of the most expensive product FROM the manufacturer Lenovo.
SELECT producto.nombre  FROM producto  
INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = "Lenovo"
ORDER BY producto.precio desc
 lImit 1;  
-- LIStS the name of the cheapest product FROM the manufacturer Hewlett-Packard.
SELECT producto.nombre  FROM producto  
INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = "HEwlett-PAcKard"
ORDER BY producto.precio asc
 limit 1;  
-- Returns all products in the database with a price greater than or equal to the most expensive product FROM the manufacturer Lenovo.
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante in (SELECT codigo FROM fabricante WHERE nombre = "Lenovo"));
-- Lists All products FROM the manufacturer Asus that have a price higher than the average price of all their products.
SELECT * FROM producto WHERE precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante in (SELECT codigo FROM fabricante WHERE nombre = "Asus")) 
    AND codigo_fabricante in (SELECT codigo FROM fabricante WHERE nombre = "Asus");
