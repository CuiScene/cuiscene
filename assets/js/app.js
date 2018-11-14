
var zomatoCitySearch = function (city) {
  var queryurl = 'https://developers.zomato.com/api/v2.1/cities?q=' + city
  $.ajax({
    url: queryurl,
    type: 'GET',
    dataType: 'json',
    headers: { 'user-key': '46a9d8c42a9a6217ff47dae868a48873' }
  })
    .then(function (response) {
      console.log(response)
    })
}
var nutritionix = function (food) {
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": "https://trackapi.nutritionix.com/v2/natural/nutrients",
    "method": "POST",
    "headers": {
    "content-type": "application/json",
    "accept": "application/json",
    "x-app-id": "c0d82573",
    "x-app-key": "7aa35984f679d0c7be1c01a88ec527be",
    "x-remote-user-id": "0",
    "cache-control": "no-cache",
    },
    "processData": false,
    "data": "{ \"query\":\"" + food + "\", \"timezone\": \"US/Eastern\", \"locale\": \"en_US\" }"
  }


  $.ajax(settings).done(function (response) {
    console.log(response);
  });
}

$(function () {
  $('.create-form').on('submit', function (event) {
    // Make sure to preventDefault on a submit event.
    event.preventDefault()

    var newUser = {
      username_pk: $('#uname').val().trim(),
      birthday: $('#bday').val().trim(),
      restrictions: $('#restrict').val().trim(),
      zipcode: $('#zip').val().trim()
    }
    console.log(newUser)
    // Send the POST request.
    $.ajax('/api/users', {
      type: 'POST',
      data: newUser
    }).then(
      function () {
        console.log('created new user')
        // Reload the page to get the updated list
        // location.reload();
      }
    )
  })
})

zomatoCitySearch('cleveland')
nutritionix("for breakfast i ate 2 eggs, 3 strips of bacon, and 5 pounds carrots")

