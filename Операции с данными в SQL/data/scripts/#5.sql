SELECT
    SUBSTRING_INDEX(email, '@', 1) AS before_at,
    SUBSTRING_INDEX(email, '@', -1) AS after_at
FROM sakila.customer;