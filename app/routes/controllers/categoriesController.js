import { validasaur } from "../../deps.js";
import * as categoriesService from "../../services/categoriesService.js";
import * as userService from "../../services/userService.js";

const data = {
  categoriesPage: true,
  name: "",
  categories: [],
  errors: null
};

const getData = async (request) => {
  const data = {
    name: "",
  };

  if (request) {
    const body = request.body();
    const params = await body.value;
    data.name = params.get("name");
  }

  return data;
};

const createCategory = async ({ request, response, render, user }) => {
  const isAdmin = user.admin;
  if (isAdmin) {
    const formData = await getData(request);
    const validationRules = {
      name: [validasaur.required],
    };
    const [passes, errors] = await validasaur.validate(formData, validationRules);

    if (passes) {
      await categoriesService.createCategory(formData.name, user.id);
      data.errors = null;
      response.redirect("/categories");
    } else {
      data.name = formData.name;
      data.errors = errors;
      render("categoriesPage.eta", data);
    }
  } else {
    render("categoriesPage.eta", data);
  }
};

const deleteCategory = async ({ response, params, render, user }) => {
  const isAdmin = (await userService.isAdmin(user.email))[0].admin;
  if (isAdmin) {
    const id = params.id;
    await categoriesService.deleteCategory(id);
    response.redirect("/categories");
  } else {
    render("categoriesPage.eta", data);
  }
};

const listCategories = async ({ render }) => {
  data.categories = await categoriesService.listCategories();
  render("categoriesPage.eta", data);
};

export { listCategories, createCategory, deleteCategory };