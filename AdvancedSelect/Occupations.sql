-- Active: 1706937956652@@127.0.0.1@3306@HackerRankSQL
-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

-- Note: Print NULL when there are no more names corresponding to an occupation.

-- -------------------------------------------
-- CONCEPT "PARTITION BY"
--      SELECT name, occupation over (PARTITION BY occupation ORDER BY name) as rn FROM occupations;

-- CONCEPT PIVOT SYNTAX
    -- PIVOT SYNTAX

    -- SELECT <column/s> FROM
    -- (
    --     <source_query>
    -- )
    -- PIVOT(
    --     <aggr_function> (
    --         FOR <spreading_column> IN (<spreading_elements)
    --     )
    -- )


-- PIVOT(Max(name) FOR Occupation IN ('Doctor' as Doctor, 'Professor' as Professor, 'Singer' as Singer, 'Actor' as Actor)) FROM occupations;

-- PIVOT Functionality not available in MySQL SO USE THE CASE OR IF STATEMENT.

SELECT name, occupation, ROW_NUMBER() over (PARTITION BY occupation ORDER BY name) as rn FROM occupations;


-- USING IF STATEMENT
    SELECT name, occupation, ROW_NUMBER() over (PARTITION BY occupation ORDER BY name) ,
    IF(Occupation='Doctor', Name, NULL), 
    IF(Occupation='Professor', Name, NULL), 
    IF(Occupation='Singer', Name, NULL), 
    IF(Occupation='Actor', Name, NULL) 
    FROM occupations;

-- USING CASE STATEMENT

SELECT 
    name, 
    occupation, 
    ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name),
    CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END as Doctor,
    CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END as Professor,
    CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END as Singer,
    CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END as Actor
FROM 
    occupations;

SELECT Min(Doctor), Min(Professor), Max(Singer), Max(Actor) 
FROM (
        SELECT 
        name, 
        occupation, 
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name)as rn,
        CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END as Doctor,
        CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END as Professor,
        CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END as Singer,
        CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END as Actor
        FROM 
            occupations
)AS DerivedTable GROUP BY rn;


SELECT MIN(Doctor), MIN(Professor), MIN(Singer), MIN(Actor)
FROM (
        SELECT name, occupation, ROW_NUMBER() over (PARTITION BY occupation ORDER BY name) as rn,
            IF(Occupation='Doctor', Name, NULL) AS Doctor, 
            IF(Occupation='Professor', Name, NULL) AS Professor, 
            IF(Occupation='Singer', Name, NULL) AS Singer, 
            IF(Occupation='Actor', Name, NULL) AS Actor
            FROM occupations
) AS dt GROUP BY rn;
