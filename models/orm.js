const connection = require('config/connection.js')

const orm = {
  insertOne: (table, cols, vals, cb) => {
    const queryString = 'INSERT INTO ?? (??) VALUES (?)'
    connection.query(queryString, [table, cols, vals], cb)
  },

  selectAllFromTable: (table, cb) => {
    const queryString = 'SELECT * FROM ??'
    connection.query(queryString, table, cb)
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
