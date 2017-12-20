// function sendPostRequestStatus (basketId, email, token, status, elementToChange) {
//   var myBody = {
//     basket_id: basketId,
//     status: status
//   };

//   var myHeaders = new Headers();
//   myHeaders.append("Content-Type", "application/json");
//   myHeaders.append("X-Registration-Email", email);
//   myHeaders.append("X-Registration-Token", token);

//   var myRequest = { method: 'POST',
//                     headers: myHeaders,
//                     body: JSON.stringify(myBody)
//                   };

//   fetch("/api/v1/update_status", myRequest).then(
//     function(answer) {
//       if (status == "Accepted by FoodTruck" ){
//         elementToChange.innerHTML = status
//         elementToChange.classList.add("accepted");
//         elementToChange.classList.remove("declined");
//       } else if (status == "Declined by FoodTruck") {
//         elementToChange.innerHTML = status
//         elementToChange.classList.remove("accepted");
//         elementToChange.classList.remove("pending");
//         elementToChange.classList.add("declined");
//       }
//     });
// }

// function onClickAccept () {
//   var userAndBasketInfo = document.getElementById("user-and-basket-info");
//   var email = userAndBasketInfo.getAttribute("data-user-mail");
//   var token = userAndBasketInfo.getAttribute("data-user-token");
//   var basketId = this.getAttribute("data-basket-id");
//   var elementToChange = document.getElementById("basket-status-".concat(basketId))
//   var status = "Accepted by FoodTruck";

//   sendPostRequestStatus(basketId, email, token, status, elementToChange);
// }

// function onClickDecline () {
//   var userAndBasketInfo = document.getElementById("user-and-basket-info");
//   var email = userAndBasketInfo.getAttribute("data-user-mail");
//   var token = userAndBasketInfo.getAttribute("data-user-token");
//   var basketId = this.getAttribute("data-basket-id");
//   var elementToChange = document.getElementById("basket-status-".concat(basketId))
//   var status = "Declined by FoodTruck";

//   sendPostRequestStatus(basketId, email, token, status, elementToChange);
// }

// function eventManagerStatus(){
//   var allAcceptButtons = document.querySelectorAll(".fa.fa-check");
//   var allDeclineButtons = document.querySelectorAll(".fa.fa-times");

//   allAcceptButtons.forEach(function(btn) {
//     btn.addEventListener("click", onClickAccept);
//   });
//   allDeclineButtons.forEach(function(btn) {
//     btn.addEventListener("click", onClickDecline);
//   });

// }

// document.addEventListener("DOMContentLoaded", function() {
//   eventManagerStatus();
// });
