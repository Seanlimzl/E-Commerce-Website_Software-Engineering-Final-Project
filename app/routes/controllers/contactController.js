// Use topicsController.js as a guide
import * as contactService from "../../services/contactService.js";

const data = {
    contactPage: true,
};

const getData = async (request) => {
    const data = {
      name: "",
      email: "",
      message: "",
    };
  
    if (request) {
      const body = request.body();
      const params = await body.value;
      data.name = params.get("name");
      data.email = params.get("email");
      data.message = params.get("message");
    }
  
    return data;
  };

const showContactInformation = async ({ render }) => {
    data.errors = null;
    data.name = "";
    render("contactPage.eta", data);
};

const sendMessage = async ({ request, response, render, user }) => {
    // TODO: implement me with Deno module
    const formData = await getData(request);
    data.name = formData.name;
    data.email = formData.email;
    data.message = formData.message;
    console.log(`${formData.name}'s message has been sent!`);
    render("contactPage.eta", data);
};

export { showContactInformation, sendMessage };
