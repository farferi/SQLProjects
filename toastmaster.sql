SELECT 
    COUNT(event_name)
FROM
    event
WHERE
    LOWER(event_name) LIKE '%toastmaster%';
SELECT 
    city, COUNT(event_name)
FROM
    event
        JOIN
    venue_ ON venue_.venue_id = event.venue_id
WHERE
    LOWER(event_name) LIKE '%toastmaster%'  
GROUP BY city;
