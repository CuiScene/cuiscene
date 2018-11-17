const express = require('express')

const router = express.Router()

const orm = require('../models/orm')


router.post('/api/recipes', (req, res) => {
  orm.insertOne(
    // table to insert Into
    'recipes',
    // columns to insert into, listed as an array of strings
    ['recipe_name_pk', 'username_fk', 'restaurant_id_fk', 'restaurant_name_fk', 'recipe_cuisine', 'recipe_tags', 'restaurant_menu_item', 'recipe_rating','recipe_date'],
    // values to insert....Object.values will return an array of the values from the form
    Object.values(req.body),
    // callback function
    result => res.json({ id: result.insertId })
  )
});

router.post('/api/recipes_ratings', (req, res) => {
  orm.insertOne(
    // table to insert Into
    'recipe_ratings',
    // columns to insert into, listed as an array of strings
    ['recipe_name_fk', 'recipe_name_fk', 'recipe_rating','recipe_notes', 'date_submitted'],
    // values to insert....Object.values will return an array of the values from the form
    Object.values(req.body),
    // callback function
    result => res.json({ id: result.insertId })
  );
});
 
router.post('/api/recipes_details', (req, res) => {
  orm.insertOne(
    // table to insert Into
    'recipe_details',
    // columns to insert into, listed as an array of strings
    ['recipe_id_pk_fk', 'recipe_name_pk_fk', 'servings', 'serving_size', 'preptime', 'cooktime', 'ingredients', 'instructions'],
    // values to insert....Object.values will return an array of the values from the form
    Object.values(req.body),
    // callback function
    result => res.json({ id: result.insertId })
  )
});

module.exports = router