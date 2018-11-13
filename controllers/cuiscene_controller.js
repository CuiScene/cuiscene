var express = require("express");

var router = express.Router();

var cuiscene = require("../models/cuiscene")

router.get("/", function(req, res) {
    cuiscene.selectAllFromTable("recipes", function(data) {
        var hbsObject = {
            recipes: data
        };
        console.log(hbsObject);
        res.render("index", hbsObject);
    });
});

router.post("/api/users", function(req, res) {
    cuiscene.insertNewUser([
      "username_pk",
      "birthday",
      "restrictions",
      "zipcode"
    ], [
      req.body.username_pk,
      req.body.birthday,
      req.body.restrictions,
      req.body.zipcode
    ], 
    function(result) {
      res.json({ id: result.insertId });
    });
});
  
module.exports = router;
  

