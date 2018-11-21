const express = require('express')

const router = express.Router()

const orm = require('../models/orm')

const k = require('kyanite/dist/kyanite')

// The main view is actually going to be restaurant ratings. As written above, we would be displaying all the user information to anyone who visits the site.

router
  .get('/api/users', (req, res) => {
    orm.selectAllFromTable(
      'users'
    )
      .then(rows => res.send(rows))
      .catch(new Error('error...'))
  })
  .get('/', (req, res) => {
    let recipeData = {}
    let restaurantData = {}
    orm.selectAllFromTable('restaurants')
      .then(rows => {
        restaurantData = k.amend(restaurantData, rows)
        return orm.selectAllFromTable('recipes')
      })
      .then(result => {
        recipeData = k.amend(recipeData, result)
        res.render('index', { recipes: recipeData, restaurants: restaurantData })
      })
      .catch(new Error('error getting data'))
  })
  .get('/api/recipes/my', (req, res) => {
    const user = req.body
    orm.selectAllFromTableWhere(
      // table to select from
      'recipes', 'username_fk', user.nickname
    )
      .then(results => res.render('index', { recipes: results }))
  })
  .get('/api/experiences', (req, res) => {
    const user = req.body
    orm.selectAllFromTableWhere(
      // table to select from
      'user_entries', 'username_fk', user.nickname
    )
      .then(results => res.render('index', { user_entries: results }))
  })
  .post('/api/recipes/create', (req, res) => {
    const data = req.body
    orm.insertOne(
      'recipes',
      ['recipe_name_pk', 'username_fk', 'id', 'restaurant_name_fk', 'recipe_cuisine', 'recipe_tags', 'restaurant_menu_item'],
      [data.recipeName, data.username, data.restaurantId, data.restaurantName, data.recipeCuisine, data.recipeTags, data.restaurantItem]
    )
      .then(() => orm.insertOne(
        'recipe_details',
        ['recipe_name_pk_fk', 'servings', 'preptime', 'cooktime', 'ingredients', 'instructions'],
        [data.recipeName, data.servings, data.prepTimeAmount, data.cookTimeAmount, data.ingredients, data.instructions]
      ))
      .then(() => orm.selectAllFromTableWhere('recipes', 'username_fk', data.username))
      .then(results => res.render('index', { recipes: results }))
      .catch(new Error('error on insert'))
  })
  .post('/api/users/create', (req, res) => {
    orm.insertOne(
      // table to insert Into
      'users',
      // columns to insert into, listed as an array of strings
      'username_pk',
      // values to insert....Object.values will return an array of the values from the form
      req.body.username_pk,
      // callback function
      (error, result) => {
        if (error) {
          throw error
        }
        res.json({ id: result.insertId })
      }
    )
  })
  .post('/api/users', (req, res) => {
    orm.insertOne(
      // table to insert Into
      'users',
      // columns to insert into, listed as an array of strings
      ['username_pk', 'date_created'],
      // values to insert....Object.values will return an array of the values from the form
      Object.values(req.body),
      // callback function
      result => res.json({ id: result.insertId })
    )
  })
  .post('/api/userLog/create', (req, res) => {
    const data = req.body
    orm.insertOne(
      'user_entries',
      ['restaurant_name', 'date', 'meal_time', 'menu_item', 'notes', 'username_fk'],
      [data.restName, data.date, data.meal, data.item, data.notes, data.username],
      result => res.json({ id: result.insertId })
    )
      .then(() => orm.insertOne('restaurants', 'restaurant_name_pk', data.restName))
      .then(() => orm.selectAllFromTableWhere('user_entries', 'username_fk', data.username))
      .then(results => res.render('index', { user_entries: results }))
      .catch(new Error('error adding to log'))
  })

module.exports = router
