USE cuiscene_db;

-- INSERT INTO users (username_pk,date_created)
-- VALUES("User1",CURRENT_TIMESTAMP);

-- INSERT INTO restaurants (id, restaurant_name_pk,cuisine,location,rating)
-- VALUES ("Valentinos","Italian","Cleveland",null);
-- VALUES ("Pearl of the Orient","Asian Fusion","Rocky River",null);
-- VALUES ("Barrio Tremont","Mexican","Lakewood",null);
-- VALUES ("4","Barrocco","Latin American","Lakewood",null);
-- VALUES ("5","Carrabbas","Italian","Rocky River",null);
-- VALUES ("6","Brio","Italian","Rocky River",null);
-- VALUES ("7","Cafe Tandoor","Indian","Westlake",null);
-- VALUES ("8","Crave","American","Akron",null);
-- VALUES ("Astoria Cafe","Mediterranean","Cleveland",null);
-- VALUES ("10","Townhall","Health Food","Cleveland",null);
-- VALUES ("11","Minh Anh","Vietnamese","Cleveland",null);
-- VALUES ("12","La Dolce Vita","Italian","Cleveland",null);
-- VALUES ("13","Russo's","Italian","Penninsula",null);
-- VALUES ("14","Moxie's Bar and Grill","American","Lodi",null);
-- VALUES ("15","Amish Door Restaurant","American","Wilmot",null);
-- VALUES ("16","Luxe","Mediterranean","Cleveland",null);
-- UPDATE restaurants SET id = '1' WHERE restaurant_name_pk = 'Barrio Tremont'
-- UPDATE restaurants SET restaurant_name_pk = 'Boney Fingers BBQ' WHERE id = '14' 
-- UPDATE recipes SET recipe_tags = 'vegetarian, dessert' WHERE id = '13'


