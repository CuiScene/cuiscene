const express = require('express')

const router = express.Router()

const cuiscene = require('../models/cuiscene')

const orm = require('../models/orm')
// router.get('/', function (req, res) {
//   cuiscene.selectAllFromTable('users', function (data) {
//     const hbsObject = {
//       cuiscenes: data
//     }
//         console.log(hbsObject)
//         res.render('index', hbsObject)
//     })
// })

// The main view is actually going to be restaurant ratings. As written above, we would be displaying all the user information to anyone who visits the site.

router.get('/', (req, res) => {
  orm.selectAllFromTable(
    // table to select from
    'restaurants',
    // callback function
    (err, data) => {
      if (err) {
        throw err
      }
      res.render('index', { restaurants: data })
    })
})

// router.post('/api/users', function (req, res) {
//   cuiscene.insertNewUser([
//     'username_pk',
//     'birthday',
//     'restrictions',
//     'zipcode'
//   ], [
//     req.body.username_pk,
//     req.body.birthday,
//     req.body.restrictions,
//     req.body.zipcode
//   ],
//   function (result) {
//     res.json({ id: result.insertId })
//   })
// })

router.post('/api/users', (req, res) => {
  orm.insertOne(
    // table to insert Into
    'users',
    // columns to insert into, listed as an array of strings
    ['username_pk', 'birthday', 'restrictions', 'zipcode'],
    // values to insert....Object.values will return an array of the values from the form
    Object.values(req.body),
    // callback function
    result => res.json({ id: result.insertId })
  )
})
module.exports = router
