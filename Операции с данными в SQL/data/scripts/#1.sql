SELECT DISTINCT district
FROM sakila.address
WHERE district LIKE 'K%a'
  AND district NOT LIKE '% %';