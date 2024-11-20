CREATE TABLE customers (
id SERIAL PRIMARY KEY,
name TEXT,
address JSONB
);

INSERT INTO customers (name, address) VALUES ('John Doe', '{"street": "123 Main St", "city": "New York", "state": "NY", "zip" : "10001"}');

SELECT address->>'street' AS street, address->>'city' AS city, address->>'state' AS state, address->>'zip' AS zip
FROM customers
WHERE name = 'John Doe';
CREATE INDEX idx_customers_address_city ON customers ((address->>'city'));
SELECT name
FROM customers
WHERE address->>'city' = 'New York';
UPDATE customers
SET address = jsonb_set(address, '{city}", "Los Angeles"')
WHERE name = 'John Doe';
select * from customers;
UPDATE customers
SET address = address - 'zip'
WHERE name = 'John Doe';
select * from customers;
