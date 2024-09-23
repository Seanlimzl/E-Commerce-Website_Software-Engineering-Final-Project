import { executeQuery } from "../database/database.js";

const createPayment = async (userId, cartId, itemCharge, deliveryCharge, paymentType, deliveryAddress) => {
  await executeQuery(
    "INSERT INTO payments (user_id, cart_id, item_charge, delivery_charge, payment_type, delivery_address) VALUES ($1, $2, $3, $4, $5, $6);",
    userId,
    cartId,
    itemCharge,
    deliveryCharge,
    paymentType,
    deliveryAddress
  );

  await executeQuery(
    "DELETE FROM cart_items WHERE cart_id=$1;",
    cartId
  );

};

const getPaymentInformation = async (userId, cartId) => {
  const result = await executeQuery(
    "SELECT * FROM payments WHERE user_id=$1 AND cart_id=$2;",
    userId,
    cartId
  );

  return result.rows;
};

export { createPayment, getPaymentInformation };