import Vue from "vue";
import Buefy from "buefy";
import "buefy/dist/buefy.css";
import App from "../app.vue";

Vue.use(Buefy);

document.addEventListener("DOMContentLoaded", () => {
  const el = document.body.appendChild(document.createElement("hello"));
  const app = new Vue({
    el,
    render: h => h(App)
  });

  console.log(app);
});
