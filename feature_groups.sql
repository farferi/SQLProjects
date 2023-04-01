SELECT 
    CASE
        WHEN rating BETWEEN 1 AND 1.99 THEN '1-1.99'
        WHEN rating BETWEEN 2 AND 2.99 THEN '2-2.99'
        WHEN rating BETWEEN 3 AND 3.99 THEN '3-3.99'
        WHEN rating BETWEEN 4 AND 4.99 THEN '4-4.99'
        WHEN rating = 5 THEN '5'
        ELSE '0'
    END AS rate,
    COUNT(group_id)
FROM
    grp
GROUP BY rate
ORDER BY rate;
SELECT 
    *
FROM
    grp
WHERE
    rating NOT BETWEEN 1 AND 5;
SELECT 
    group_id, members
FROM
    grp
WHERE
    rating = 5
ORDER BY members DESC;
SELECT 
    group_id, members, city
FROM
    grp
        JOIN
    city ON city.city_id = grp.city_id
WHERE
    rating = 5
ORDER BY members DESC;
select group_id, members, city, category_name from grp
join city on city.city_id = grp.city_id join category on category.category_id = grp.category_id where rating = 5 order by members desc;
SELECT 
    category_name, COUNT(category_name), members
FROM
    category
        JOIN
    grp ON grp.category_id = category.category_id
WHERE
    rating = 5
GROUP BY category_name
ORDER BY COUNT(category_name) ASC;