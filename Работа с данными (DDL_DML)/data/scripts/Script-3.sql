SET PERSIST partial_revokes = ON;

REVOKE INSERT, UPDATE, DELETE ON sakila.* FROM 'sys_temp'@'localhost';

SHOW GRANTS FOR 'sys_temp'@'localhost';