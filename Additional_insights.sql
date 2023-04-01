-- venue_
SELECT 
    city, COUNT(venue_id)
FROM
    venue_
GROUP BY city
ORDER BY COUNT(venue_id) DESC
LIMIT 1;
/* Which city has the most venues?
New York with 518 venues is on the top.*/

SELECT 
    group_name, created
FROM
    grp
ORDER BY created
LIMIT 5;
/* What are the 5 oldest groups?
New York City Poker Group is the oldest group and it was created on 2002-10-08 17:22:15. The second oldest group is NYC Dining + Cooking and it was created on 2002-10-08 17:22:19. The third oldest group is SF PHP Community and it was created on 2002-10-08 17:22:20. The fourth oldest group is Events for Wine Lovers and it was created on 2002-10-08 17:22:21. The fifth oldest group is The NYC Bookcrossing Meetup and it was created on 2002-10-08 17:22:23. As we we they all created on the same day and time, and only difference between them are some seconds.*/


SELECT 
    member_id, member_name, COUNT(member_id)
FROM
    grp_member
GROUP BY member_id
ORDER BY COUNT(member_id) DESC;
/* What member/members is /are  part of the most groups?
The following member id's are part of the most groups: 8468628, 33922702, 39767972, 3893698, 234109385, 11967479, 13762355. They all are part of 7 groups.*/


SELECT 
    zip, COUNT(group_id)
FROM
    city
        JOIN
    grp ON grp.city_id = city.city_id
GROUP BY zip
ORDER BY COUNT(group_id) DESC
LIMIT 1;
/* Which zip code area has the most groups?
10001 zip code with 2282 groups has the most groups.*/

SELECT 
    COUNT(visibility)
FROM
    event;
SELECT 
    COUNT(visibility)
FROM
    event
WHERE
    visibility = 'public';
/*What percentage of upcoming events are visible for public? 
all the events are visibile to public, so it is %100.*/

SELECT 
    category_name, AVG(rating)
FROM
    category
        JOIN
    grp ON grp.category_id = category.category_id
GROUP BY category_name
ORDER BY AVG(rating) DESC
LIMIT 1;
/* Which category has the highest average of rating?
Category of Sigles with an average rating of 4.05 has the highest rating, and the members of this category are the most satisfied members.*/