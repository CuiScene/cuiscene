USE cuiscene_db;

-- INSERT INTO users (username_pk, date_created)
-- VALUES("User1", CURRENT_TIMESTAMP);

-- INSERT INTO restaurants (restaurant_name_pk, cuisine, location, rating)
-- VALUES ("valentinos", "italian", "Cleveland", null);

-- INSERT INTO recipes (recipe_name_pk, username_fk, recipe_cuisine, recipe_tags, restaurant_menu_item, restaurant_name_fk, recipe_rating, recipe_date)
-- VALUES ("Test Soup", "User1", "italian", "vegan", "soup", 1, 'valentinos', null, CURRENT_TIMESTAMP);

INSERT INTO recipe_details (recipe_name_pk_fk, username_pk_fk, servings,serving_size, preptime, cooktime)
VALUES ("Veggie Soup","User1","8","1 cup","20 minutes","45 minutes");

-- INSERT INTO recipe_ratings (recipe_id_fk,recipe_name_fk,username_pk_fk,recipe_rating,recipe_notes,date_submitted)
-- VALUES ("1”,"Veggie Soup”,"User1”,"4","Perfect temperature and lots of veggies but was under-seasoned.",CURRENT_TIMESTAMP);