-- INSERT INTO recipes (recipe_name_pk,username_fk,restaurant_id_fk,restaurant_name_fk,recipe_cuisine,recipe_tags,restaurant_menu_item,recipe_rating,recipe_date)
-- VALUES ("1","Veggie Soup","User1","2","Valentinos","Italian","vegan, gluten-free","Veggie Soup",null,CURRENT_TIMESTAMP);
-- VALUES ("2","Chicken Parmesan","User1","2","Valentinos","Italian",null,"Chicken Parmesan",null,CURRENT_TIMESTAMP);
-- VALUES ("3","White Pizza with Artichokes","User1","2","Valentinos","Italian","vegetarian","White Pizza with Artichokes, Small 10-Inch",null,CURRENT_TIMESTAMP);
-- VALUES ("4","Tempura Vegetables","User1","3","Pearl of the Orient","Asian Fusion","vegetarian","Tempura Vegetables",null,CURRENT_TIMESTAMP);
-- VALUES ("5","Seaweed Salad","User1","3","Pearl of the Orient","Asian Fusion","vegan","Seaweed Salad",null,CURRENT_TIMESTAMP);
-- VALUES ("6","Shrimp & Chicken with Cashews","3","Pearl of the Orient","Asian Fusion","gluten-free","Shrimp & Chicken with Cashews",null,CURRENT_TIMESTAMP);
-- VALUES ("7","Stoner Queso","User1","1","Barrio Tremont","Mexican","vegetarian, gluten-free","Stoner Queso",null,CURRENT_TIMESTAMP);
-- VALUES ("8","El Vegano Taco","User1","1","Barrio Tremont","Mexican","vegan","El Vegano Tacos",null,CURRENT_TIMESTAMP);
-- VALUES ("9","Chicken & Waffles","User1","1","Barrio Tremont","Mexican",null,"Chicken & Waffles",null,CURRENT_TIMESTAMP);
-- VALUES ("10","Braised Beef Cachapas","User1","4","Barrocco Arepa Bar","Latin American","gluten-free","Braised Beef Cachapas",null,CURRENT_TIMESTAMP);
-- VALUES ("11","Veggie Condado Cheese Dip","User1","4","Barrocco Arepa Bar","Latin American","vegetarian, gluten-free","Veggie Condado Cheese Dip",null,CURRENT_TIMESTAMP);
-- VALUES ("12","La Sucia Arepa","User1","4","Barrocco Arepa Bar","Latin American","gluten-free","La Sucia Arepa",null,CURRENT_TIMESTAMP);
-- VALUES ("Tiramisu","User1","5","Carrabbas","Italian","vegetarian","Tiramisu",null,CURRENT_TIMESTAMP);
-- VALUES ("Chicken Bryan","User1","5","Carrabbas","Italian","gluten-free, entree","Chicken Bryan",null,CURRENT_TIMESTAMP);
-- VALUES ("Minestrone","User1","5","Carrabbas","Italian","gluten-free, vegetarian, soup","Minestrone Soup",null,CURRENT_TIMESTAMP);
-- VALUES ("Scicilian Omelette","User1","6","Brio","Italian","brunch, entree","Scicilian Omelette",null,CURRENT_TIMESTAMP);
-- VALUES ("Roasted Red Pepper Bruschetta","User1","6","Brio","Italian","vegetarian, appetizer","Roasted Red Pepper Bruschetta",null,CURRENT_TIMESTAMP);
-- VALUES ("Grilled Salmon Fresca","User1","6","Brio","Italian","gluten-free, pescatarian, entree","Grilled Salmon Fresca",null,CURRENT_TIMESTAMP);
-- VALUES ("Tomato Shorwa","User1","7","Cafe Tandoor","Indian","vegan, soup","Tomato Shorwa Soup",null,CURRENT_TIMESTAMP);
-- VALUES ("Tandoori Lamb Chops","User1","7","Cafe Tandoor","Indian","entree","Tandoori Lamb Chops",null,CURRENT_TIMESTAMP);
-- VALUES ("Chicken Tikka Masala","User1","7","Cafe Tandoor","Indian","gluten-free, entree","Chicken Tikka Masala",null,CURRENT_TIMESTAMP);
-- VALUES ("Pierogis of Sweet Potato & Ricotta","User1","8","Crave","American","vegetarian, appetizer","Sweet Potato & Ricotta Pierogis",null,CURRENT_TIMESTAMP);
-- VALUES ("Stuffed Poblana","User1","8","Crave","American","vegan, entree","Stuffed Poblano",null,CURRENT_TIMESTAMP);
-- VALUES ("Flourless Chocolate Chili Cake","User1","8","Crave","American","gluten-free, vegetarian, dessert","Flourless Chocolate Chili Cake",null,CURRENT_TIMESTAMP);
-- VALUES ("Breakfast Pizza","User1","9","Astoria Cafe","Mediterranean","gluten-free, entree, brunch","Breakfast Pizza",null,CURRENT_TIMESTAMP);
-- VALUES ("Chicken Avgolemono","User1","9","Astoria Cafe","Mediterranean","gluten-free, soup","Chicken Avgolemono Soup",null,CURRENT_TIMESTAMP);
-- VALUES ("Seasonal Vegetables with Fava","User1","9","Astoria Cafe","Mediterranean","vegan, gluten-free, entree","Seasonal Vegetables with Fava",null,CURRENT_TIMESTAMP);
-- VALUES ("Spicy Curry Chicken Noodles","User1","10","Townhall","Health Food","gluten-free, entree, brunch","Spicy Curry Chicken Noodles",null,CURRENT_TIMESTAMP);
-- VALUES ("Sweet + Sour Chicken","User1","10","Townhall","Health Food","gluten-free, entree",'Sweet and Sour Chicken',null,CURRENT_TIMESTAMP);
-- VALUES ("Prosciutto Wrapped Dates","User1","10","Townhall","Health Food","gluten-free, appetizer","Prosciutto Wrapped Dates",null,CURRENT_TIMESTAMP);
-- VALUES ("Vegetarian Chop Suey","User1","11","Minh Anh","Vietnamese","vegetarian, entree","Vegetarian Chop Suey",null,CURRENT_TIMESTAMP);
-- VALUES ("Shrimp Crepe","User1","11","Minh Anh","Vietnamese","pescatarian, entree","Shrimp Crepe",null,CURRENT_TIMESTAMP);
-- VALUES ("Vegetarian Egg Roll","User1","11","Minh Anh","Vietnamese","vegetarian, appetizer","Vegetarian Egg Roll",null,CURRENT_TIMESTAMP);
-- VALUES ("Mastroianni Antipasti","User1","12","La Dolce Vita","Italian","gluten-free, vegetarian, appetizer","Mastroianni Antipasti",null,CURRENT_TIMESTAMP);
-- VALUES ("Banana Dolce Vita","User1","12","La Dolce Vita","Italian","vegetarian, dessert","Banana Dolce Vita",null,CURRENT_TIMESTAMP);
-- VALUES ("Ravioli Di Summer","User1","12","La Dolce Vita","Italian","vegetarian, entree","Ravioli Di Summer",null,CURRENT_TIMESTAMP);
-- VALUES ("Roasted Seasoned Brussels Sprouts","User1","13","Russo's","Italian","vegetarian, appetizer","Roasted Seasoned Brussels Sprouts",null,CURRENT_TIMESTAMP);
-- VALUES ("Seafood Creole","User1","13","Russo's","Italian","gluten-free, entree","Seafood Creole Rice Dish",null,CURRENT_TIMESTAMP);
-- VALUES ("Wild Mushroom Pasta","User1","13","Russo's","Italian","vegetarian, entree","Wild Mushroom Pasta",null,CURRENT_TIMESTAMP);
-- VALUES ("Polish Boy","User1","14","Boney Fingers BBQ","Barbecue","entree","Polish Boy",null,CURRENT_TIMESTAMP);
-- VALUES ("BBQ Baked Beans","User1","14","Boney Fingers BBQ","Barbecue","vegetarian, appetizer","BBQ Baked Beans",null,CURRENT_TIMESTAMP);
-- VALUES ("Brisket Hash","User1","14","Boney Fingers BBQ","Barbecue","breakfast","Brisket Hash",null,CURRENT_TIMESTAMP);
-- VALUES ("Biscuits & Sausage Gravy","User1","15","Amish Door Restaurant","American","breakfast","Biscuits & Sausage Gravy",null,CURRENT_TIMESTAMP);
-- VALUES ("Broasted Chicken Breast","User1","15","Amish Door Restaurant","American","entree","Broasted Chicken Breast",null,CURRENT_TIMESTAMP);
-- VALUES ("Black Raspberry Pie","User1","15","Amish Door Restaurant","American","dessert","Black Raspberry Pie",null,CURRENT_TIMESTAMP);
-- VALUES ("Chocolate Panna Cotta","User1","16","Luxe","Mediterranean","gluten-free, dessert","Chocolate Panna Cotta",null,CURRENT_TIMESTAMP);
-- VALUES ("Root Vegetable Burger","User1","16","Luxe","Mediterranean","vegetarian, entree","Root Vegetable Burger",null,CURRENT_TIMESTAMP);
-- VALUES ("Charred Octopus","User1","16","Luxe","Mediterranean","gluten-free, pescatarian, appetizer","Charred Octopus",null,CURRENT_TIMESTAMP);

