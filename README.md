![CuiScene: Restaurant Menu Review & Recipe Log App](assets/images/cuiscene_logo.png) 

### Overview
[CuiScene](https://cuiscene.herokuapp.com) is an application designed for users to discover more about the individual dishes they love from their favorite restaurants. Users are able to search for restaurants, review menu items, add recipes based off of restaurant menu items, view nutritional information for recipes, and save restaurants to a wishlist. 

![CuiScene App - Restaurant Search Results Page](https://assets/images/cuiscene_home.png "CuiScene App Restaurant Search Results Page")

### Contributors
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

### Design Process
After deciding the MVP in terms of functionality, we created our GitHub organization, repository, and set up branch protection rules. From there, team duties were assigned with:
- Youssef handling the structure of the MySQL tables, Heroku deployment, and routing, 
- Matt handling API calls and assisting with routing, 
- Kayla handling creation of partials and layouts in Handlebars, debugging, and styling, and 
- Erin handling layouts in Handlebars, debugging, and styling. 

As a group, we determined what info to collect from users and pull in from the APIs, and how to best structure that data in our MySQL tables. Next up was the creation of our Heroku database, which required installation of the AuthO add-on for Gmail address authorization and the JawsBD add-on to connect the MySQL database with Heroku. 

We then created and imported the MySQL schema seed files into Heroku, then proceeded to tie the database into our JavaScript connection and ORM files. We also installed Kyanite to aid in transferring information safely from the database to our app and vice versa. Server files were then created to make API calls using Ajax and to further develop the functionality. From there, we created route controller files for GET/POST requests to and from the database tables.

The last step was completing the front end. This meant compiling the Handlebars partials, linking them to our layout file and tying in routes for the various pages, and making calls to get the MySQL table data. Last, but not least, we finished the app by styling with Bootstrap CSS, our own CSS, and performing plenty of testing.


### Technologies Used
- [Handlebars](http://handlebarsjs.com/))
- [Node.js](https://nodejs.org/en/docs)
- [Express.js](https://expressjs.com)
- [Javascript](https://www.javascript.com)
- [JQuery](https://jquery.com/)
- [MySQL](https://github.com/mysqljs/mysql#readme)
- [JawsDB](https://www.jawsdb.com/)
- [Heroku](https://devcenter.heroku.com/)
- [Bootstrap](https://getbootstrap.com)
- [CSS3](https://developer.mozilla.org/en-US/docs/Web/CSS)
- Custom ORM


**APIs**
- [Zomato Restaurant Search API](https://developers.zomato.com/documentation))
- [Nutritionix Nutritional Info API](https://docs.google.com/document/d/1_q-K-ObMTZvO0qUEAxROrN3bwMujwAN25sLHwJzliK0/edit))

**Libraries**
- [AuthO](https://devcenter.heroku.com/articles/auth0))
- [Kyanite](http://kyanite.dusty.codes/))


### Future Development
- Allow users to upload photos of completed recipes
- Include photos of the restaurant menu items  
- Offer search functionality by meal time as well as city/neighborhood
- Filter menu items by cuisine
- Update styling with a more responsive design
- Allow user to edit recipes and ratings after they've been added
- Add collapsible menu to the navbar for smaller screen sizes