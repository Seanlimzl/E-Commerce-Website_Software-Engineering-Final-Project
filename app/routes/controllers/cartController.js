import * as cartService from "../../services/cartService.js";

const data = {
  cartPage: true,
  cartId: "",
  items: [],
  totalItemCharge: 0,
  deliveryCharge: 0,
  totalCharge: 0
};

const getData = async (request) => {
  const data = {
    quantity: 1,
  };

  if (request) {
    const body = request.body();
    const params = await body.value;
    data.quantity = params.get("quantity");
  }

  return data;
};

const listCartItems = async ({ render, params, user }) => {
  const cartId = params.id;
  data.cartId = cartId;
  console.log(`cart id is: ${cartId}`);
  const cartItems = await cartService.getCartItems(cartId);
  console.log(cartItems);
  data.items = cartItems;
  render("cartPage.eta", data);
};

const modifyCart = async ({ request, params, response, user }) => {
  const cartId = params.id;
  const itemId = params.itemId;
  const formData = await getData(request);
  if (formData.quantity === 0) {
    await cartService.deleteCartItem(cartId, itemId);
  } else {
    await cartService.modifyCart(cartId, itemId, formData.quantity);
  }
  response.redirect(`/cart/${cartId}`);
};

const deleteCartItem = async ({ response, params, user }) => {
  const cartId = params.id;
  const itemId = params.itemId;
  console.log(`deleting cart item ${cartId}, ${itemId}`)
  await cartService.deleteCartItem(cartId, itemId);
  response.redirect(`/cart/${cartId}`);
};

const checkout = async ({ params, render }) => {
  const cartId = params.id;
  // compute charges
  var total = 0;
  data.items.forEach((item) => total += item.price);
  data.totalItemCharge = total;
  data.deliveryCharge = Math.floor(Math.random() * 10) + 1;
  data.totalCharge = data.totalItemCharge + data.deliveryCharge;
  render("paymentPage.eta", data);
};

export { listCartItems, modifyCart, deleteCartItem, checkout };
