$(document).ready(function() {
  document.querySelectorAll(".modal-button").forEach(function(el) {
    el.addEventListener("click", function() {
      console.log("test");
      var target = document.querySelector(el.getAttribute("data-target"));

      target.classList.add("is-active");

      target.querySelectorAll(".close").forEach(function(closeEl) {
        closeEl.addEventListener("click", function() {
          target.classList.remove("is-active");
        });
      });
    });
  });
});
