-- USE cuiscene_db;

-- INSERT INTO users (username_pk, date_created)
-- VALUES("User1", CURRENT_TIMESTAMP);
-- INSERT INTO users (username_pk, date_created) 
-- VALUES ('User2', CURRENT_TIMESTAMP);


-- INSERT INTO restaurants (id, restaurant_name_pk, cuisine, location, rating) 
-- VALUES (123, 'the jolly scholar', 'american', 'cleveland', null);
-- INSERT INTO restaurants (id, restaurant_name_pk, cuisine, location, rating) 
-- VALUES (12, 'barrio', 'mexican', 'cleveland', null);


-- INSERT INTO recipes (id, recipe_name_pk, username_fk, restaurant_id_fk, restaurant_name_fk, recipe_cuisine, recipe_tags, restaurant_menu_item, recipe_rating, recipe_date) 
-- VALUES (2, 'Test Sandwich', 'User1', 123, 'the jolly scholar', 'american', 'vegan', 'Test Sandwich', null, CURRENT_TIMESTAMP);
-- INSERT INTO recipes (id, recipe_name_pk, username_fk, restaurant_id_fk, restaurant_name_fk, recipe_cuisine, recipe_tags, restaurant_menu_item, recipe_rating, recipe_date) 
-- VALUES (1, 'Test Taco', 'User1', 12, 'barrio', 'mexican', 'vegan', 'Test Taco', null, CURRENT_TIMESTAMP);



-- INSERT INTO recipe_details (recipe_id_pk_fk, recipe_name_pk_fk, servings, serving_size, preptime, cooktime) 
-- VALUES (2, 'Test Taco', '4', '1', '15', '5');

-- INSERT INTO recipe_ratings (recipe_id_fk, recipe_name_fk, recipe_rating, recipe_notes, date_submitted) 
-- VALUES (1, 'Test Taco', 4, '\"The tacos were great and quick to prepare\"', CURRENT_TIMESTAMP);
-- INSERT INTO recipe_ratings (recipe_id_fk, recipe_name_fk, recipe_rating, recipe_notes, date_submitted) 
-- VALUES (2, 'Test Sandwich', 5, '\"The sandwich was very easy to assemble\"', CURRENT_TIMESTAMP);

-- INSERT INTO recipe_ingredients (recipe_id_pk_fk, recipe_name_pk_fk, ingredient1_name, ingredient1_amount) 
-- VALUES (1, 'Test Taco', 'ground beef', '1/2 lbs');
-- INSERT INTO recipe_ingredients (recipe_id_pk_fk, recipe_name_pk_fk, ingredient1_name, ingredient1_amount) 
-- VALUES (1, 'Test Taco', 'taco shell', '6');


-- INSERT INTO user_entries (id, restaurant_name, date, meal_time, menu_item, notes, rating, price, username_fk) 
-- VALUES (12, 'barrio', CURRENT_TIMESTAMP, 'Breakfast', 'Test Taco', 'Delicious', 5, .02, 'User1');

USE cuiscene_db;

INSERT INTO recipe_instructions (recipe_id_pk_fk, recipe_name_pk_fk, step_one) 
VALUES (1, 'Test Taco', 'Season ground beef');