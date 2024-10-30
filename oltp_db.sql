CREATE TABLE public.orders (
    order_id INT PRIMARY KEY,
    user_id INT REFERENCES person(user_id),
    total_amount INT,
    status VARCHAR(20)
);

INSERT INTO public.orders (order_id, user_id, total_amount, status)
VALUES
    (1, 1, 150, 'shipped'),
    (2, 2, 75, 'pending'),
    (3, 3, 200, 'delivered'),
    (4, 4, 120, 'pending'),
    (5, 5, 300, 'shipped');

   CREATE TABLE public.person (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    last_login VARCHAR(50),
    status VARCHAR(20)
);

-- Наполнение таблицы тестовыми данными
INSERT INTO public.person (user_id, username, email, last_login, status)
VALUES
    (1, 'john_doe', 'john.doe@example.com', '2024-10-12 10:00:00', 'active'),
    (2, 'jane_smith', 'jane.smith@example.com', '2024-10-11 08:30:00', 'inactive'),
    (3, 'alice_jones', 'alice.jones@example.com', '2024-10-10 15:45:00', 'active'),
    (4, 'bob_brown', 'bob.brown@example.com', NULL, 'active'),
    (5, 'charlie_white', 'charlie.white@example.com', '2024-10-13 12:00:00', 'inactive');
   
   
   
  CREATE TABLE public.products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255), -- Используем VARCHAR для описания
    price INT NOT NULL, -- Используем целочисленный тип
    stock_quantity INT NOT NULL,
    category VARCHAR(50)
);

-- Наполнение таблицы тестовыми данными
INSERT INTO public.products (product_id, name, description, price, stock_quantity, category)
VALUES
    (1, 'Laptop', 'High-performance laptop', 999, 50, 'Electronics'),
    (2, 'Smartphone', 'Latest model smartphone', 699, 150, 'Electronics'),
    (3, 'Coffee Maker', 'Automatic coffee maker', 85, 30, 'Home Appliances'),
    (4, 'Office Chair', 'Ergonomic office chair', 120, 80, 'Furniture'),
    (5, 'Bluetooth Headphones', 'Noise-cancelling headphones', 150, 200, 'Electronics');
   
   
   CREATE TABLE public.order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    price INT NOT NULL
);

-- Наполнение таблицы тестовыми данными
INSERT INTO public.order_items (order_item_id, order_id, product_id, quantity, price)
VALUES
    (1, 1, 1, 1, 999),
    (2, 1, 3, 2, 85),
    (3, 2, 2, 1, 699),
    (4, 3, 4, 1, 120),
    (5, 4, 5, 1, 150),
    (6, 5, 1, 3, 999);

CREATE TABLE public.reviews (
    review_id INT PRIMARY KEY,
    user_id INT REFERENCES person(user_id),
    product_id INT REFERENCES products(product_id),
    rating INT, -- Простое целое число для рейтинга
    review_text VARCHAR(255), -- Используем VARCHAR для текста отзыва
    created_at VARCHAR(50) -- Строковое представление даты
);

-- Наполнение таблицы тестовыми данными
INSERT INTO public.reviews (review_id, user_id, product_id, rating, review_text, created_at)
VALUES
    (1, 1, 1, 5, 'Amazing laptop, works perfectly for gaming!', '2024-10-12 10:00:00'),
    (2, 2, 2, 4, 'Good smartphone, but the battery life could be better.', '2024-10-11 08:30:00'),
    (3, 3, 3, 3, 'It’s okay, but I expected more from this brand.', '2024-10-10 15:45:00'),
    (4, 4, 4, 5, 'Very comfortable chair, I can work for hours without back pain.', '2024-10-13 12:00:00'),
    (5, 5, 5, 4, 'Great sound quality, but a little pricey.', '2024-10-11 09:00:00');

   
   
 CREATE TABLE public.payments (
    payment_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    amount INT, -- Используем целочисленный тип для суммы
    payment_method VARCHAR(50)
);

-- Наполнение таблицы тестовыми данными
INSERT INTO public.payments (payment_id, order_id, amount, payment_method)
VALUES
    (1, 1, 150, 'Credit Card'),
    (2, 2, 75, 'PayPal'),
    (3, 3, 200, 'Credit Card'),
    (4, 4, 120, 'Bank Transfer'),
    (5, 5, 300, 'Credit Card');


   CREATE TABLE public.shipping (
    shipping_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    shipping_address VARCHAR(255)
);

INSERT INTO public.shipping (shipping_id, order_id, shipping_address, shipping_status)
VALUES
    (1, 1, '1234 Elm St, Springfield', 'shipped'),
    (2, 2, '5678 Oak Rd, Shelbyville', 'pending'),
    (3, 3, '1357 Pine Ave, Capital City', 'delivered'),
    (4, 4, '2468 Maple Dr, Rivertown', 'pending'),
    (5, 5, '1020 Birch Blvd, Eastside', 'shipped');
   
   
 CREATE TABLE public.categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255) -- Используем VARCHAR для описания
);

