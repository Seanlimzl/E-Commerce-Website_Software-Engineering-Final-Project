import { executeQuery } from "../database/database.js";

const removeDuplicatesFromCartItems = async () => {
  await executeQuery(
    "DELETE FROM cart_items a USING cart_items b WHERE a.id > b.id AND a.cart_id = b.cart_id AND a.item_id = b.item_id;"
  );
};

const listCarts = async () => {
  const result = await executeQuery(
    "SELECT * FROM carts ORDER BY user_id ASC;"
  );

  return result.rows;
};

const getCartItems = async (cartId) => {
  removeDuplicatesFromCartItems();
  const result = await executeQuery(
    "SELECT items.id, name, price, image_link, description, quantity FROM items INNER JOIN cart_items ON items.id = cart_items.item_id WHERE cart_id=$1;",
    cartId
  );
  return result.rows;
};

const modifyCart = async (cartId, itemId, quantity) => {
  await executeQuery(
    "UPDATE cart_items SET quantity=$3 WHERE cart_id=$1 AND item_id=$2);",
    cartId,
    itemId,
    quantity
  );
  // clean up: remove duplicates
  removeDuplicatesFromCartItems()

};

const deleteCartItem = async (cartId, itemId) => {
  await executeQuery(
    "DELETE FROM cart_items WHERE cart_id=$1 AND item_id=$2;",
    cartId,
    itemId,
  );
};

export { listCarts, getCartItems, modifyCart, deleteCartItem };
