$(function() {
  $(".create-form").on("submit", function(event) {
        // Make sure to preventDefault on a submit event.
        event.preventDefault();
    
        var newUser = {
          username_pk: $("#uname").val().trim(),
          birthday: $("#bday").val().trim(),
          restrictions: $("#restrict").val().trim(),
          zipcode: $("#zip").val().trim(),
        };
        console.log(newUser)
    
        // Send the POST request.
        $.ajax("/api/users", {
          type: "POST",
          data: newUser
        }).then(
          function() {
            console.log("created new user");
            // Reload the page to get the updated list
            location.reload();
          }
        );
      });
    });
