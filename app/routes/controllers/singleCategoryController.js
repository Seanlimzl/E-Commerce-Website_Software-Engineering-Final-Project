import { validasaur } from "../../deps.js";
import * as categoriesService from "../../services/categoriesService.js";
import * as itemsService from "../../services/itemsService.js";

const data = {
    singleCategoryPage: true,
    categoryId: "",
    cartId: "",
    itemName: "",
    itemPrice: 0.0,
    itemImageLink: "",
    itemDescription: "",
    items: [],
    errors: null,
};

const getData = async (request) => {
  const data = {
    itemName: "",
    itemPrice: 0.0,
    itemImageLink: "",
    itemDescription: "",
  };

  if (request) {
    const body = request.body();
    const params = await body.value;
    data.itemName = params.get("name");
    data.itemPrice = params.get("price");
    data.itemImageLink = params.get("imageLink");
    data.itemDescription = params.get("description");
  }

  return data;
};

const createItem = async ({ request, response, render, params, user }) => {
  const categoryId = params.id;
  data.categoryId = categoryId;
  const formData = await getData(request);
  const validationRules = {
    itemName: [validasaur.required],
    itemPrice: [validasaur.required],
  };
  const [passes, errors] = await validasaur.validate(formData, validationRules);

  if (passes) {
    await itemsService.createItem(user.id, categoryId, formData.itemName, formData.itemPrice, formData.itemImageLink, formData.itemDescription);
    data.errors = null;
    console.log(`redirecting to /categories/${categoryId}`);
    response.redirect(`/categories/${categoryId}`);
  } else {
    data.itemName = formData.itemName;
    data.itemPrice = formData.itemPrice;
    data.itemImageLink = formData.itemImageLink;
    data.itemDescription = formData.itemDescription;
    data.errors = errors;
    render("singleCategoryPage.eta", data);

    }   
};

const listItems = async ({ render, params, user }) => {
  const categoryId = params.id;
  console.log(`listing items with catId ${categoryId}`);
  const cartId = user.cart_id;
  data.categoryId = categoryId;
  data.cartId = cartId;
  // console.log(`${categoryId}, ${cartId}`);
  data.items = await categoriesService.getCategoryItems(categoryId);
  console.log(`logging items after getting...`)
  // console.log(data.items);
  console.log(`logged items.`)
  render("singleCategoryPage.eta", data);
};

export { listItems, createItem };
