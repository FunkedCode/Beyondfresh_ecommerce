

<template>
  <div id="order-window">
    <div class="tabs is-centered">
      <ul>
        <li
          v-bind:class="{ 'is-active': tabselect == 'current' }"
          @click="tabselect = 'current';"
        >
          <a>Current Order</a>
        </li>
        <li
          v-bind:class="{ 'is-active': tabselect == 'shipped' }"
          @click="tabselect = 'shipped'"
        >
          <a>Shipped</a>
        </li>
        <li
          v-bind:class="{ 'is-active': tabselect == 'placed' }"
          @click="tabselect = 'placed'"
        >
          <a>Placed</a>
        </li>
        <li
          v-bind:class="{ 'is-active': tabselect == 'cancelled' }"
          @click="tabselect = 'cancelled'"
        >
          <a>Cancelled</a>
        </li>
      </ul>
    </div>
    <div class="content">
      <div v-show="tabselect == 'current'">
        <div
          class="card"
          v-for="currentOrder in allOrders.filter(x => x.order_status_id === 1)"
        >
          <div class="card-header">
            <strong>Order#{{currentOrder['id']}}</strong>
          </div>
          <div class="card-content">
            <p
              v-for="(product) in currentProducts.filter(x => x.key === currentOrder['id'])"
            >{{product['value']['title']}}</p>
          </div>
        </div>
      </div>
      <div class="content">
        <div v-show="tabselect == 'placed'">
          <div
            class="card"
            v-for="placedOrder in allOrders.filter(x => x.order_status_id === 2)"
          >
            <div class="card-header">
              <strong>Order#{{placedOrder['id']}}</strong>
            </div>
            <div class="card-content">
              <p
                v-for="(product) in placedProducts.filter(x => x.key === placedOrder['id'])"
              >{{product['value']['title']}}</p>
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
      tabselect: "current",
      allOrders: [],
      currentProducts: [],
      placedProducts: []
    };
  },
  methods: {
    async getProducts(orders) {
      var products = [];
      for (let order of orders) {
        console.log(order["order_products"]);
        for (let product of order["order_products"]) {
          try {
            product = await Api.getProduct(product["product_id"]);
            products.push({
              key: order["id"],
              value: product
            });
          } catch (httpError) {
            console.log(httpError);
          }
        }
      }

      return products;
    }
  },
  created: async function() {
    try {
      this.allOrders = await Api.getOrders();

      this.currentProducts = await this.getProducts(
        this.allOrders.filter(x => x.order_status_id === 1)
      );
      this.placedProducts = await this.getProducts(
        this.allOrders.filter(x => x.order_status_id === 2)
      );
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