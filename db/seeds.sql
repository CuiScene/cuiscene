USE cuiscene_db;

-- INSERT INTO users (username_pk, birthday, restrictions, zipcode)
-- VALUES("User1", "01/01/01", "none-test", 44106);

-- INSERT INTO restaurants (restaurant_name_pk, cuisine, location, rating)
-- VALUES ("valentinos", "italian", "Cleveland", null);

INSERT INTO recipes (recipe_name, username_pk_fk, recipe_cuisine, recipe_tags, restaurant_menu_item, restaurant_id_fk, restaurant_name_fk, recipe_rating, recipe_date)
VALUES ("Test Soup", "User1", "italian", "vegan", "soup", 1, 'valentinos', null, "01/01/01");