// var plusQuantity = document.getElementById("arrow-plus");
// var minusQuantity = document.getElementById("arrow-minus");
var allPlusQuantity = document.querySelectorAll(".ftft-plus.ftft-choice.fa-stack")
var allMinusQuantity = document.querySelectorAll(".ftft-minus.ftft-choice.fa-stack")


function onClickPlus () {

  var meal_id = this.getAttribute("data-meal-id");
  var number = Number.parseInt(this.nextElementSibling.innerHTML, 10) + 1;
  sendPostRequest(meal_id, number);

}

function onClickMinus () {

  var meal_id = this.getAttribute("data-meal-id");
  var number = Number.parseInt(this.previousElementSibling.innerHTML, 10) - 1;
  if (number < 0) {
    number = 0;
  }
  sendPostRequest(meal_id, number);
}

function sendPostRequest (meal_id, value) {
  // $post("/api/v1/update_meal", { meal_id: meal, quantity: value }, function(data) {
  //   quantity.innerHTML = data["quantity"]
  // })
  console.log(meal_id);
  console.log(value);
}

function eventManager(){
  allPlusQuantity.forEach((btn) => {
    btn.addEventListener("click", onClickPlus);
  })
  allMinusQuantity.forEach((btn) => {
    btn.addEventListener("click", onClickMinus);
  })
}


document.addEventListener("DOMContentLoaded", function() {
  eventManager();
});
