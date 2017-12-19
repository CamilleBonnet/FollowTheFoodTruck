var allPlusQuantity = document.querySelectorAll(".ftft-plus.ftft-choice.fa-stack");
var allMinusQuantity = document.querySelectorAll(".ftft-minus.ftft-choice.fa-stack");
var userAndMealInfo = document.getElementById("user-and-meal-info");
var email = userAndMealInfo.getAttribute("data-user-mail");
var token = userAndMealInfo.getAttribute("data-user-token");
var btnValue = document.getElementById("order-btn")

function onClickPlus () {
  var meal_id = this.getAttribute("data-meal-id");
  var elementToChange = this.nextElementSibling
  var change = 1
  var number = Number.parseInt(elementToChange.innerHTML, 10) + change;
  sendPostRequest(meal_id, number, email, token, elementToChange, change);
}

function onClickMinus () {
  var meal_id = this.getAttribute("data-meal-id");
  var elementToChange = this.previousElementSibling
  var change = -1
  var number = Number.parseInt(elementToChange.innerHTML, 10) + change;
  if (number >= 0) {
    sendPostRequest(meal_id, number,email, token, elementToChange, change);
  }
}

function sendPostRequest (meal_id, value, email, token, elementToChange, change) {
  var myBody = {
    meal_id: meal_id,
    quantity: value
  };

  var myHeaders = new Headers();
  myHeaders.append("Content-Type", "application/json");
  myHeaders.append("X-Registration-Email", email);
  myHeaders.append("X-Registration-Token", token);

  var myRequest = {method: 'POST',
                 headers: myHeaders,
                 body: JSON.stringify(myBody)};

  fetch("/api/v1/update_choice", myRequest).then(
    function(answer) {
      elementToChange.innerHTML = value
      var newBtn = Number.parseInt((/\d+/.exec(btnValue.innerHTML))[0], 10) + change
      btnValue.innerHTML = "Order (".concat(newBtn,")")
    });
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