-- INSERT INTO recipe_ratings (recipe_id_fk,recipe_name_fk,username_pk_fk,recipe_rating,recipe_notes,date_submitted)
-- VALUES ("1","Veggie Soup","User1","4","Perfect temperature and lots of veggies but was under-seasoned.",CURRENT_TIMESTAMP);

-- INSERT INTO recipe_details (recipe_id_pk_fk,recipe_name_pk_fk,username_pk_fk,servings,serving_size,preptime,cooktime)
-- VALUES ("1","Veggie Soup","User1","8","1 cup","20 minutes","45 minutes");

-- INSERT INTO recipe_ingredients (recipe_id_pk_fk,recipe_name_pk_fk,username_pk_fk,ingredient1_name,ingredient1_amount)
-- VALUES ("1","Veggie Soup","User1","carrots","1 cup");
-- VALUES ("1","Veggie Soup","User1","celery, chopped","1 cup");
-- VALUES ("1","Veggie Soup","User1","peas, shelled","1 cup");
-- VALUES ("1","Veggie Soup","User1","broccoli florets","1 cup");
-- VALUES ("1","Veggie Soup","User1","cauliflower florets","1 cup");
-- VALUES ("1","Veggie Soup","User1","mushrooms, sliced","1 cup");
-- VALUES ("1","Veggie Soup","User1","onion, chopped","0.5 cup");
-- VALUES ("1","Veggie Soup","User1","garlic, minced","2 tablespoons");
-- VALUES ("1","Veggie Soup","User1","olive oil","1 tablespoon");
-- VALUES ("1","Veggie Soup","User1","red wine vinegar","1 teaspoon");
-- VALUES ("1","Veggie Soup","User1","canned tomatoes, undrained","24 ounces");
-- VALUES ("1","Veggie Soup","User1","vegetable broth","4 cup");
-- VALUES ("1","Veggie Soup","User1","thyme","0.5 teaspoon");
-- VALUES ("1","Veggie Soup","User1","salt","1 teaspoon");
-- VALUES ("1","Veggie Soup","User1","black pepper, ground","0.5 teaspoon");
-- VALUES ("1","Veggie Soup","User1","bay leaves, whole","2");
-- UPDATE recipe_ingredients SET ingredient1_amount = 'carrots, chopped' WHERE recipe_id_pk_fk = '1'

INSERT INTO recipe_instructions (recipe_id_pk_fk,step_one,recipe_name_pk_fk,username_pk_fk)
VALUES ("1","Gather the ingredients and prep veggies.","Veggie Soup","User1");
VALUES ("1","Heat oil in a large soup or stock pot. Add the chopped onion, minced garlic, chopped celery, and sliced carrots. Sauté, stirring for 3 to 4 minutes, until onions are soft, but brown.","Veggie Soup","User1");
VALUES ("1","Add all other vegetables and heat for 4-5 minutes more.","Veggie Soup","User1");
VALUES ("1","Add salt, pepper, and thyme, stirring to coat the vegetables well.","Veggie Soup","User1");
VALUES ("1","Add bay leaf, vegetable broth, and undrained tomatoes. Bring to a boil, stir, reduce heat, and simmer until the vegetables are tender.","Veggie Soup","User1");
VALUES ("1","After 10-15 minutes, taste the soup and adjust seasonings as needed.","Veggie Soup","User1");
VALUES ("1","Remove the bay leaf and serve your homemade vegetable soup with a sprinkle of Parmesan cheese substitute and/or some crusty bread or crackers.","Veggie Soup","User1");