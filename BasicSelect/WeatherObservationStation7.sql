-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT city FROM station
WHERE substring(lower(city),-1,1) IN ('a','e','i','o','u');