-- Наполнение таблицы тестовыми данными
INSERT INTO public.categories (category_id, name, description)
VALUES
    (1, 'Electronics', 'Devices like smartphones, laptops, etc.'),
    (2, 'Home Appliances', 'Appliances for home use like refrigerators, coffee makers, etc.'),
    (3, 'Furniture', 'Office and home furniture like chairs, desks, etc.');
   
   
INSERT INTO public.users (username, email, password, created_at)
VALUES
    ('Nursultan', 'Nurs@example.com', 'password123', '2024-10-13 23:54:04.944591'),
    ('Sanzhar', 'Sanzh@example.com', 'password456', '2024-10-13 23:54:04.944591'),
    ('Arsen', 'Ars@example.com', 'password789', '2024-10-13 23:54:04.944591'),
    ('user4', 'user4@example.com', 'password101112', '2024-10-13 23:54:04.944591'),
    ('user5', 'user5@example.com', 'mypassword1', '2024-10-13 23:54:04.944591'),
    ('user6', 'user6@example.com', 'securepass2', '2024-10-13 23:54:04.944591'),
    ('user7', 'user7@example.com', '1234abcd', '2024-10-13 23:54:04.944591'),
    ('user8', 'user8@example.com', 'qwerty0987', '2024-10-13 23:54:04.944591'),
    ('user9', 'user9@example.com', 'password5678', '2024-10-13 23:54:04.944591'),
    ('user10', 'user10@example.com', 'simplepass123', '2024-10-13 23:54:04.944591'),
    ('user11', 'user11@example.com', 'hardpassword1', '2024-10-13 23:54:04.944591'),
    ('user12', 'user12@example.com', 'ilovecoding2', '2024-10-13 23:54:04.944591'),
    ('user13', 'user13@example.com', 'secret12345', '2024-10-13 23:54:04.944591'),
    ('user14', 'user14@example.com', '1234password', '2024-10-13 23:54:04.944591'),
    ('user15', 'user15@example.com', 'mysecurepassword', '2024-10-13 23:54:04.944591'),
    ('user16', 'user16@example.com', 'mypassword2024', '2024-10-13 23:54:04.944591'),
    ('user17', 'user17@example.com', 'coding1234', '2024-10-13 23:54:04.944591'),
    ('user18', 'user18@example.com', 'userpassword987', '2024-10-13 23:54:04.944591'),
    ('user19', 'user19@example.com', 'newpassword567', '2024-10-13 23:54:04.944591'),
    ('user20', 'user20@example.com', 'securepass321', '2024-10-13 23:54:04.944591');
   drop table if exists public.inventory cascade;
   CREATE TABLE public.inventory (
    id SERIAL,
    item_name VARCHAR(255) NOT NULL,
    item_description TEXT,
    item_type VARCHAR(100),
    available_count INT NOT NULL
);

INSERT INTO public.inventory (item_name, item_description, item_type, available_count)
VALUES
    ('The Matrix', 'A science fiction movie', 'Movie', 5),
    ('Inception', 'A thriller movie about dreams', 'Movie', 3),
    ('Warhammer 40k Rulebook', 'The rulebook for Warhammer 40k', 'Book', 10),
    ('The Lord of the Rings', 'A high fantasy novel', 'Book', 7),
    ('Action Figure - Iron Man', 'Iron Man action figure', 'Toy', 15),
    ('Electric Guitar', 'Fender electric guitar', 'Instrument', 2),
    ('Laptop HP', 'Laptop with 16GB RAM', 'Electronics', 3);

CREATE TABLE public.rental (
    rental_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    inventory_id INT NOT NULL,
    rental_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    return_date TIMESTAMP,
    FOREIGN KEY (inventory_id) REFERENCES inventory(id)
);

INSERT INTO public.rental (user_id, inventory_id, rental_date, return_date)
VALUES
    (1, 1, '2024-10-01 10:00:00', '2024-10-10 10:00:00'),
    (2, 3, '2024-10-02 12:00:00', '2024-10-15 12:00:00'),
    (3, 5, '2024-10-03 09:00:00', '2024-10-10 09:00:00'),
    (4, 7, '2024-10-04 14:00:00', '2024-10-20 14:00:00'),
    (1, 2, '2024-10-05 16:00:00', '2024-10-12 16:00:00'),
    (2, 4, '2024-10-06 08:00:00', '2024-10-14 08:00:00');

   
   CREATE TABLE public.payment (
    payment_id SERIAL PRIMARY KEY,
    rental_id INT NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50) NOT NULL,
    FOREIGN KEY (rental_id) REFERENCES rental(rental_id)
);

INSERT INTO public.payment (rental_id, payment_amount, payment_date, payment_method)
VALUES
    (1, 20.50, '2024-10-01 10:15:00', 'Credit Card'),
    (2, 15.00, '2024-10-02 12:10:00', 'Cash'),
    (3, 30.00, '2024-10-03 09:10:00', 'Debit Card'),
    (4, 40.00, '2024-10-04 14:15:00', 'Bank Transfer'),
    (5, 25.00, '2024-10-05 16:30:00', 'Credit Card'),
    (6, 12.00, '2024-10-06 08:20:00', 'PayPal');
   

