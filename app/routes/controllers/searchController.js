import * as searchService from "../../services/searchService.js";

const search = async ({ request, render }) => {
  const data = {
    searchTerm: "",
    searchResults: [],
    errors: null,
  };

  if (request) {
    const body = request.body();
    const params = await body.value;
    data.searchTerm = params.get("search_term");
    data.searchResults = await searchService.searchItems(data.searchTerm);
  }

  render("searchPage.eta", data);
};

export { search };
