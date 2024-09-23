import { validasaur } from "../../deps.js";
import * as itemsService from "../../services/itemsService.js";
import * as cartService from "../../services/cartService.js";

const data = {
  itemPage: true,
  itemId: "",
  details: {},
  ratings: [],
  errors: null,
};

const getData = async (request) => {
  const data = {
    rating: 5,
    comment: "",
  };

  if (request) {
    const body = request.body();
    const params = await body.value;
    data.rating = parseInt(params.get("rating"), 10);
    data.comment = params.get("comment");
  }

  return data;
};

const showItemDetailsAndRatings = async ({ render, params }) => {
  const catId = params.catId;
  const itemId = params.itemId;
  data.itemId = itemId;
  data.details = (await itemsService.getItemDetails(itemId))[0];
  data.ratings = (await itemsService.getItemRatings(itemId));
  render("itemPage.eta", data);
};

const addToCart = async ({ params, response }) => {
  console.log(`add to cart pressed`);
  const catId = params.catId;
  const itemId = params.itemId;
  const cartId = params.cartId;
  console.log(`adding to cart: ${catId}, ${itemId}, ${cartId}`);
  // TODO: Add a form for specifying quantity. As of now, default is 1
  await itemsService.addToCart(cartId, itemId);
  console.log(`added to cart. redirecting to categories/${catId}`);
  const cartItems = await cartService.getCartItems(cartId);
  console.log(`cart items:`);
  console.log(cartItems);
  response.redirect(`/categories/${catId}`);
};

const removeFromCart = async ({ params, response }) => {
  const catId = params.catId;
  const itemId = params.itemId;
  const cartId = params.cartId;
  console.log(`removing from cart: ${catId}, ${itemId}, ${cartId}`);
  // TODO: Add a form for specifying quantity. As of now, default is 1
  await itemsService.removeFromCart(cartId, itemId);
  console.log(`removed from cart. redirecting to categories/${catId}`);
  response.redirect(`/categories/${catId}`);
};

const deleteItem = async ({ response, params, render, user }) => {
  const isAdmin = user.admin;
  if (isAdmin) {
    const catId = params.catId;
    const itemId = params.itemId;
    await itemsService.deleteItem(itemId);
    response.redirect(`/categories/${catId}`);
  }
  else {
    render("singleCategoryPage.eta", data);
  }
};

const createRating = async ({ request, params, response, user }) => {
  const catId = params.catId;
  const itemId = params.itemId;
  const formData = await getData(request);
  const validationRules = {
    rating: [validasaur.required],
  };
  const [passes, errors] = await validasaur.validate(formData, validationRules);

  if (passes) {
    await itemsService.createRating(user.id, itemId, formData.rating, formData.comment);
    data.errors = null;
    response.redirect(`/categories/${catId}/items/${itemId}`);
  } else {
    data.errors = errors;
    render("singleCategoryPage.eta", data);
    }   
};

const deleteRating = async ({ response, params, user }) => {
  const catId = params.catId;
  const itemId = params.itemId;
  const ratingId = params.ratingId;
  const isAdmin = user.admin;
  if (isAdmin) {
    await itemsService.deleteRating(ratingId);
    response.redirect(`/categories/${catId}/items/${itemId}`);
  } else {
    response.redirect(`/categories/${catId}/items/${itemId}`);
  }
};

export { showItemDetailsAndRatings, addToCart, removeFromCart, deleteItem, createRating, deleteRating };
