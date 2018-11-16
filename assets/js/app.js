
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
    'async': true,
    'crossDomain': true,
    'url': 'https://trackapi.nutritionix.com/v2/natural/nutrients',
    'method': 'POST',
    'headers': {
      'content-type': 'application/json',
      'accept': 'application/json',
      'x-app-id': 'c0d82573',
      'x-app-key': '7aa35984f679d0c7be1c01a88ec527be',
      'x-remote-user-id': '0',
      'cache-control': 'no-cache'
    },
    'processData': false,
    'data': '{ "query":"' + food + '", "timezone": "US/Eastern", "locale": "en_US" }'
  }

  $.ajax(settings).done(function (response) {
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

$('.btn-addingr').on('click', function() {
  var count = Number($(this).attr("data-count"))
  count +=1
  $(this).attr("data-count", count)
  var newDiv = $("<div>")
  var ping = $("<p>").text("Ingredient " + count)
  var newin = $("<input>")
  newin.attr("class", "ing" + count)
  var pam = $("<p>").text("Amount")
  var newin2 = $("<input>")
  newin2.attr("class", "am" + count)
  var nselect = $("<select>")
  nselect.attr("class", "amounttype" + count)
  var opt1 = $("<option>").attr("value", "cup").text("Cup")
  var opt2 = $("<option>").attr("value", "tbs").text("TBS")
  var opt3 = $("<option>").attr("value", "tsp").text("TSP")

  nselect.append(opt1)
  nselect.append(opt2)
  nselect.append(opt3)

  newDiv.append(ping)
  newDiv.append(newin)
  newDiv.append(pam)
  newDiv.append(newin2)
  newDiv.append(nselect)

  $(".indiv").append(newDiv)
})

$('.btn-addrecipe').on('click', function() {
  var count = Number($('.btn-addingr').attr("data-count"))
  var searchstring = ""
  for(i=1;i<count+1;i++) {
    searchstring += $(".am" + i).val() + " " + $(".amounttype" + i).val() + " " + $(".ing" + i).val() + " " 
  }
  nutritionix(searchstring)
})
