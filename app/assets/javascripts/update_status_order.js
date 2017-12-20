function sendPostRequest (basketId, email, token, status, elementToChange) {
  var myBody = {
    basket_id: basketId,
    status: status
  };

  var myHeaders = new Headers();
  myHeaders.append("Content-Type", "application/json");
  myHeaders.append("X-Registration-Email", email);
  myHeaders.append("X-Registration-Token", token);

  var myRequest = { method: 'POST',
                    headers: myHeaders,
                    body: JSON.stringify(myBody)
                  };

  fetch("/api/v1/update_status", myRequest).then(
    function(answer) {
      if (status == "Confirmed" ){
        elementToChange.innerHTML = status
        elementToChange.classList.add("accepted");
        elementToChange.classList.remove("declined");
      } else if (status == "Declined") {
        elementToChange.innerHTML = status
        elementToChange.classList.remove("accepted");
        elementToChange.classList.add("declined");
      }
    });
}


function onClickAccept () {
  var userAndBasketInfo = document.getElementById("user-and-basket-info");
  var email = userAndBasketInfo.getAttribute("data-user-mail");
  var token = userAndBasketInfo.getAttribute("data-user-token");
  var basketId = this.getAttribute("data-basket-id");
  var elementToChange = document.getElementById("basket-status");
  var status = "Confirmed"

  sendPostRequest(basketId, email, token, status, elementToChange)
}

function onClickDecline () {
  var userAndBasketInfo = document.getElementById("user-and-basket-info");
  var email = userAndBasketInfo.getAttribute("data-user-mail");
  var token = userAndBasketInfo.getAttribute("data-user-token");
  var basketId = this.getAttribute("data-basket-id");
  var elementToChange = document.getElementById("basket-status");
  var status = "Declined"
  sendPostRequest(basketId, email, token, status, elementToChange)
}

function eventManager(){
  var allAcceptButtons = document.querySelectorAll(".fa.fa-check");
  var allDeclineButtons = document.querySelectorAll(".fa.fa-times");

  allAcceptButtons.forEach((btn) => {
    btn.addEventListener("click", onClickAccept);
  })
  allDeclineButtons.forEach((btn) => {
    btn.addEventListener("click", onClickDecline);
  })

}

document.addEventListener("DOMContentLoaded", function() {
  eventManager();
});
