import { executeQuery } from "../database/database.js";

const getItemDetails = async (itemId) => {
  const result = await executeQuery(
    "SELECT * FROM items WHERE id=$1;",
    itemId,
  );

  return result.rows;
};

const getItemRatings = async (itemId) => {
  const result = await executeQuery(
    "SELECT * FROM item_ratings WHERE item_id=$1;",
    itemId,
  );

  return result.rows;
};

const addToCart = async (cartId, itemId) => {
  await executeQuery(
    "INSERT INTO cart_items (cart_id, item_id) VALUES ($1, $2);",
    cartId,
    itemId,
  );
};

const removeFromCart = async (cartId, itemId) => {
  await executeQuery(
    "DELETE FROM cart_items WHERE cart_id=$1 AND item_id=$2;",
    cartId,
    itemId,
  );
};


const createItem = async (userId, categoryId, name, price, imageLink, description) => {
  await executeQuery(
    "INSERT INTO items (user_id, category_id, name, price, image_link, description) VALUES ($1, $2, $3, $4, $5, $6);",
    userId, 
    categoryId, 
    name, 
    price, 
    imageLink,
    description,
  );
};

const deleteItem = async (itemId) => {
  await executeQuery(
    "DELETE FROM items WHERE id=$1;",
    itemId,
  );
};

const createRating = async (userId, itemId, rating, comment) => {
  await executeQuery(
    "INSERT INTO item_ratings (user_id, item_id, rating, comment) VALUES ($1, $2, $3, $4);",
    userId,
    itemId,
    rating,
    comment,
  );
};

const deleteRating = async (ratingId) => {
  await executeQuery(
    "DELETE FROM item_ratings WHERE id=$1;",
    ratingId,
  );
};

export { getItemDetails, getItemRatings, addToCart, removeFromCart, createItem, deleteItem, createRating, deleteRating };
