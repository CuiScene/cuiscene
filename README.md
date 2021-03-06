# CuiScene 
![CuiScene App - Dashboard Image](https://github.com/CuiScene/cuiscene/blob/readme/assets/images/login-screenshot.png "CuiScene App Login Page")

![CuiScene App - Restaurant Search Results Page](https://github.com/CuiScene/cuiscene/blob/readme/assets/images/restaurant-screenshot.png "CuiScene App Restaurant Search Results Page")


***Restaurant Menu Review & Recipe Log App***
CuiScene is an application designed for users to discover more about the individual dishes they love from their favorite restaurants. 

They are able to search for restaurants, review menu items individually, add recipes for restaurant menu items, view nutritional information of recipes, and save restaurants they would like to visit or view later. 

# Contributors
**Erin Clancy** 
- [Github](https://github.com/noplanetnoparty/)
- Email: [eclancy11@gmail.com](mailto:eclancy11@gmail.com)

**Matthew Frey**
- [GitHub](https://github.com/freym827)
- Email: [freym827@gmail.com](mailto:freym827@gmail.com)

**Youssef Hamid**
- [Github](https://github.com/hamidyou)
- Email: [yhamid1982@gmail.com](mailto:yhamid1982@gmail.com)

**Kayla Himmelberger**
- [Github](https://github.com/kaylahimmel)
- Email: [kaylahimmelberger@gmail.com](mailto:kaylahimmelberger@gmail.com)

# Design Process
After narrowing down the functionality of our app, we set up the repository and branch protection rules, then created the folder and file structure. From there, we considered the info we wanted to collect and developed MySQL tables to house the data. Next we created a Heroku database and installed AuthO and JawsBD libraries to contain the data and allow for Gmail address authorization. We then imported the MySQL schema seed files, then proceeded to tie the database into our Javascript connection and ORM files. We also installed Kyanite to aid in transferring information safely from the database to our app and vice versa. We then set up our server files and made API calls using Ajax, and developed the JS functionality. Next up was creating the route controller files for our GET and POST requests to and from the database tables. From there, we moved onto the front end and created Handlebars partials and compiled blocks of Handlebars code  to call MySQL table data via our main.handlebars page. We finished the app by styling with Bootstrap CSS, our own CSS, and testing for bugs.


# Technologies Used
- Handlebars ([Documentation](http://handlebarsjs.com/))
- Node
- Express
- Javascript
- JQuery
- MySQL Database
- Custom ORM
- Heroku
- Bootstrap ([Documentation](https://getbootstrap.com/docs/4.1/getting-started/introduction/))
- CSS

**APIs**
- Zomato Restaurant Search API ([Documentation](https://developers.zomato.com/documentation))
- Nutritionix Nutritional Info API ([Documentation](https://docs.google.com/document/d/1_q-K-ObMTZvO0qUEAxROrN3bwMujwAN25sLHwJzliK0/edit))

**Libraries**
- AuthO ([Documentation](https://devcenter.heroku.com/articles/auth0))
- Kyanite ([Documentation](http://kyanite.dusty.codes/))
## Zomato API
The Zomato API is being used to return information on specific restaurants. Users are able to **search Zomato for restaurants**, view restaurant details and add recipes for their favorite dishes. 

**Data Collected:**
- Name
- Location
- ID
- Cuisine
- Website URL

[Documentation](https://developers.zomato.com/documentation)
## Nutritionix API
The Nutritionix API is being used to retrieve nutritional information (calories) for users when creating and/or viewing others recipes. 
[Documentation](https://docs.google.com/document/d/1_q-K-ObMTZvO0qUEAxROrN3bwMujwAN25sLHwJzliK0/edit)
## Handlebars
Handlebars is being used to create the user interface/front-end of the application. Handlebar templates are utilized in collecting and displaying user information during the creation of new restaurant reviews, new recipes and maintaining the users log of saved items.
[Documentation](http://handlebarsjs.com/)
## AuthO 

AuthO provides user authorization of Gmail addresses and Kyanite to safely work with data since it creates pipeable, pure, pre-curried functions.
[Documentation](https://devcenter.heroku.com/articles/auth0)
## Kyanite

Kyanite is used to safely work with data since it creates pipeable, pure, pre-curried functions.
[Documentation](http://kyanite.dusty.codes/)


# Future Development
- Allow users to upload photo of their recipe
- Include photos from restaurant menus  
- Offer search functionality by meal time as well as city/neighborhood    
- Filter menu items by cuisine