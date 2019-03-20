

<template>
  <div id="menu">
    <nav
      class="navbar is-fixed"
      role="navigation"
      aria-label="main navigation"
    >
      <div class="navbar-brand">
        <!-- <%= link_to root_path do %>
        <figure class="image is-96x96"><%= image_tag(image_url("logo.png"),alt: 'logo') %></figure>
        <% end %>-->
        <a
          role="button"
          class="navbar-burger burger"
          aria-label="menu"
          aria-expanded="false"
          data-target="navbar"
          @click="showHam = !showHam"
          :class="{'is-active':showHam}"
        >
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>

      <div
        id="navbar"
        class="navbar-menu"
        :class="{'is-active':showHam}"
      >
        <div class="navbar-start">
          <div class="navbar-item has-dropdown is-hoverable">
            <!-- <%= link_to 'Products', products_path,class: 'navbar-link margin-medium' %> -->
            <a class="navbar-link margin-medium'">Products</a>
            <div class="navbar-dropdown">
              <!-- <% Category.where(is_main_category: true).each do |category| %> -->
              <a
                class="navbar-link is-hoverable"
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
  methods: {},
  created: async function() {
    try {
      this.catagories = await Api.getCategories();
      console.log(this.catagories);
      console.log("test");
    } catch (httpError) {
      console.log(httpError);
      console.log("test2");
    }
  },
  beforeCreate() {
    console.log("Nothing gets called before me!");
  }
  //   mounted: function() {
  //     // Get all "navbar-burger" elements
  //     const $navbarBurgers = Array.prototype.slice.call(
  //       document.querySelectorAll(".navbar-burger"),
  //       0
  //     );

  //     // Check if there are any navbar burgers
  //     if ($navbarBurgers.length > 0) {
  //       // Add a click event on each of them
  //       $navbarBurgers.forEach(el => {
  //         el.addEventListener("click", () => {
  //           // Get the target from the "data-target" attribute
  //           const target = el.dataset.target;
  //           const $target = document.getElementById(target);

  //           // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
  //           el.classList.toggle("is-active");
  //           $target.classList.toggle("is-active");
  //         });
  //       });
  //     }
  //   }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>