import TurbolinksAdapter from "vue-turbolinks";
import Vue from "vue";
import Nav from "../order_window.vue";

Vue.use(TurbolinksAdapter);

document.addEventListener("turbolinks:load", () => {
  const el = document.getElementById("order-window");
  if (el != null) {
    const app = new Vue({ el, render: h => h(Nav) });
  }
});
