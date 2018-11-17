var zomatoSearch = function (restaurantSearch) {
  var queryurl = 'https://developers.zomato.com/api/v2.1/search?q=' + restaurantSearch
  $.ajax({
    url: queryurl,
    type: 'GET',
    dataType: 'json',
    headers: {
      'user-key': '46a9d8c42a9a6217ff47dae868a48873'
    }
  }).then(function (response) {
    console.log('response = ', response)
    updatePage(response)
  });
}

// /**
//  * takes API data (JSON/object) and turns it into elements on the page
// //  * @param {object} restaurantData - object containing zomato search API data
//  */

var updatePage = function (restaurantData) {

  console.log('a' + restaurantData)
  console.log('b' + restaurantData.restaurants)
  //Loop through restaurants and display on page
  //Requirement: Repeating element
  for (var i = 0; i < 10; i++) {

    var restaurant = restaurantData.restaurants[i].restaurant;

    // Create the  list group to contain the restaurants and add the restaurant content for each
    var $restaurantList = $("<ul>");
    $restaurantList.addClass("list-group");

    // Add the newly created element to the DOM
    $("#restaurant-list").append($restaurantList);

    // If the restaurant is available, log and append to $restaurantList
    var restaurantName = restaurant.name;
    var $restaurantListItem = $("<li class='list-group-item restaurantName'>");
    if (restaurantName) {
      $restaurantListItem.append(
        "<a href='" + restaurant.url + "' target='_blank'><strong>" + restaurantName + "</strong></a>");
    }
    var menu = restaurant.url;
    if (menu) {
      var menuLink = $("<a href='" + menu + "' target='_blank'>View Menu</a>");
      menuLink.addClass("menuLink");
      $restaurantListItem.append(menuLink);
    }

    // Append the ID to document if exists
    var restaurantId = restaurant.id;
    if (restaurantId) {
      $restaurantListItem.append("<h6> Zomato Restaurant ID:" + restaurantId + "</h6>");
    }

    // Append section to document if exists
    var cuisines = restaurant.cuisines;
    if (cuisines) {
      $restaurantListItem.append("<h6>Cuisines: " + cuisines + "</h6>");
    }

    // Append section to document if exists
    var locality = restaurant.location.locality_verbose;
    if (locality) {
      $restaurantListItem.append("<h6>Location: " + locality + "</h6>");
    }

    // Append section to document if exists
    var cuisines = restaurant.cuisines;
    if (cuisines) {
      $restaurantListItem.append("<h6>Cuisines: " + cuisines + "</h6>");
    }

    // Append the restaurant
    $restaurantList.append($restaurantListItem);
  }

}

$("#search").on("click", function (event) {

  event.preventDefault();

  //When user clicks search, reload the restaurants
  $("#restaurant-list").empty();
  var restaurantSearch = $("#restaurant-input").val()

  zomatoSearch(restaurantSearch)

});

var addingredient = function() {
  var count = Number($(".btn-addingr").attr("data-count"))
  count += 1
  $(".btn-addingr").attr("data-count", count)
  var newDiv = $("<div>")
  var ping = $("<p class=\"ingtag\">").text("Ingredient " + count + ":")
  var newin = $("<input>")
  var namdiv = $("<div class=\"amdiv\">")
  newin.attr("class", "ing ing" + count)
  var pam = $("<p class=\"amtag\">").text("Amount:")
  var newin2 = $("<select class=>")
  newin2.attr("class", "am am" + count)
  var nselect = $("<select>")
  nselect.attr("class", "am amounttype" + count)
  var opt1 = $("<option>").attr("value", "cup").text("Cup")
  var opt2 = $("<option>").attr("value", "tbs").text("TBS")
  var opt3 = $("<option>").attr("value", "tsp").text("TSP")
  var opt4 = $("<option>").attr("value", "oz").text("oz")

  for (i = 1; i < 11; i++) {
    var nopt = $("<option>").attr("value", i).text(i)
    newin2.append(nopt)
  }

  nselect.append(opt1)
  nselect.append(opt2)
  nselect.append(opt3)
  nselect.append(opt4)
  
  namdiv.append(pam)
  namdiv.append(newin2)
  namdiv.append(nselect)

  newDiv.append(ping)
  newDiv.append(newin)
  newDiv.append(namdiv)

  $(".indiv").append(newDiv)
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
    for(i=0;i<response.foods.length;i++) {
      console.log(response.foods[i])
      console.log(response.foods[i].nf_calories)
    }
  }).fail(function(jqXHR, textStatus, errorThrown){
    if(jqXHR.status == 404) {
      $(".errorp").text("ERROR: Ingredients not found")
      $(".errorp").css("display", "block")
    }
});
}

$(function () {
  $('.create-form').on('submit', function (event) {
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

// 'Add Ingredient' on click functionality
$('.btn-addingr').on('click', function () {
  addingredient();
})

// 'Add Instructions' on click functionality
$('.btn-addinst').on('click', function () {
  var count = Number($(this).attr("data-count"))
  count += 1
  $(this).attr("data-count", count)
  var newDiv = $("<div>")
  var pinst = $("<p>").text("Step " + count)
  var newinst = $("<input>")
  newinst.attr("id", "inst" + count)

  newDiv.append(pinst)
  newDiv.append(newinst)

  $(".indiv").append(newDiv)
})


// Matt's code for submit button on 'add recipe form'
$('.btn-addrecipe').on('click', function() {
  $(".errorp").css("display", "none");
  if($(".ing1").val().trim() === ""){
    $(".errorp").text("Ingredient 1 must have input")
    $(".errorp").css("display", "block")
    return
  }
  var count = Number($('.btn-addingr').attr("data-count"))
  var searchstring = ""

  for(i=1;i<count+1;i++) {
    searchstring += $(".am" + i).val() + " " + $(".amounttype" + i).val() + " " + $(".ing" + i).val() + " " 
    //$().push(".am" + i).val()
  }
  nutritionix(searchstring)
  $(".ing").val("")
})

addingredient()
addingredient()
addingredient()

// zomatoCitySearch('cleveland')
// zomatoSearch('barrio')

// code from sample online for serializeArray()
// $(document).ready(function() {
//   $(".btn-addrecipe").click(function(event) {
//     var newRecipe = $(".btn-addrecipe").serializeArray();
// newRecipe.push({
//   value: am1,
//   amount: amounttype1,
//   ingredient: ing1
// });
// jQuery.each( newRecipe, function( i, ingredients ) {
//   $( ".tab-area" ).append( ingredients.value + ' ' + ingredients.amount + " " + ingredients.ingredient + "<br />");
// });    
//   });
// });

// Test calls of our APIs
// zomatoSearch('valentinos')

