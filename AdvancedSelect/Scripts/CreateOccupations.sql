-- Active: 1706937956652@@127.0.0.1@3306@HackerRankSQL
-- DROP TABLE occupations;

CREATE TABLE occupations(
    ID int NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    occupation VARCHAR(255) NOT NULL
)

INSERT INTO occupations (name, occupation) 
Values
    ('Ashley', 'Professor'),
    ('Samantha', 'Actor'),
    ('Julia', 'Doctor'),
    ('Britney', 'Professor'),
    ('Maria', 'Professor'),
    ('Meera', 'Professor'),
    ('Priya', 'Doctor'),
    ('Priyanka', 'Professor'),
    ('Jennifer', 'Actor'),
    ('Ketty', 'Actor'),
    ('Belvet', 'Professor'),
    ('Naomi', 'Professor'),
    ('Jane', 'Singer'),
    ('Jenny', 'Singer'),
    ('Kristeen', 'Singer'),
    ('Christeen', 'Singer'),
    ('Eve', 'Actor'),
    ('Aamina', 'Doctor')