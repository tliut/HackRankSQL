-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates


SELECT DISTINCT city FROM station
WHERE substring(lower(city),1,1) NOT IN ('a','e','i','o','u') OR substring(lower(city),-1,1) NOT IN ('a','e','i','o','u');