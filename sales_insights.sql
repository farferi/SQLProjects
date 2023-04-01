-- Answer the questions from the Sales team in this file.

-- Active Cities
SELECT 
    city, member_status
FROM
    grp_member
WHERE
    member_status = 'active'
GROUP BY city;
/* What cities have active members?
San Francisco, New york, Chicago have active members(There are West New York, West Chicago, South San Francisco, North Chicago, Chicago Heights, East Chicago, Chicago Ridge in the city column, but they all are part of the mentioned cities and need to be cleaned later on)*/
SELECT 
    city.city, member_status
FROM
    city
        JOIN
    grp ON city.city_id = grp.city_id
        JOIN
    grp_member ON grp.group_id = grp_member.group_id
WHERE
    NOT member_status = 'active'
GROUP BY city.city;
/* Are there any cities listed in the city table with no active members? If so, what state are those cities in?
 Francisco, New york, Chicago have non-active members, and these cities are in the following states: CA, NY, IL.*/

SELECT 
    join_mode, COUNT(join_mode)
FROM
    grp
GROUP BY join_mode;
/* How many groups are currently open, waiting for approval, and/or closed?
There are 3602 groups open to join, 723 groups are waiting for approval, and 15 groups are closed.*/


SELECT 
    COUNT(group_id), category_name
FROM
    category
        JOIN
    grp ON category.category_id = grp.category_id
GROUP BY category_name
ORDER BY COUNT(group_id) DESC
LIMIT 5;
/*What are the five categories that contain the most groups? 
Tech with 911 groups, Career & Business with 790 groups, Socializing with 320 groups, Health & Wellbeing with 218 groups, and Language & Ethnic Identity with 166 groups are the top five categories that contain the most groups.*/
SELECT 
    COUNT(group_id), category_name
FROM
    category
        JOIN
    grp ON category.category_id = grp.category_id
GROUP BY category_name
ORDER BY COUNT(group_id)
LIMIT 5;
/*What are the five categories that contain the least number of groups? 
Paranormal with 4 groups, Cars & Motorcycles with 15 groups, Sci-Fi & Fantasy with 16 groups, Lifestyle with 26 groups, and Hobbies & Crafts with 32 groups are the five categories that contain the least number of groups.*/

SELECT 
    COUNT(DISTINCT member_id)
FROM
    grp_member;
/* How many members are there?
There are 39980 members.*/
SELECT 
    ((SELECT 
            COUNT(DISTINCT member_id)
        FROM
            grp_member
        WHERE
            city = 'Chicago') / (SELECT 
            COUNT(DISTINCT member_id)
        FROM
            grp_member)) * 100;
/*What percentage of members are in Chicago?
Around %22 of members are in Chicago.*/