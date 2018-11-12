const connection = require('../config/connection')

const orm = {
  insertNewUser: function(cols, vals, cb) {
    var queryString = "INSERT INTO users (username_pk, birthday, restrictions, zipcode) VALUES (";
    
    queryString += '"' + vals[0] + '"'+ ", " + '"'+ vals[1] + '"'+ ", " + '"'+ vals[2] + '"'+ ", " + '"'+ vals[3] + '"' + ")";
    console.log(queryString);

    connection.query(queryString, function(err, result) {
      if (err) {
        throw err;
      }

      cb(result);
    });
  },

  selectAllFromTable: function(tableInput, cb) {
    var queryString = "SELECT * FROM " + tableInput + ";";
    connection.query(queryString, function(err, result) {
      if (err) {
        throw err;
      }
      cb(result);
    });
  },

  selectAllFromTableWhere: (table, whereCol, whereVal, cb) => {
    const queryString = 'SELECT * FROM ?? WHERE ?? = ?'
    connection.query(queryString, [table, whereCol, whereVal], cb)
  },

  updateOne: (table, updateCol, updateVal, whereCol, whereVal, cb) => {
    const queryString = 'UPDATE ?? SET ?? = ? WHERE ?? = ?'
    connection.query(queryString, [table, updateCol, updateVal, whereCol, whereVal], cb)
  }

}

module.exports = orm