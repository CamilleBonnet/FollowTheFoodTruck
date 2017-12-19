// var plusQuantity = document.getElementById("arrow-plus");
// var minusQuantity = document.getElementById("arrow-minus");
var allPlusQuantity = document.querySelectorAll(".ftft-plus.ftft-choice.fa-stack")
var allMinusQuantity = document.querySelectorAll(".ftft-minus.ftft-choice.fa-stack")


function sendPostRequest (meal_id, value) {
    // $post("/api/v1/update_meal", { meal_id: meal, quantity: value }, function(data) {
    //   quantity.innerHTML = data["quantity"]
    // })
    console.log(meal_id);
    console.log(value);
  this.classList.toggle('fa-stack');
}

function eventManager(){
  allPlusQuantity.forEach((btn) => {
    console.log(btn)
    btn.addEventListener("click", sendPostRequest(btn.data("data-meal-id"), btn.innerHTML + 1));
  })
  allMinusQuantity.forEach((btn) => {
    btn.addEventListener("click", sendPostRequest());
  })
}


document.addEventListener("DOMContentLoaded", function() {
  eventManager();
});
