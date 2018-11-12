const express = require('express')
const orm = require('../models/orm')

const router = express.Router()

router.get('/', (req, res) => {
  res.render('index', {})
})

// router.post('/api/restaurants', (req, res) => {
//   insertOne(
//     'restaurants',
//     ['restaurant_name', 'location', 'cuisine'],
//     [req.body.restaurant_name, req.body.location, req.body.cuisine],
//     result => console.log(res.json(result))
//   )
// })

// router.put('/api/restaurants/:id/:notes/:date', (req, res) => {
//   const id = req.params.id
//   const notes = req.params.notes
//   const date = req.params.date
//   console.log(req.params)
//   updateRestaurant(
//     notes, date, id,
//     () => {
//       res.changedRows === 0 ? res.status(404).end() : res.status(200).end()
//     })
// })

module.exports = router
