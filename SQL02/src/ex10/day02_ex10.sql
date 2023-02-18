SELECT p_1.name AS person_name1, p_2.name AS person_name2,
       p_1.address AS common_address
FROM person p_1
INNER JOIN person p_2
ON p_2.address = p_1.address
WHERE p_1.id > p_2.id
ORDER BY person_name1, person_name2, common_address;