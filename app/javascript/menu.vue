

<template>
  <div id="menu">
    <nav
      class="navbar is-fixed-top box-shadow"
      role="navigation"
      aria-label="main navigation"
    >
      <div class="navbar-brand">
        <!-- <%= link_to root_path do %>
        <figure class="image is-96x96"><%= image_tag(image_url("logo.png"),alt: 'logo') %></figure>
        <% end %>-->
        <img v-bind:src="logo">
      </div>
      <div
        class="navbar-burger burger"
        role="button"
        aria-label="menu"
        aria-expanded="false"
        data-target="navbar"
        @click="showHam = !showHam"
        :class="{'is-active':showHam}"
      >
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </div>

      <div
        id="navbar"
        class="navbar-menu"
        :class="{'is-active':showHam}"
      >
        <div class="navbar-start">
          <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link margin-medium'">Products</a>
            <div class="navbar-dropdown">
              <a
                class="navbar-item is-hoverable"
                v-for="(category,index) in catagories"
                :key="index"
                v-if="category.is_main_category"
                v-bind:href="'/categories/'+ category.id"
              >{{category.name}}</a>
            </div>
          </div>
        </div>
        <div class="navbar-end">
          <div class="navbar-item">
            <div class="buttons">
              <a class="button is-primary">
                <strong>Sign up</strong>
              </a>
              <a class="button is-light">Log in</a>
            </div>
          </div>
        </div>
      </div>
    </nav>
  </div>
</template>
<script>
import Api from "api.js";

export default {
  data: function() {
    return {
      showHam: false,
      catagories: []
    };
  },
  computed: {
    logo() {
      return require("../assets/images/logo.png");
    }
  },
  methods: {},
  created: async function() {
    try {
      this.catagories = await Api.getCategories();
    } catch (httpError) {
      console.log(httpError);
    }
  },
  beforeCreate() {
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