// var plusQuantity = document.getElementById("arrow-plus");
// var minusQuantity = document.getElementById("arrow-minus");
var allPlusQuantity = document.querySelectorAll(".ftft-plus.ftft-choice.fa-stack")
var allMinusQuantity = document.querySelectorAll(".ftft-minus.ftft-choice.fa-stack")


function onClickPlus () {

  var meal_id = this.getAttribute("data-meal-id");
  var email = this.getAttribute("data-user-mail");
  var token = this.getAttribute("data-user-token");
  var elementToChange = this.nextElementSibling
  var number = Number.parseInt(elementToChange.innerHTML, 10) + 1;

  sendPostRequest(meal_id, number, email, token, elementToChange);
}

function onClickMinus () {

  var meal_id = this.getAttribute("data-meal-id");
  var number = Number.parseInt(this.previousElementSibling.innerHTML, 10) - 1;
  if (number < 0) {
    number = 0;
  }
  sendPostRequest(meal_id, number);
}

function sendPostRequest (meal_id, value, email, token, elementToChange) {
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
