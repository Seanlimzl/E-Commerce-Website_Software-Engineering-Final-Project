-- INSERT INTO users (email, password, admin)
--   VALUES ('nai@notadmin.com', '$2a$12$Rak6Y.JwgaMm5DdbjoasuO/ytCJs5gB5buaJDMlDZeAHwwfi9ZhrC', FALSE);

-- INSERT INTO users (email, password, admin)
--   VALUES ('other@notadmin.com', '$2a$12$KLtwFkEUGbOFVcuPBFzxgufjFIIjwcgWZsyjcT2MXauYs/QIH7DsS', FALSE);

-- INSERT INTO questions (user_id, topic_id, question_text)
--   VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'), (SELECT id FROM topics WHERE name = 'Finnish language'), 'What is the word for <black> in Finnish?');

-- INSERT INTO question_answer_options (question_id, option_text, is_correct)
--   VALUES ((SELECT id FROM questions WHERE question_text = 'What is the word for <black> in Finnish?'), 'Musta', true);

-- INSERT INTO question_answer_options (question_id, option_text, is_correct)
--   VALUES ((SELECT id FROM questions WHERE question_text = 'What is the word for <black> in Finnish?'), 'Valkoinen', FALSE);

-- INSERT INTO question_answers (user_id, question_id, question_answer_option_id)
--   VALUES ((SELECT id FROM users WHERE email = 'nai@notadmin.com'), (SELECT id FROM questions WHERE question_text = 'What is the word for <black> in Finnish?'),
--     (SELECT id FROM question_answer_options WHERE option_text = 'Musta'));

-- INSERT INTO question_answers (user_id, question_id, question_answer_option_id)
--   VALUES ((SELECT id FROM users WHERE email = 'other@notadmin.com'), (SELECT id FROM questions WHERE question_text = 'What is the word for <black> in Finnish?'),
--     (SELECT id FROM question_answer_options WHERE option_text = 'Valkoinen'));

-- INSERT STATEMENTS FOR DATABASE: remember to insert as admin, i.e. (SELECT id FROM users WHERE email = 'admin@admin.com' ...

-- eGrocery's one and only admin: email: admin@admin.com, password: 123456
INSERT INTO users (email, password, admin)
  VALUES ('admin@admin.com','$2a$10$IML8QCf6xA.alRbW.CG5PuvYc3Qs94vJvoTwbsSehs8s515cUMuZa', true); 

-- Categories

INSERT INTO categories (user_id, name)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'), 'Earrings');

INSERT INTO categories (user_id, name)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'), 'Bracelets');

INSERT INTO categories (user_id, name)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'), 'Necklaces');

INSERT INTO categories (user_id, name)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'), 'Hair Clips');

-- Items
-- Earrings

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'), 
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Bamboo Leaf Earrings',
          42.00, 
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/Untitled_Artwork12_837d68b9-ab4f-4bb5-82ea-7a6654572a6e_1080x.jpg?v=1676267202',
          'Beautiful');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'), 
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Shrink Plastic Tulip Earrings',
          28.00, 
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_0118_1024x1024@2x.jpg?v=1656408995',
          'Simple and elegant');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'), 
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Rainbow Flower Pearl Earrings',
          28.00, 
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_8314_1024x1024@2x.jpg?v=1646701373',
          'Effervescent and colorful');
                    
INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'), 
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Christmas Flower Earrings',
          28.00, 
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_18582_1024x1024@2x.jpg?v=1671401689',
          'Perfect for the holidays celebrations!');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'), 
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Peach Blossom Earrings',
          23.00, 
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_00902_1024x1024@2x.jpg?v=1656409378',
          'Gorgeous design');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Acrylic Feather Asymmetric Earrings',
          22.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_9578_1024x1024@2x.jpg?v=1652772911',
          'Feathery and bold');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Star Feather Flower Earrings',
          23.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/563B56B3-EF77-492D-950E-FF69FDA88A3D_1024x1024@2x.jpg?v=1664658057',
          'Starry and floral');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Colorful Lily (Style A/B) Earrings',
          26.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_9680_1024x1024@2x.jpg?v=1652777854',
          'Vibrant and stylish');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Lily Tassel Earrings',
          28.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_8865_1024x1024@2x.jpg?v=1651646566',
          'Floral and elegant');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Lesbian Pride Flower Earrings',
          30.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_8629_1024x1024@2x.jpg?v=1648433985',
          'Rainbow and floral');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Glazed Leaf Flower Earrings',
          30.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_9306-2_1024x1024@2x.jpg?v=1651644444',
          'Light and flattering');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Colorful Flower & Petal Earrings',
          30.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_9484_1024x1024@2x.jpg?v=1668199587',
          'Bright and fun');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Light Purple Sakura Earrings',
          32.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_9102_1024x1024@2x.jpg?v=1650162147',
          'Cherry blossom inspired');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Glazed Petal Earrings',
          32.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_1011_1024x1024@2x.jpg?v=1671403553',
          'Glossy and colorful');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Wisteria Earrings',
          32.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_0142_1024x1024@2x.jpg?v=1656407301',
          'Elegant and delicate');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Pomegranate Seed Earrings',
          32.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/45345345_1024x1024@2x.jpg?v=1669336743',
          'Unique and earthy');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Trumpet Flower Dreamcatcher Earrings',
          35.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_0079_1024x1024@2x.jpg?v=1656406718',
          'Boho and whimsical');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'No Piercing Transparent Bell Earrings',
          35.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_0313_1024x1024@2x.jpg?v=1658353495',
          'Unique and modern');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Earrings'),
          'Carrot Earrings',
          35.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/41311_1024x1024@2x.jpg?v=1669305765',
          'Whimsical and fun');

