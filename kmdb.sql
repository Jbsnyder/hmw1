-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS persons;
DROP TABLE IF EXISTS roles;

-- Create new tables, according to your domain model
-- TODO!

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  release_year TEXT,
  mpaa_rating TEXT
  );

CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT
    );

CREATE TABLE roles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
 movie_id INTEGER,
 persons_id INTEGER,
 character_name TEXT,
 role TEXT
 );

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!
Insert into movies (title, release_year, mpaa_rating)
values  ('Batman Begins', '2005', 'PG-13');
Insert into movies (title, release_year, mpaa_rating)
values  ('The Dark Knight', '2008', 'PG-13');
Insert into movies (title, release_year, mpaa_rating)
values  ('The Dark Knight Rises', '2012', 'PG-13');

Insert into persons (first_name, last_name)
values  ('Christian', 'Bale');
Insert into persons (first_name, last_name)
values  ('Michael', 'Caine');
Insert into persons (first_name, last_name)
values  ('Liam', 'Neeson');
Insert into persons (first_name, last_name)
values  ('Katie', 'Holmes');
Insert into persons (first_name, last_name)
values  ('Gary', 'Oldman');
Insert into persons (first_name, last_name)
values  ('Heath', 'Ledger');
Insert into persons (first_name, last_name)
values  ('Aaron', 'Eckhart');
Insert into persons (first_name, last_name)
values  ('Maggie', 'Gyllenhaal');
Insert into persons (first_name, last_name)
values  ('Tom', 'Hardy');
Insert into persons (first_name, last_name)
values  ('Joseph', 'Gordon-Levitt');
Insert into persons (first_name, last_name)
values  ('Anne', 'Hathaway');
Insert into persons (first_name, last_name)
values  ('Christopher', 'Nolan');

Insert into roles (movie_id, persons_id, character_name, role)
values  (1, 1, 'Bruce Wayne', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (1, 2, 'Alfred', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (1, 3, "Ra's Al Ghul", 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (1, 4, 'Rachel Dawes', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (1, 5, 'Commissioner Gordon', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (1, 12, '', 'director');
Insert into roles (movie_id, persons_id, character_name, role)
values  (2, 1, 'Bruce Wayne', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (2, 6, 'Joker', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (2, 7, 'Harvey Dent', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (2, 2, 'Alfred', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (2, 8, 'Rachel Dawes', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (2, 12, '', 'director');
Insert into roles (movie_id, persons_id, character_name, role)
values  (3, 1, 'Bruce Wayne', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (3, 5, 'Commissioner Gordon', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (3, 9, 'Bane', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (3, 10, 'John Blake', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (3, 11, 'Selina Kyle', 'actor');
Insert into roles (movie_id, persons_id, character_name, role)
values  (3, 12, '', 'director');

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!

SELECT movies.title, movies.release_year, movies.mpaa_rating, persons.first_name, persons.last_name
FROM movies
INNER JOIN roles ON movies.id = roles.movie_id
INNER JOIN persons ON persons.id = roles.persons_id
WHERE roles.role = "director";

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!

SELECT movies.title, persons.first_name, persons.last_name, roles.character_name
from movies
INNER Join roles ON movies.id = roles.movie_id
INNER JOIN persons ON persons.id = roles.persons_id
WHERE roles.role = "actor";