

<template>
  <div id="order-window">
    <div class="tabs is-centered">
      <ul>
        <li
          v-bind:class="{ 'is-active': tabselect == 1 }"
          @click="tabselect = 1;"
        >
          <a>Current Order</a>
        </li>
        <li
          v-bind:class="{ 'is-active': tabselect == 3 }"
          @click="tabselect = 3"
        >
          <a>Shipped</a>
        </li>
        <li
          v-bind:class="{ 'is-active': tabselect == 2 }"
          @click="tabselect = 2"
        >
          <a>Placed</a>
        </li>
        <li
          v-bind:class="{ 'is-active': tabselect == 4 }"
          @click="tabselect = 4"
        >
          <a>Cancelled</a>
        </li>
      </ul>
    </div>
        <div
          class="card"
          v-for="currentOrder in allOrders.filter(x => x.order_status_id === tabselect)"
        >
          <div class="card-header">
            <strong>Order#{{currentOrder['id']}}</strong>
          </div>
          <div class="card-content">
            <div class="columns">
              <div class="column">
                  <div class=""
                    v-for="(product,index) in allProducts.filter(x => x.key === currentOrder['id'])"
                  >
                    <a v-bind:href="'/products/' + product['value']['id']"><h4>{{product['value']['title']}}</h4></a>
                    <small>Quantity: {{orderProducts.filter(y=> y.key === product['value']['id'])[0]['value']['qty']}}</small>
                    <small>Unit Price: {{orderProducts.filter(y=> y.key === product['value']['id'])[0]['value']['unit_price']}}</small>
                    <div class="is-divider"></div>
                  </div>
              </div>
              <div class="column">
                <p><strong>Subtotal:</strong> {{currentOrder['sub_total']}}</p>
                <p><strong>Tax:</strong> {{currentOrder['tax']}}</p>
                <p><strong>Shipping:</strong> {{currentOrder['shipping']}}</p>
                <p v-if="currentOrder['total'] != undefined"><strong>Total:</strong> {{currentOrder['total']}}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Api from "api.js";
import { async } from "q";

export default {
  data: function() {
    return {
      tabselect: 1,
      allOrders: [],
      allProducts: [],
      orderProducts: [],
    };
  },
  methods: {
    async getProducts(orders) {
      var products = [];
      for (let order of orders) {
        console.log(order["order_products"]);
        for (let orderProduct of order["order_products"]) {
          try {
            var product = await Api.getProduct(orderProduct["product_id"]);
            this.orderProducts.push({
              key: product["id"],
              value: orderProduct
            });
            this.allProducts.push({
              key: order["id"],
              value: product
            });
          } catch (httpError) {
            console.log(httpError);
          }
        }
      }
    }
  },
  created: async function() {
    try {
      this.allOrders = await Api.getOrders();

      await this.getProducts(this.allOrders);
    } catch (httpError) {
      console.log(httpError);
    }
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>