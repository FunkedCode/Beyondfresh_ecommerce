

<template>
  <div class="add_to_cart">
    <footer class="card-footer">
      <button
        href="#"
        class="card-footer-item"
      >Add to cart</button>
    </footer>
  </div>
</template>
<script>
import Api from "api.js";

export default {
  data: function() {
    return {
      orders: []
    };
  },
  methods: {},
  beforeCreate: async function() {
    try {
      this.orders = await Api.getCartItems();
    } catch (httpError) {
      console.log(httpError);
    }
  },
  created() {
    // console.log("Nothing gets called before me!");
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>