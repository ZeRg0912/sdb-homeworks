-- 1.2
CREATE USER 'sys_temp'@'localhost' IDENTIFIED BY '123456';

-- 1.3 
SELECT user, host FROM mysql.user;

-- 1.4
GRANT ALL PRIVILEGES ON *.* TO 'sys_temp'@'localhost';

-- 1.5
SHOW GRANTS FOR 'sys_temp'@'localhost';

-- help
ALTER USER 'sys_temp'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
FLUSH PRIVILEGES;