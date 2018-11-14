USE cuiscene_db;

INSERT INTO users (username_pk, date_created)
VALUES("User1", CURRENT_TIMESTAMP);

INSERT INTO restaurants (restaurant_name_pk, cuisine, location, rating)
VALUES ("valentinos", "italian", "Cleveland", null);

INSERT INTO recipes (recipe_name_pk, username_fk, recipe_cuisine, recipe_tags, restaurant_menu_item, restaurant_id_fk, restaurant_name_fk, recipe_rating, recipe_date)
VALUES ("Test Soup", "User1", "italian", "vegan", "soup", 1, 'valentinos', null, CURRENT_TIMESTAMP);
