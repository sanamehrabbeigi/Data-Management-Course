#1.a
SELECT i.name,i.price,i.cost
FROM band b
INNER JOIN item i ON b.id = i.band_id
WHERE b.name="KISS";

#1.b
SELECT id, name, quantity
FROM item 
ORDER BY quantity DESC
LIMIT 3;

#1.c
SELECT SUM(i.quantity * i.cost) AS total_cost, SUM(i.quantity * (i.price - i.cost)) AS total_profit_potential
FROM item i 
INNER JOIN location l ON i.ocean = l.ocean AND i.pillar = l.pillar AND i.shelf = l.shelf
WHERE l.ocean="Pacific";

#1.d
SELECT b.name, i.name, l.ocean, l.pillar, l.shelf,(i.price - i.cost) AS margin
FROM band b INNER JOIN item i ON i.band_id = b.id
INNER JOIN location l ON i.ocean = l.ocean AND i.pillar = l.pillar AND i.shelf = l.shelf
ORDER BY margin DESC;

#1.e
#solution1
SELECT 
    (SELECT SUM(i.quantity) 
     FROM item i 
     INNER JOIN location l ON i.ocean = l.ocean 
                         AND i.pillar = l.pillar 
                         AND i.shelf = l.shelf
     WHERE l.shelf IN (1, 2)) / 
    NULLIF(
        (SELECT SUM(i.quantity) 
         FROM item i 
         INNER JOIN location l ON i.ocean = l.ocean 
                             AND i.pillar = l.pillar 
                             AND i.shelf = l.shelf
         WHERE l.shelf IN (5, 6))
    , 0) AS ratio;

#solution2
SELECT 
    SUM(CASE WHEN l.shelf IN (1, 2) THEN i.quantity ELSE 0 END) /
    NULLIF(SUM(CASE WHEN l.shelf IN (5, 6) THEN i.quantity ELSE 0 END), 0) AS ratio
FROM item i
INNER JOIN location l 
    ON i.ocean = l.ocean 
    AND i.pillar = l.pillar 
    AND i.shelf = l.shelf;

################
#2.a
SELECT DISTINCT Language 
FROM COUNTRYLANGUAGE 
ORDER BY Language ASC;

#2.b 
SELECT SUM(Population) AS Total_Population 
FROM COUNTRY;

#2.c
SELECT name, GNP
FROM COUNTRY
WHERE GNP > 2000000;

#2.d
SELECT name, (GNP/1000000) AS GNPinT
FROM COUNTRY
ORDER BY GNPinT ASC;

#2.e
SELECT c.name, cl.Language
FROM COUNTRY c INNER JOIN COUNTRYLANGUAGE cl ON cl.countrycode = c.code
WHERE c.name = "Albania" And cl.IsOfficial = "T";

#2.f
SELECT cl.Language, avg(c.LifeExpectancy) AS Avg_LifeExpectancy
FROM COUNTRY c INNER JOIN COUNTRYLANGUAGE cl ON cl.countrycode = c.code
WHERE cl.Language = "French";

#2.g
#solution1
SELECT Name, LifeExpectancy
    FROM COUNTRY
    WHERE LifeExpectancy = (SELECT MAX(LifeExpectancy) FROM COUNTRY)
UNION
    SELECT Name, LifeExpectancy
    FROM COUNTRY
    WHERE LifeExpectancy = (SELECT MIN(LifeExpectancy) FROM COUNTRY);

#solution2
(
    SELECT Name, LifeExpectancy
    FROM COUNTRY
    WHERE LifeExpectancy IS NOT NULL
    ORDER BY LifeExpectancy ASC
    LIMIT 1
)
UNION
(
    SELECT Name, LifeExpectancy
    FROM COUNTRY
    WHERE LifeExpectancy IS NOT NULL
    ORDER BY LifeExpectancy DESC
    LIMIT 1
);

##2.h
#solution1
SELECT c.Name, c.LifeExpectancy
FROM COUNTRY c
INNER JOIN COUNTRYLANGUAGE cl ON c.Code = cl.CountryCode
WHERE cl.Language = 'French' 
  AND c.LifeExpectancy > (
        SELECT AVG(c2.LifeExpectancy)
        FROM COUNTRY c2
        JOIN COUNTRYLANGUAGE cl2 ON c2.Code = cl2.CountryCode
        WHERE cl2.Language = 'French');

#solution2
WITH French_Avg_Life AS (
    SELECT AVG(country.LifeExpectancy) AS Avg_LifeExpectancy
    FROM country
    INNER JOIN countrylanguage 
    ON country.Code = countrylanguage.CountryCode
    WHERE countrylanguage.Language = "French"
)
SELECT country.Name, country.LifeExpectancy
FROM country
INNER JOIN countrylanguage 
ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = "French"
AND country.LifeExpectancy > (SELECT Avg_LifeExpectancy FROM French_Avg_Life);
