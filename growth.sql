SELECT 
    YEAR(joined), COUNT(YEAR(joined))
FROM
    grp_member
GROUP BY YEAR(joined)
ORDER BY COUNT(YEAR(joined));
SELECT 
    joined
FROM
    grp_member;
set sql_safe_updates = 0;
UPDATE grp_member 
SET 
    city = 'Chicago'
WHERE
    city IN ('East Chicago' , 'West Chicago',
        'North Chicago',
        'Chicago Heights',
        'Chicago Ridge',
        'Chicago');
SELECT 
    city
FROM
    grp_member
WHERE
    LOWER(city) LIKE '%Chicago%';
UPDATE grp_member 
SET 
    city = 'San Francisco'
WHERE
    city IN ('San Francisco' , 'South San Francisco');
SELECT 
    city
FROM
    grp_member
WHERE
    LOWER(city) LIKE '%San Francisco%';
UPDATE grp_member 
SET 
    city = 'New York'
WHERE
    city IN ('New York' , 'West New York');
SELECT 
    city
FROM
    grp_member
WHERE
    LOWER(city) LIKE '%New York%';
SELECT 
    YEAR(joined), COUNT(YEAR(joined))
FROM
    grp_member
WHERE
    city = 'Chicago'
GROUP BY YEAR(joined)
ORDER BY COUNT(YEAR(joined));
SELECT 
    YEAR(joined), COUNT(YEAR(joined))
FROM
    grp_member
WHERE
    city = 'San Francisco'
GROUP BY YEAR(joined)
ORDER BY COUNT(YEAR(joined));
SELECT 
    YEAR(joined), COUNT(YEAR(joined))
FROM
    grp_member
WHERE
    city = 'New York'
GROUP BY YEAR(joined)
ORDER BY COUNT(YEAR(joined));
SELECT 
    MONTH(joined), COUNT(MONTH(joined))
FROM
    grp_member
WHERE
    YEAR(joined) = 2017
GROUP BY MONTH(joined)
ORDER BY MONTH(joined);
SELECT 
    MONTH(joined), COUNT(MONTH(joined))
FROM
    grp_member
WHERE
    YEAR(joined) = 2016
GROUP BY MONTH(joined)
ORDER BY MONTH(joined);
SELECT 
    MONTH(joined), COUNT(MONTH(joined))
FROM
    grp_member
WHERE
    YEAR(joined) = 2015
GROUP BY MONTH(joined)
ORDER BY MONTH(joined);
set sql_safe_updates = 0;