import { Router } from "../deps.js";
import * as homeController from "./controllers/homeController.js";
import * as aboutController from "./controllers/aboutController.js";
import * as contactController from "./controllers/contactController.js";
import * as registrationController from "./controllers/registrationController.js";
import * as loginController from "./controllers/loginController.js";
import * as categoriesController from "./controllers/categoriesController.js";
import * as singleCategoryController from "./controllers/singleCategoryController.js";
import * as itemsController from "./controllers/itemsController.js";
import * as cartController from "./controllers/cartController.js";
import * as paymentController from "./controllers/paymentController.js";
import * as searchController from "./controllers/searchController.js";

const router = new Router();

// EGROCERY

// Home page
router.get("/", homeController.showHome);

// About eGROCERY, Inc. 
router.get("/about", aboutController.showAboutInformation);

// Contact eGROCERY, Inc. 
router.get("/contact", contactController.showContactInformation);
router.post("/contact", contactController.sendMessage);

// Registration
router.get("/auth/register", registrationController.showRegistrationForm);
router.post("/auth/register", registrationController.registerUser);

// Authentication
router.get("/auth/login", loginController.showLoginForm);
router.post("/auth/login", loginController.authenticateUser);

// Categories page
router.get("/categories", categoriesController.listCategories);
router.post("/categories", categoriesController.createCategory);
router.post("/categories/:id/delete", categoriesController.deleteCategory);

// Single category page
router.get("/categories/:id", singleCategoryController.listItems);
router.post("/categories/:id/items", singleCategoryController.createItem);

// Items of category page
router.get("/categories/:catId/items/:itemId", itemsController.showItemDetailsAndRatings);
router.post("/categories/:catId/items/:itemId/addtocart/:cartId", itemsController.addToCart);
router.post("/categories/:catId/items/:itemId/removefromcart/:cartId", itemsController.removeFromCart);
router.post("/categories/:catId/items/:itemId/delete", itemsController.deleteItem);

router.post("/categories/:catId/items/:itemId/ratings", itemsController.createRating);
router.post("/categories/:catId/items/:itemId/ratings/:ratingId/delete", itemsController.deleteRating);

// Cart page
router.get("/cart/:id", cartController.listCartItems);
router.post("/cart/:id/checkout", cartController.checkout);   // sends cart data to paymentController
router.post("/cart/:id/items/:itemId/modifycart", cartController.modifyCart);
router.post("/cart/:id/items/:itemId/delete", cartController.deleteCartItem);

// Payment page
router.get("/cart/:id/payment", paymentController.showPaymentInformation);
router.post("/cart/:id/payment/:itemcharge/:deliverycharge", paymentController.pay);
router.get("/cart/:id/payment_confirmation", paymentController.showPaymentConfirmation);

// Search
router.get("/search", searchController.search);

export { router };
