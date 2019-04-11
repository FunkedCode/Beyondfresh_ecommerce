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

  checkResponse: function (response, expectedStatus) {
    if (response.status !== expectedStatus) {
      throw new HttpError(response);
    }
  },
  getOrders: async function () {
    const response = await fetch("https://beyondfresh.herokuapp.com/orders.json");
    console.log(response);

    api.checkResponse(response, 200);
    return response.json();
  },
  getProduct: async function (product_id) {
    const response = await fetch("https://beyondfresh.herokuapp.com/products/" + product_id + ".json");
    console.log(response);

    api.checkResponse(response, 200);
    return response.json();
  }
};

export default api;
