select * from text;
/*Remove the extra spaces from the 'Country' column and create a new 'Country Corrected' column*/
select trim("United States") as Country from text;
update text
set country = trim("United States");
-- for more than one country, use--
update text
set country = replace(country,"    ","");

/*2.Create a combined field 'Address' to repesent location in ' <City> , <State> ( < Country>)' For example 'Henderson, Kentucky (United States)'*/
select concat(city," ",State," ",Country) as Address from text;

/*3. Substitute United States with US and create a new ' Address Short' column*/
select replace(Country,"United States","US") as short_address from text;

/*4. Enrollment number' is a combination of a Code, Enrollment year and an Unique identifier. Study few examples of 'Enrollment number' and separate out the 'Unique identier' for each student/
select right(enrollment_num,6) as unique_identifier from text;*/

/*5. Create 'Enrollment year' field from 'Enrollment number'*/
select mid(enrollment_num,4,4) as year from text;

create view result as
select *,
concat(city," ",State," ",Country) as Address,
replace(Country,"United States","US") as short_address,
right(enrollment_num,6) as unique_identifier,
mid(enrollment_num,4,4) as year