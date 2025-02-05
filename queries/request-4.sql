.open dreamhome.sqlite
.mode column

-- 4.1
SELECT 
    p.propertyno,
    p.street,
    p.city,
    p.postcode,
    p.type AS property_type,
    o.ownerno,
    o.fname,
    o.lname,
    o.address AS owner_address,
    o.telno
FROM propertyforrent p
JOIN privateowner o ON p.ownerno = o.ownerno;




-- 4.2



-- 4.3


