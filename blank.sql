SELECT 
    *
FROM
    venue_;
alter table category
drop column sort_name, drop column shortname;
/* In the category table, sort_name and shortname columns repeated category_name column. */
alter table grp_member
drop column country;
/*Letsmeet is only available in the US, so all the members are from the US, and there is no need for country column.*/
alter table grp_member
drop column visited;
/* Visited column would not provide any valuable information, it is about when a member visited the website, and this information is not useful. */
alter table venue_
drop column country, drop column localized_country_name, drop column `RAND()`;
/*Letsmeet is only available in the US, so all the members are from the US, and there is no need for country column and localized_country. Other than that, RAND column does not provide any useful information.*/
alter table city
drop column country,
drop column localized_country_name,
drop column distance;
/*Letsmeet is only available in the US, so all the members are from the US, and there is no need for country column and localized_country. Other than that, distance column does not provide any useful information.*/
alter table event
drop column utc_offset,
drop column headcount;
/*utc_offset and headcount columns don't not provide any useful information.*/
CREATE TABLE group_sign_ups SELECT DISTINCT group_id, member_id, joined FROM
    grp_member;
CREATE TABLE members SELECT DISTINCT member_id, member_name, city, hometown, member_status FROM
    grp_member;
alter table members
add primary key(member_id);
alter table group_sign_ups
add foreign key(member_id) references members(member_id);
alter table group_sign_ups
add foreign key(group_id) references grp(group_id);
drop table grp_member;
