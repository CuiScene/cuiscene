USE cuiscene_db;

INSERT INTO users (username_pk, birthday, restrictions, zipcode)
VALUES("User1", "01/01/01", "none-test", 44106);

INSERT INTO restaurants (restaurant_name_pk, cuisine, location, rating)
VALUES ("Valentinos", "Italian", "Cleveland", null);
VALUES ("Pearl of the Orient", "Asian Fusion", "Rocky River", null);
VALUES ("Barrio Tremont", "Mexican", "Lakewood", null);
VALUES ("Barrocco", "Latin American", "Lakewood", null);
VALUES ("Carrabbas", "Italian", "Rocky River", null);
VALUES ("Brio", "Italian", "Rocky River", null);
VALUES ("Cafe Tandoor", "Indian", "Westlake", null);
VALUES ("Crave", "American", "Akron", null);
VALUES ("Astoria Cafe", "Mediterranean", "Cleveland", null);
VALUES ("Townhall", "Health Food", "Cleveland", null);
VALUES ("Minh Anh", "Vietnamese", "Cleveland", null);
VALUES ("La Dolce Vita", "Italian", "Cleveland", null);
VALUES ("Russo's", "Italian", "Penninsula", null);
VALUES ("Moxie's Bar and Grill", "American", "Lodi", null);
VALUES ("Amish Door Restaurant", "American", "Wilmot", null);
VALUES ("Luxe", "Mediterranean", "Cleveland", null);


INSERT INTO recipes (recipe_name, username_pk_fk, recipe_cuisine, recipe_tags, restaurant_menu_item, restaurant_id_fk, restaurant_name_fk, recipe_rating, recipe_date)
VALUES ("Test Soup", "User1", "italian", "vegan", "soup", 1, 'valentinos', null, "01/01/01");