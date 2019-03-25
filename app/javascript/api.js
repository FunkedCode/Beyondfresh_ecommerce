class HttpError extends Error {
  constructor(response) {
    super(`${response.status} for ${response.url}`);
    this.name = "HttpError";
    this.response = response;
  }
}

const api = {
  headers: {
    "Content-type": "application/json; charset=utf-8",
    "X-CSRF-Token": document
      .querySelector('meta[name="csrf-token"]')
      .getAttribute("content")
  },

  checkResponse: function(response, expectedStatus) {
    if (response.status !== expectedStatus) {
      throw new HttpError(response);
    }
  },

  getCategories: async function() {
    const response = await fetch("http://localhost:3000/categories.json");
    console.log(response);

    api.checkResponse(response, 200);
    return response.json();
  },
  getCartItems: async function() {
    const response = await fetch("http://localhost:3000/orders.json");
    console.log(response);

    api.checkResponse(response, 200);
    return response.json();
  }
};

export default api;
