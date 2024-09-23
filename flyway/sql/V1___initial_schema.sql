CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE,
  password CHAR(60),
  admin BOOLEAN DEFAULT FALSE,
  cart_id SERIAL UNIQUE
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),   -- who added the category
  name VARCHAR(255) UNIQUE
);

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),   -- who added the item
  category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  price INTEGER,
  image_link TEXT,
  description TEXT
);

CREATE TABLE item_ratings (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,   -- who made the rating
  item_id INTEGER REFERENCES items(id) ON DELETE CASCADE,
  rating INTEGER DEFAULT 5,   -- rating from 1 to 5 stars
  comment TEXT
);

CREATE TABLE carts (
  id INTEGER PRIMARY KEY REFERENCES users(cart_id),
  user_id INTEGER REFERENCES users(id)
);

-- Every item added to a cart will be registered as an entry in the `cart_items` table
CREATE TABLE cart_items (
  id SERIAL PRIMARY KEY,
  cart_id INTEGER REFERENCES carts(id) ON DELETE CASCADE,
  item_id INTEGER REFERENCES items(id) ON DELETE CASCADE,
  quantity INTEGER DEFAULT 1
);

CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,  
  cart_id INTEGER REFERENCES carts(id) ON DELETE CASCADE,
  item_charge NUMERIC,
  delivery_charge NUMERIC,
  total_charge NUMERIC GENERATED ALWAYS AS (item_charge + delivery_charge) STORED,
  payment_type TEXT,  
  delivery_address TEXT
);

CREATE UNIQUE INDEX ON users((lower(email)));

CREATE OR REPLACE FUNCTION insert_cart()
  RETURNS trigger AS
$$
BEGIN
        INSERT INTO carts (id, user_id) VALUES(NEW.cart_id, NEW.id);
    -- NEW is the new row that has been inserted into users table
    RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER cart_insertion
  AFTER INSERT 
  ON users
  FOR EACH ROW
  EXECUTE PROCEDURE insert_cart();
