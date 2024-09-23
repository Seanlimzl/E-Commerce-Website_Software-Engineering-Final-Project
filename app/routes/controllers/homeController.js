const data = {
  homePage: true,
};

const showHome = async ({ render }) => {

    render("home.eta", data);
};

export { showHome };
