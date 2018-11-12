var orm = require("../models/orm")

var cuiscene = {
  selectAllFromTable: function(table, cb) {
    orm.selectAllFromTable(table, function(res) {
      cb(res);
    });
  },
  insertNewUser: function(cols, vals, cb) {
    orm.insertNewUser(cols, vals, function(res) {
      cb(res);
    });
  },
};
  
module.exports = cuiscene;