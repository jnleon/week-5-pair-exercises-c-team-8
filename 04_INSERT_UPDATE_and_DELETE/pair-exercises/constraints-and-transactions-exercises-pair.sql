-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)

INSERT INTO city(name, countrycode, district, population)
VALUES ('Smallville','USA','Kansas',45001)

-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.

INSERT INTO countrylanguage(countrycode, language, isofficial, percentage)
VALUES ('USA', 'Kryptonese', 0, .0001)

-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.

UPDATE countrylanguage
SET language = 'Krypto-babble'
WHERE language = 'Kryptonese'

select *
from countrylanguage

-- 4. Set the US captial to Smallville, Kansas in the country table.

UPDATE country
SET capital = (select id from city WHERE name = 'Smallville')
WHERE CODE = 'USA'

-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

DELETE
--SELECT *
FROM city
WHERE id= (select id from city WHERE name = 'Smallville')

--*******IT FAILED, WE ENCOUNTERED A CONSTRAINT WHEN TRYING TO DELETE IT BECAUSE ITS SET TO THE CAPITAL IT CANT BE DELETED.

-- 6. Return the US captial to Washington.

-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)

-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4079 rows affected)

-- 10. Assuming a country's surfacearea is expressed in square miles, convert it to 
-- square meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)
