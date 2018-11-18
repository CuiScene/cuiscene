const express = require('express')

const router = express.Router()

const orm = require('../models/orm')

const k = require('kyanite/dist/kyanite')

// The main view is actually going to be restaurant ratings. As written above, we would be displaying all the user information to anyone who visits the site.

router
  .get('/api/users', (req, res) => {
    console.log('prior to orm in get route')
    orm.selectAllFromTable(
      'users'
      // (err, data) => {
      //   if (err) {
      //     console.log('router error')
      //     throw err
      //   }
      //   console.log('daata returned')
      //   console.log('data', data)
      //   res.send(data)
      // }
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
  .get('/profile/recipes/saved', (req, res) => {
    orm.selectAllFromTableOrderBy(
      // table to select from
      'recipes',
      // columns to ORDER BY
      ['recipe_rating', 'recipe_name_pk'],
      // callback function
      (err, data) => {
        if (err) {
          throw err
        }
        console.log(data)
        res.render('profile', { savedRecipes: data })
      })
  })
  .post('/api/recipes/create', (req, res) => {
    const data = req.body
    orm.insertOne(
      'recipes',
      ['recipe_name_pk', 'username_fk', 'restaurant_name_fk', 'recipe_cuisine', 'recipe_tags', 'restaurant_menu_item'],
      [data.recipeName, localStorage.nickname, data.restaurantName, data.recipeCuisine, data.recipeTags, data.restaurantItem]
    )
      .then(() => orm.insertOne(
        'recipe_details',
        ['recipe_name_pk_fk', 'servings', 'serving_size', 'preptime', 'cooktime', 'ingredients', 'instructions'],
        [data.name, data.servings, data.size, data.prepTimeAmount, data.cookTimeAmount, data.ingredients, data.instructions]
      ))
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

router.post('/api/users', (req, res) => {
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
module.exports = router
