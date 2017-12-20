// function onPlaceChanged() {
//   var place = this.getPlace();
//   var components = getAddressComponents(place);

//   var searchAddress = document.getElementById('food_truck_address');
//   // searchAddress.blur();

//   var newFoodTruckAddress = document.getElementById('address_street_address');
//   newFoodTruckAddress.value = components.address;

//   var newFoodTruckAddressZipCode = document.getElementById('address_zipcode');
//   newFoodTruckAddressZipCode.value = components.zip_code;

//   var newFoodTruckAddressCity =  document.getElementById('address_city');
//   newFoodTruckAddressCity.value = components.city;

//   if (components.country_code) {
//     var selector = '#address_country option[value="' + components.country_code + '"]';
//     document.querySelector(selector).selected = true;
//   }
// }

// function getAddressComponents(place) {
//   // If you want lat/lng, you can look at:
//   // - place.geometry.location.lat()
//   // - place.geometry.location.lng()

//   if (window.console && typeof console.log === "function") {
//     // console.log(place);
//   }

//   var street_number = null;
//   var route = null;
//   var zip_code = null;
//   var city = null;
//   var country_code = null;
//   for (var i in place.address_components) {
//     var component = place.address_components[i];
//     for (var j in component.types) {
//       var type = component.types[j];
//       if (type === 'street_number') {
//         street_number = component.long_name;
//       } else if (type === 'route') {
//         route = component.long_name;
//       } else if (type === 'postal_code') {
//         zip_code = component.long_name;
//       } else if (type === 'locality') {
//         city = component.long_name;
//       } else if (type === 'postal_town' && city === null) {
//         city = component.long_name;
//       } else if (type === 'country') {
//         country_code = component.short_name;
//       }
//     }
//   }

//   return {
//     address: street_number === null ? route : (street_number + ' ' + route),
//     zip_code: zip_code,
//     city: city,
//     country_code: country_code
//   };
// }

// document.addEventListener("DOMContentLoaded", function() {
//   var foodTruckAddress = document.getElementById('food_truck_address');

//   if (foodTruckAddress) {
//     var autocomplete = new google.maps.places.Autocomplete(foodTruckAddress, { types: ['geocode'] });
//     google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
//     google.maps.event.addDomListener(foodTruckAddress, 'keydown', function(e) {
//       if (e.key === "Enter") {
//         e.preventDefault(); // Do not submit the form on Enter.
//       }
//     });
//   }

//   var foodTruckNewAddress = document.getElementById('address_street_address');

//   if (foodTruckNewAddress) {
//     var autocomplete = new google.maps.places.Autocomplete(foodTruckNewAddress, { types: ['geocode'] });
//     google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
//     google.maps.event.addDomListener(foodTruckNewAddress, 'keydown', function(e) {
//       if (e.key === "Enter") {
//         e.preventDefault(); // Do not submit the form on Enter.
//       }
//     });
//   }
// });