-- Bracelets

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'), 
          (SELECT id FROM categories WHERE name = 'Bracelets'),
          'Extended Rainbow Bracelets',
          46.00, 
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/DE9B780E-3DF1-4DB2-89A2-02F9AD9CC06D_1024x1024@2x.jpg?v=1668199111',
          'Long and fancy');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'), 
          (SELECT id FROM categories WHERE name = 'Bracelets'),
          'Rainbow Flower Bracelets',
          35.00, 
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_9816_1024x1024@2x.jpg?v=1658347833',
          'Mesmerizing Spring Flowers');

-- Necklaces

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Necklaces'),
          'Dainty Rose Heart Necklaces',
          48.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_7886_1024x1024@2x.jpg?v=1648430385',
          'Delicate and romantic');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Necklaces'),
          'Colorful Flower Necklaces',
          46.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/79523D4F-ECAF-44B1-ADF4-B057923C2EFF_1024x1024@2x.jpg?v=1671400369',
          'Vibrant and lively');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Necklaces'),
          'Queen Anne Lace Pressed Flower Necklaces',
          42.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_7144_1024x1024@2x.jpg?v=1648800241',
          'Elegant and delicate');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Necklaces'),
          'Carrot Necklaces',
          39.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/523423_1024x1024@2x.jpg?v=1669306588',
          'Whimsical and fun');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Necklaces'),
          'Rose & Lily Necklaces',
          39.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_0012_1024x1024@2x.jpg?v=1656408607',
          'Romantic and timeless');

-- Hair Clips

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Hair Clips'),
          'Christmas Apple Hair Clips',
          28.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_1725_1024x1024@2x.jpg?v=1671395273',
          'Festive and playful');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Hair Clips'),
          'Wild Berry Hair Claws',
          58.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_0517_1024x1024@2x.jpg?v=1661031028',
          'Bold and fruity');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Hair Clips'),
          'Cape Plumbago Hair Claws',
          49.99,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/211_1024x1024@2x.jpg?v=1664640968',
          'Simple and chic');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Hair Clips'),
          'Hydrangea Hair Claws',
          56.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_2454_1024x1024@2x.jpg?v=1676238085',
          'Beautiful and delicate');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Hair Clips'),
          'Hydrangea Gradient Hair Claws',
          56.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_2483_1024x1024@2x.jpg?v=1676238955',
          'Subtle and stylish');

INSERT INTO items (user_id, category_id, name, price, image_link, description)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM categories WHERE name = 'Hair Clips'),
          'Blue Princess Holly Pine Cones And Acorns Hair Claws',
          58.00,
          'https://cdn.shopify.com/s/files/1/0549/7552/9096/products/IMG_18602_1024x1024@2x.jpg?v=1671402592',
          'Regal and charming');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'), 
          (SELECT id FROM items WHERE name = 'Bamboo Leaf Earrings'),
          5, 
          'Best pair of bamboo leaf earrings!');

-- For the Shrink Plastic Tulip Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Shrink Plastic Tulip Earrings'),
          5,
          'Love the color and design!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Shrink Plastic Tulip Earrings'),
          5,
          'These earrings are simply adorable!');

--For the Rainbow Flower Pearl Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Rainbow Flower Pearl Earrings'),
          5,
          'Stunning colors and great quality!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Rainbow Flower Pearl Earrings'),
          4,
          'Lovely earrings, but a bit heavy for my ears!');

--For the Christmas Flower Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Christmas Flower Earrings'),
          5,
          'Perfect holiday earrings, very festive!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Christmas Flower Earrings'),
          5,
          'I received many compliments on these earrings!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Peach Blossom Earrings'),
          5,
          'Absolutely stunning, my new favorite earrings!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Peach Blossom Earrings'),
          4,
          'Very beautiful, but a bit smaller than expected!');

--For the Acrylic Feather Asymmetric Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Acrylic Feather Asymmetric Earrings'),
          5,
          'Love these earrings, they are so unique and stylish!');

--For the Star Feather Flower Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Star Feather Flower Earrings'),
          5,
          'These earrings are gorgeous, they really stand out!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Star Feather Flower Earrings'),
          5,
          'So happy with my purchase, I wear these earrings all the time!');

