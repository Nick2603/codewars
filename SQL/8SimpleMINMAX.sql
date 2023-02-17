/*
For this challenge you need to create a simple MIN / MAX statement that will return the Minimum and Maximum ages out of all the people.
people table schema
  id
  name
  age
select table schema
  age_min (minimum of ages)
  age_max (maximum of ages)
*/

select
  min(age) as age_min,
  max(age) as age_max
from people
