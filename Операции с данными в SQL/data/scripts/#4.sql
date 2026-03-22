SELECT
    REPLACE(LOWER(first_name), 'll', 'pp') AS first_name,
    LOWER(last_name) AS last_name
FROM sakila.customer
WHERE active = 1
  AND first_name IN ('Kelly', 'Willie');