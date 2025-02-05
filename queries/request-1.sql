.open dreamhome.sqlite
.mode column

-- 1.1
SELECT postcode FROM branch;


-- 1.2
SELECT 
    p.propertyno,
    p.street,
    p.city,
    p.postcode,
    p.type AS property_type,
    v.clientno,
    v.viewdate
FROM propertyforrent p
LEFT JOIN viewing v ON p.propertyno = v.propertyno
ORDER BY p.propertyno, v.viewdate;



-- 1.3


