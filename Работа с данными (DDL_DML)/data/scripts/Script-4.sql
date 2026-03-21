USE sakila;

SELECT COUNT(*) FROM actor;

INSERT INTO actor (first_name, last_name, last_update)
VALUES ('Test', 'User', NOW());

UPDATE actor
SET first_name = 'Denied'
WHERE 1 = 0;

DELETE FROM actor
WHERE 1 = 0;