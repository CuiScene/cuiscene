const connection = require('../config/connection.js')

const orm = {
  insertOne: (table, cols, vals) =>
    new Promise((resolve, reject) => {
      const queryString = 'INSERT INTO ?? (??) VALUES (?)'
      connection.query(queryString, [table, cols, vals],
        (error, result) => {
          if (error) {
            return reject(error)
          }
          return resolve(result)
        })
    }),

  selectAllFromTable: (table) => {
    return new Promise((resolve, reject) => {
      const queryString = 'SELECT * FROM ??'
      connection.query(queryString, table,
        (error, result) => {
          if (error) {
            return reject(error)
          }
          return resolve(result)
        }
      )
    })
  },

  selectAllFromTableWhere: (table, whereCol, whereVal) => {
    return new Promise((resolve, reject) => {
      const queryString = 'SELECT * FROM ?? WHERE ?? = ?'
      connection.query(queryString, [table, whereCol, whereVal],
        (error, result) => {
          if (error) {
            return reject(error)
          }
          return resolve(result)
        }
      )
    })
  },

  selectAllFromTableOrderBy: (table, orderCols, cb) => {
    const queryString = 'SELECT * FROM ?? ORDER BY ??'
    connection.query(queryString, [table, orderCols], cb)
  },

  updateOne: (table, updateCol, updateVal, whereCol, whereVal, cb) => {
    const queryString = 'UPDATE ?? SET ?? = ? WHERE ?? = ?'
    connection.query(queryString, [table, updateCol, updateVal, whereCol, whereVal], cb)
  }

}

module.exports = orm
