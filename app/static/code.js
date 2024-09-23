// Code to run when webpage loads (optional)
const retrieveContentFromApi = async () => {
  const response = await fetch("/api/magic");
  const json = await response.json();
  document.querySelector("#magic").innerHTML = json.magic;
};
