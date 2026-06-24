CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  full_name VARCHAR(120) NOT NULL,
  city VARCHAR(80) NOT NULL
);

CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  product_name VARCHAR(120) NOT NULL,
  category VARCHAR(80) NOT NULL
);

CREATE TABLE branches (
  branch_id INTEGER PRIMARY KEY,
  branch_name VARCHAR(80) NOT NULL,
  region VARCHAR(80) NOT NULL
);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES customers(customer_id),
  branch_id INTEGER NOT NULL REFERENCES branches(branch_id),
  order_total NUMERIC(10,2) NOT NULL CHECK (order_total >= 0),
  ordered_at TIMESTAMP NOT NULL
);

CREATE TABLE payments (
  payment_id INTEGER PRIMARY KEY,
  order_id INTEGER NOT NULL REFERENCES orders(order_id),
  payment_method VARCHAR(40) NOT NULL,
  payment_status VARCHAR(30) NOT NULL CHECK (payment_status IN ('pending', 'confirmed', 'failed')),
  paid_amount NUMERIC(10,2) NOT NULL CHECK (paid_amount >= 0)
);
