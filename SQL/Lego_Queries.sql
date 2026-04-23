/* 1. MOST REUSED PARTS */
SELECT TOP 10 
    p.name AS PartName,
    COUNT(DISTINCT i.set_num) AS NumberOfSets
FROM inventory_parts ip
JOIN inventories i ON ip.inventory_id = i.id
JOIN parts p ON ip.part_num = p.part_num
GROUP BY p.name
ORDER BY NumberOfSets DESC;


/* 2. MOST REUSED COLORS */
SELECT TOP 10 
    c.name AS Color,
    COUNT(DISTINCT i.set_num) AS NumberOfSets
FROM inventory_parts ip
JOIN inventories i ON ip.inventory_id = i.id
JOIN colors c ON ip.color_id = c.id
GROUP BY c.name
ORDER BY NumberOfSets DESC;


/* 3. TOTAL PARTS PER SET */
SELECT s.name, SUM(ip.quantity) AS TotalPieces
FROM sets s
JOIN inventories i ON s.set_num = i.set_num
JOIN inventory_parts ip ON i.id = ip.inventory_id
GROUP BY s.name
ORDER BY TotalPieces DESC;


/* 4. UNIQUE PARTS PER SET */
SELECT s.name, COUNT(DISTINCT ip.part_num) AS UniqueParts
FROM sets s
JOIN inventories i ON s.set_num = i.set_num
JOIN inventory_parts ip ON i.id = ip.inventory_id
GROUP BY s.name
ORDER BY UniqueParts DESC;



/* 5. SHARED PARTS BETWEEN TWO SETS (VARIABLES) */
DECLARE @Set1 VARCHAR(20) = '10214-1';
DECLARE @Set2 VARCHAR(20) = '10220-1';

SELECT COUNT(DISTINCT ip1.part_num) AS SharedParts
FROM inventories i1
JOIN inventory_parts ip1 ON i1.id = ip1.inventory_id
JOIN inventories i2 ON i2.set_num = @Set2
JOIN inventory_parts ip2 ON i2.id = ip2.inventory_id
WHERE i1.set_num = @Set1
AND ip1.part_num = ip2.part_num;


/* 6. FREQUENTLY REUSED PARTS (HAVING) */
SELECT ip.part_num, COUNT(DISTINCT i.set_num) AS UsageCount
FROM inventory_parts ip
JOIN inventories i ON ip.inventory_id = i.id
GROUP BY ip.part_num
HAVING COUNT(DISTINCT i.set_num) > 10
ORDER BY UsageCount DESC;


/* 7. LARGE SETS (HAVING) */
SELECT s.name, SUM(ip.quantity) AS TotalPieces
FROM sets s
JOIN inventories i ON s.set_num = i.set_num
JOIN inventory_parts ip ON i.id = ip.inventory_id
GROUP BY s.name
HAVING SUM(ip.quantity) > 500
ORDER BY TotalPieces DESC;

SELECT part_num, AVG(quantity) AS AvgSetSize 
FROM inventory_parts
GROUP BY part_num
HAVING  AVG(quantity) >= 15
ORDER BY AvgSetSize DESC;


/* 8. PARTS ABOVE AVERAGE USAGE (SUBQUERY) */
SELECT ip.part_num, COUNT(*) AS UsageCount
FROM inventory_parts ip
GROUP BY ip.part_num
HAVING COUNT(*) > (
    SELECT AVG(PartCount)
    FROM (
        SELECT COUNT(*) AS PartCount
        FROM inventory_parts
        GROUP BY part_num
    ) AS AvgTable
);


/* 9. THEMES WITH MOST SETS */
SELECT t.name, COUNT(s.set_num) AS TotalSets
FROM themes t
JOIN sets s ON t.id = s.theme_id
GROUP BY t.name
ORDER BY TotalSets DESC;


/* 10. COLOR USAGE PER THEME */
SELECT t.name AS Theme, c.name AS Color, COUNT(*) AS UsageCount
FROM themes t
JOIN sets s ON t.id = s.theme_id
JOIN inventories i ON s.set_num = i.set_num
JOIN inventory_parts ip ON i.id = ip.inventory_id
JOIN colors c ON ip.color_id = c.id
GROUP BY t.name, c.name
ORDER BY t.name, UsageCount DESC;


/* 11. NUMBER OF SETS PER YEAR */
SELECT year, COUNT(*) AS TotalSets
FROM sets
GROUP BY year
ORDER BY year;


/* 12. TOTAL PARTS PER YEAR */
SELECT s.year, SUM(ip.quantity) AS TotalPieces
FROM sets s
JOIN inventories i ON s.set_num = i.set_num
JOIN inventory_parts ip ON i.id = ip.inventory_id
GROUP BY s.year
ORDER BY s.year;


/* STORED PROCEDURE */
GO
CREATE PROCEDURE GetSetParts
    @SetNum VARCHAR(20)
AS
BEGIN
    IF @SetNum IS NULL
        PRINT 'Please enter a set number'
    ELSE
        SELECT p.name AS PartName, ip.quantity
        FROM inventories i
        JOIN inventory_parts ip ON i.id = ip.inventory_id
        JOIN parts p ON ip.part_num = p.part_num
        WHERE i.set_num = @SetNum;
END;

EXEC GetSetParts 1866; 


/* VIEW */
GO
CREATE VIEW vw_SetParts AS
SELECT s.name AS SetName, p.name AS PartName, ip.quantity
FROM sets s
JOIN inventories i ON s.set_num = i.set_num
JOIN inventory_parts ip ON i.id = ip.inventory_id
JOIN parts p ON ip.part_num = p.part_num;
