import TurbolinksAdapter from "vue-turbolinks";
import Vue from "vue";
import Cart from "../add_to_cart.vue";

Vue.use(TurbolinksAdapter);

document.addEventListener("turbolinks:load", () => {
  const el2 = document.getElementsByClassName("add_to_cart");
  if (el2 != null) {
    for (let i = 0; i < el2.length; i++) {
      const el = el2[i];
      const app = new Vue({ el, render: h => h(Cart) });
      console.log(el);
    }
  }
});