--For the Colorful Lily (Style A/B) Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Colorful Lily (Style A/B) Earrings'),
          5,
          'These earrings are so pretty, I get compliments every time I wear them!');

--For the Lily Tassel Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Lily Tassel Earrings'),
          4,
          'These earrings are cute, but the tassels can get tangled easily.');

--For the Glazed Leaf Flower Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Glazed Leaf Flower Earrings'),
          5,
          'These earrings are stunning, the glazed finish really adds a unique touch!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Glazed Leaf Flower Earrings'),
          3,
          'I expected these earrings to be larger based on the picture, but they are still pretty!');

--For the Colorful Flower & Petal Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Colorful Flower & Petal Earrings'),
          5,
          'These earrings are so vibrant and fun, they add a pop of color to any outfit!');

--For the Light Purple Sakura Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Light Purple Sakura Earrings'),
          4,
          'These earrings are delicate and beautiful, but a bit heavier than expected.');

--For the Glazed Petal Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Glazed Petal Earrings'),
          5,
          'These earrings are stunning, I love the unique shape and glazed finish!');

--For the Wisteria Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Wisteria Earrings'),
          5,
          'These earrings are so unique and lovely, I get compliments every time I wear them!');

--For the Pomegranate Seed Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Pomegranate Seed Earrings'),
          3,
          'These earrings are cute, but the seed shape is a bit too subtle for my taste.');

--For the Trumpet Flower Dreamcatcher Earrings:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Trumpet Flower Dreamcatcher Earrings'),
          5,
          'These earrings are amazing, the dreamcatcher detail is so unique and beautiful!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Trumpet Flower Dreamcatcher Earrings'),
          4,
          'I love the design of these earrings, but they are a bit heavier than I expected.');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'No Piercing Transparent Bell Earrings'),
          5,
          'These earrings are so cute and comfortable to wear!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'user1@mail.com'),
          (SELECT id FROM items WHERE name = 'No Piercing Transparent Bell Earrings'),
          4,
          'Love the design but they are a bit heavy on my ears.');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Carrot Earrings'),
          5,
          'So cute and unique! These earrings are perfect for any occasion.');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'user2@mail.com'),
          (SELECT id FROM items WHERE name = 'Extended Rainbow Bracelets'),
          5,
          'Love this bracelet! The colors are so vibrant.');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Rainbow Flower Bracelets'),
          4,
          'Very pretty and well-made, but a bit tight on my wrist.');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Dainty Rose Heart Necklaces'),
          5,
          'Absolutely love this necklace! It is dainty and delicate, yet very eye-catching.');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'user3@mail.com'),
          (SELECT id FROM items WHERE name = 'Dainty Rose Heart Necklaces'),
          4,
          'The necklace is beautiful, but the chain is a bit shorter than I expected.');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Colorful Flower Necklaces'),
          5,
          'I get so many compliments on this necklace! The colors are so vibrant and it is well-made.');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Queen Anne Lace Pressed Flower Necklaces'),
          5,
          'Absolutely beautiful and unique!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Carrot Necklaces'),
          4,
          'Cute and whimsical design, great for spring!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Rose & Lily Necklaces'),
          5,
          'So pretty and delicate, perfect for a romantic look!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Christmas Apple Hair Clips'),
          5,
          'These hair clips are the perfect touch for a festive holiday look!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Wild Berry Hair Claws'),
          4,
          'Great for holding thick hair, plus they look gorgeous!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Cape Plumbago Hair Claws'),
          5,
          'Love the color and the unique design of these hair claws!');

--For Hydrangea Hair Claws:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Hydrangea Hair Claws'),
          5,
          'These hair claws are perfect for keeping my hair in place and looking great all day!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'customer@customer.com'),
          (SELECT id FROM items WHERE name = 'Hydrangea Hair Claws'),
          4,
          'The color is not as vibrant as I expected, but they still look lovely in my hair.');

--For Hydrangea Gradient Hair Claws:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Hydrangea Gradient Hair Claws'),
          5,
          'These hair claws are so unique and the gradient effect is really beautiful!');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'customer@customer.com'),
          (SELECT id FROM items WHERE name = 'Hydrangea Gradient Hair Claws'),
          5,
          'Love these hair claws! They are super sturdy and I get compliments every time I wear them.');

--For Blue Princess Holly Pine Cones And Acorns Hair Claws:
INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'admin@admin.com'),
          (SELECT id FROM items WHERE name = 'Blue Princess Holly Pine Cones And Acorns Hair Claws'),
          4,
          'These hair claws are really cute and festive, but they do not hold my hair as well as I would like.');

INSERT INTO item_ratings (user_id, item_id, rating, comment)
  VALUES ((SELECT id FROM users WHERE email = 'customer@customer.com'),
          (SELECT id FROM items WHERE name = 'Blue Princess Holly Pine Cones And Acorns Hair Claws'),
          5,
          'I love these hair claws! They are perfect for the holiday season and they hold my hair in place all day long.');
