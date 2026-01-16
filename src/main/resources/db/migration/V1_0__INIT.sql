CREATE TABLE authors
(
    id         BIGSERIAL PRIMARY KEY,
    name       VARCHAR(255) NOT NULL,
    email      VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE books
(
    id               BIGSERIAL PRIMARY KEY,
    title            VARCHAR(255)       NOT NULL,
    isbn             VARCHAR(20) UNIQUE NOT NULL,
    publication_date DATE,
    author_id        BIGINT,
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES authors (id) ON DELETE SET NULL
);
INSERT INTO authors (name, email)
VALUES ('Лев Толстой', 'tolstoy@example.com'),
       ('Федор Достоевский', 'dostoevsky@example.com'),
       ('Антон Чехов', 'chekhov@example.com');

INSERT INTO books (title, isbn, publication_date, author_id)
VALUES ('Война и мир', '978-5-389-06256-6', '1869-01-01', 1),
       ('Анна Каренина', '978-5-699-17969-7', '1877-01-01', 1),
       ('Преступление и наказание', '978-5-17-090458-8', '1866-01-01', 2),
       ('Вишневый сад', '978-5-389-07475-0', '1904-01-01', 3);