import TurbolinksAdapter from "vue-turbolinks";
import Vue from "vue";
import Nav from "../menu.vue";

Vue.use(TurbolinksAdapter);

document.addEventListener("turbolinks:load", () => {
  const el = document.getElementById("menu");
  if (el != null) {
    const app = new Vue({ el, render: h => h(Nav) });
  }
});
