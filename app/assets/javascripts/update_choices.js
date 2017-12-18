function init(){

  var plusQuantity = document.getElementById("arrow-plus");

  plusQuantity.addEventListener("click", function() {
  //   $post("/api/v1/update_meal", { meal_id: quantity.data("meal-id"), quantity: (quantity.innerHTML +1) }, function(data) {
  //     quantity.innerHTML = data["quantity"]
  //   })
    plusQuantity.classList.remove('fa-stack');
  });

  var minusQuantity = document.getElementById("arrow-minus");

  minusQuantity.addEventListener("click", function() {
  //   $post("/api/v1/update_meal", { meal_id: quantity.data("meal-id"), quantity: (quantity.innerHTML +1) }, function(data) {
  //     quantity.innerHTML = data["quantity"]
  //   })
  minusQuantity.classList.remove('fa-stack');
  });
}


document.addEventListener("DOMContentLoaded", function() {
  init();
});
