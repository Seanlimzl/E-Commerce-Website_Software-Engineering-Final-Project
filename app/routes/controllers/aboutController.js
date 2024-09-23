const data = {
    aboutPage: true,
  };
  
const showAboutInformation = async ({ render }) => {

    render("aboutPage.eta", data);
};

export { showAboutInformation };
