
function onClickPlus () {
  var userAndMealInfo = document.getElementById("user-and-meal-info");
  var email = userAndMealInfo.getAttribute("data-user-mail");
  var token = userAndMealInfo.getAttribute("data-user-token");


  var meal_id = this.getAttribute("data-meal-id");
  var elementToChange = this.nextElementSibling
  var change = 1
  var number = Number.parseInt(elementToChange.innerHTML, 10) + change;
  sendPostRequestChoice(meal_id, number, email, token, elementToChange, change);
}

function onClickMinus () {
  var userAndMealInfo = document.getElementById("user-and-meal-info");
  var email = userAndMealInfo.getAttribute("data-user-mail");
  var token = userAndMealInfo.getAttribute("data-user-token");


  var meal_id = this.getAttribute("data-meal-id");
  var elementToChange = this.previousElementSibling
  var change = -1
  var number = Number.parseInt(elementToChange.innerHTML, 10) + change;
  if (number >= 0) {
    sendPostRequestChoice(meal_id, number,email, token, elementToChange, change);
  }
}

function sendPostRequestChoice (meal_id, value, email, token, elementToChange, change) {
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
      var btnValue = document.getElementById("order-btn")
      var newBtn = Number.parseInt((/\d+/.exec(btnValue.innerHTML))[0], 10) + change
      btnValue.innerHTML = "Order (".concat(newBtn,")")
      if (newBtn == 0){
        btnValue.classList.add('disabled');
      } else{
        btnValue.classList.remove('disabled');
      }
    });
}

function eventManagerChoice(){
  var allPlusQuantity = document.querySelectorAll(".ftft-plus.ftft-choice.fa-stack");
  var allMinusQuantity = document.querySelectorAll(".ftft-minus.ftft-choice.fa-stack");

  allPlusQuantity.forEach(function(btn) {
    btn.addEventListener("click", onClickPlus);
  });
  allMinusQuantity.forEach(function(btn) {
    btn.addEventListener("click", onClickMinus);
  });
}

document.addEventListener("DOMContentLoaded", function() {
  eventManagerChoice();
});
