
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


var edamamNutritionSearch = function (title, ingr) {
  var queryurl = 'https://api.edamam.com/api/nutrition-details?app_id=$acb781d7&app_key=$46a9d8c42a9a6217ff47dae868a48873&title=$' + title + '&ingr=$' + ingr
  $.post({
    url: queryurl,
    dataType: 'json',
    contentType: 'application/json'
  })
    .then(function (response) {
      console.log(response)
    })
}

edamamNutritionSearch('buffalo chicken', ["chicken breast", "hot sauce", "butter"])