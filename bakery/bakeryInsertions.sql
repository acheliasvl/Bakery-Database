delete from SweetProducts; 
delete from SaltyProducts; 

INSERT INTO SweetProducts VALUES (101, 'Cookies', 2.0, 'Chocolate');
INSERT INTO SweetProducts VALUES (102, 'Brownies', 5.0, 'Chocolate');
INSERT INTO SweetProducts VALUES (103, 'Strawberry Cheesecake', 7.0, 'Cheese and Strawberry');
INSERT INTO SweetProducts VALUES (104, 'Classical Cheesecake', 7.0, 'Cheese');
INSERT INTO SweetProducts VALUES (105, 'Dragon Fruit Cheesecake', 7.5, 'Cheese and Dragon Fruit');
INSERT INTO SweetProducts VALUES (106, 'Blueberry Muffin', 3.5, 'Blueberry');
INSERT INTO SweetProducts VALUES (107, 'Caramel Donut', 2.5, 'Caramel');
INSERT INTO SweetProducts VALUES (108, 'Vanilla Cupcake', 3.0, 'Vanilla');
INSERT INTO SweetProducts VALUES (109, 'Chocolate Croissant', 4.0, 'Chocolate');
INSERT INTO SweetProducts VALUES (110, 'Tiramisu Slice', 6.5, 'Coffee & Cream');

INSERT INTO SaltyProducts VALUES (101, 'Olive Bread', 2.0, 'Olive');
INSERT INTO SaltyProducts VALUES (102, 'Sausage Rolls', 4.0, 'Sausage');
INSERT INTO SaltyProducts VALUES (103, 'Garlic Rolls', 3.0, 'Garlic');
INSERT INTO SaltyProducts VALUES (104, 'Pretzel', 2.5, 'Salt');
INSERT INTO SaltyProducts VALUES (105, 'Cheese Bagel', 3.5, 'Cheese');
INSERT INTO SaltyProducts VALUES (106, 'Feta Pastry', 3.0, 'Cheese');
INSERT INTO SaltyProducts VALUES (107, 'Mini Pizza', 5.0, 'Tomato & Cheese');
INSERT INTO SaltyProducts VALUES (108, 'Butter Croissant', 3.5, 'Butter');


INSERT INTO Customers VALUES (1, 'Alex', 'Green', 'alex@example.com');
INSERT INTO Customers VALUES (2, 'Marry', 'Lopez', 'maria@example.com');
INSERT INTO Customers VALUES (3, 'Bimba', 'Taylor', 'yuki@example.com');


INSERT INTO Orders VALUES (201, 1, '2025-10-25');
INSERT INTO Orders VALUES (202, 2, '2025-10-26');
INSERT INTO Orders VALUES (203, 3, '2025-10-26');
INSERT INTO Orders VALUES (204, 1, '2025-10-27');
INSERT INTO Orders VALUES (205, 2, '2024-10-26');
INSERT INTO Orders VALUES (206, 1, '2024-10-27');


-- Alex buys two sweet items
INSERT INTO SweetOrderItems VALUES (201, 101, 2);  -- Cookies x2
INSERT INTO SweetOrderItems VALUES (201, 102, 1);  -- Brownies x1

-- Marry buys cheesecake
INSERT INTO SweetOrderItems VALUES (203, 103, 1);  -- Strawberry Cheesecake x1

-- Bimba buys a chocolate croissant (example ProductID 109)
INSERT INTO SweetOrderItems VALUES (204, 109, 3);  -- Chocolate Croissant x3

-- Alex buys garlic rolls
INSERT INTO SaltyOrderItems VALUES (201, 103, 2);  -- Garlic Rolls x2

-- Marry buys olive bread
INSERT INTO SaltyOrderItems VALUES (202, 101, 1);

-- Bimba buys sausage rolls (ProductID 102 example)
INSERT INTO SaltyOrderItems VALUES (203, 102, 2);

-- Alex buys mini pizza (ProductID 107 example)
INSERT INTO SaltyOrderItems VALUES (204, 107, 1);



