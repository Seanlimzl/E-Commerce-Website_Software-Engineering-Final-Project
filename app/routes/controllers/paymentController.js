import { createPayment, getPaymentInformation } from "../../services/paymentService.js";

const data = {
  paymentInfo: null,
  paymentPage: true,
  paymentConfirmationPage: false,
};

const getData = async (request) => {
  const data = {
    cartId: "",
    name: 0,
    cardNumber: 0,
    email: "",
    address: "",
  };

  if (request) {
    const body = request.body();
    const params = await body.value;
    data.name = params.get("name");
    data.cardNumber = params.get("card_number");
    data.email = params.get("email");
    data.address = params.get("address");
  }

  return data;
};

const showPaymentInformation = async ({ render, params, user }) => {
  const cartId = params.id;
  const paymentInfo = await getPaymentInformation(user.id, cartId);
  data.paymentInfo = paymentInfo;
  render("paymentInformation.eta", data);
};

const pay = async ({ request, params, response, render, user }) => {
  const userId = user.id;
  const cartId = params.id;
  const itemCharge = params.itemcharge;
  const deliveryCharge = params.deliverycharge;
  const paymentType = "Card";
  const formData = await getData(request);
  await createPayment(userId, cartId, itemCharge, deliveryCharge, paymentType, formData.address);
  response.redirect(`/cart/${cartId}/payment_confirmation`);
};

const showPaymentConfirmation = async ({ render }) => {
  data.paymentConfirmationPage = true;
  render("paymentConfirmationPage.eta", data);
};

export { showPaymentInformation, pay, showPaymentConfirmation };
