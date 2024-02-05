-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

-- The CITY table is described (see Images Folder)

SELECT name FROM CITY
WHERE countrycode = 'USA' AND population > 120000;