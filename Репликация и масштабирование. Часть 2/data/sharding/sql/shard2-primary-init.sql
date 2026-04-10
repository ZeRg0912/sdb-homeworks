CREATE DATABASE users_core_db;
CREATE DATABASE users_auth_db;
CREATE DATABASE books_core_db;
CREATE DATABASE books_text_db;
CREATE DATABASE shops_core_db;
CREATE DATABASE shops_info_db;

CREATE USER 'repl'@'%' IDENTIFIED BY 'replpass';
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'repl'@'%';
FLUSH PRIVILEGES;

USE users_core_db;
CREATE TABLE users_core (
    user_id BIGINT PRIMARY KEY,
    login VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(30),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) NOT NULL,
    CONSTRAINT chk_users_core_shard2 CHECK (user_id BETWEEN 1000001 AND 2000000)
);
CREATE INDEX idx_users_core_login ON users_core(login);
CREATE INDEX idx_users_core_email ON users_core(email);
CREATE INDEX idx_users_core_status ON users_core(status);

USE users_auth_db;
CREATE TABLE users_auth (
    user_id BIGINT PRIMARY KEY,
    password_hash VARCHAR(255) NOT NULL,
    CONSTRAINT chk_users_auth_shard2 CHECK (user_id BETWEEN 1000001 AND 2000000)
);

USE books_core_db;
CREATE TABLE books_core (
    book_id BIGINT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    isbn VARCHAR(50) NOT NULL,
    category VARCHAR(100),
    year INT,
    CONSTRAINT chk_books_core_shard2 CHECK (book_id BETWEEN 500001 AND 1000000)
);
CREATE INDEX idx_books_core_title ON books_core(title);
CREATE INDEX idx_books_core_author ON books_core(author);
CREATE INDEX idx_books_core_category ON books_core(category);
CREATE INDEX idx_books_core_isbn ON books_core(isbn);

USE books_text_db;
CREATE TABLE books_text (
    book_id BIGINT PRIMARY KEY,
    description TEXT,
    CONSTRAINT chk_books_text_shard2 CHECK (book_id BETWEEN 500001 AND 1000000)
);

USE shops_core_db;
CREATE TABLE shops_core (
    shop_id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    manager VARCHAR(255),
    CONSTRAINT chk_shops_core_shard2 CHECK (shop_id BETWEEN 100001 AND 200000)
);
CREATE INDEX idx_shops_core_name ON shops_core(name);
CREATE INDEX idx_shops_core_city ON shops_core(city);

USE shops_info_db;
CREATE TABLE shops_info (
    shop_id BIGINT PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    work_time VARCHAR(100),
    CONSTRAINT chk_shops_info_shard2 CHECK (shop_id BETWEEN 100001 AND 200000)
);
