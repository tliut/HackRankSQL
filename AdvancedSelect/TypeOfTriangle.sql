-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.

SELECT CASE
    WHEN a=b and a=c and b=c THEN "Equilateral"
    WHEN (a=b or b=c or a=c ) AND (A + B > C) THEN "Isosceles"
    WHEN (a+b > c) THEN "Scalene"
    ELSE "Not A Triangle"

END AS Triangle
    FROM Triangles;