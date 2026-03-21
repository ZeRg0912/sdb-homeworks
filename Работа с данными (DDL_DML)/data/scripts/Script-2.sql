SELECT 
    TABLE_NAME AS `Название таблицы`,
    COLUMN_NAME AS `Название первичного ключа`
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'sakila'
  AND CONSTRAINT_NAME = 'PRIMARY';