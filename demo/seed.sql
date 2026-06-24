TRUNCATE TABLE payments, orders, branches, products, customers RESTART IDENTITY CASCADE;

INSERT INTO customers (customer_id, full_name, city) VALUES
  (1, 'Ana Lopez', 'Monterrey'),
  (2, 'Bruno Diaz', 'Guadalajara'),
  (3, 'Carla Mena', 'Monterrey');

INSERT INTO products (product_id, product_name, category) VALUES
  (10, 'Aurora Mouse', 'Perifericos'),
  (11, 'Nebula Keyboard', 'Perifericos'),
  (12, 'Orbit Monitor', 'Pantallas');

INSERT INTO branches (branch_id, branch_name, region) VALUES
  (1, 'Centro', 'Norte'),
  (2, 'Norte', 'Norte');

INSERT INTO orders (order_id, customer_id, branch_id, order_total, ordered_at) VALUES
  (1001, 1, 1, 1898.00, '2026-06-20 09:10:00'),
  (1002, 2, 2, 3299.00, '2026-06-20 11:30:00'),
  (1003, 3, 1, 6877.00, '2026-07-02 16:20:00');

INSERT INTO payments (payment_id, order_id, payment_method, payment_status, paid_amount) VALUES
  (501, 1001, 'card', 'confirmed', 1898.00),
  (502, 1002, 'transfer', 'confirmed', 3299.00),
  (503, 1003, 'card', 'pending', 6877.00);
