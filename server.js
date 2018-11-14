// var express = require('express')

// var PORT = process.env.PORT || 8080

// var app = express()

// app.use(express.static('assets'))

// app.use(express.urlencoded({ extended: true }))
// app.use(express.json())

// var exphbs = require('express-handlebars')

// app.engine('handlebars', exphbs({ defaultLayout: 'main' }))
// app.set('view engine', 'handlebars')

// var routes = require('./controllers/cuiscene_controller')

// app.use(routes)

// app.listen(PORT, function () {
//   console.log('Server listening on: http://localhost:' + PORT)
// })

const express = require('express')
const bodyParser = require('body-parser')
const exphbs = require('express-handlebars')
const dbRoutes = require('./controllers/cuiscene_controller')
const viewRoutes = require('./controllers/routes_controller')

const PORT = process.env.PORT || 8080

const app = express()

// Serve static content for the app from the "public" directory in the application directory.
app.use(express.static('assets'))

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }))

// parse application/json
app.use(bodyParser.json())

// Set Handlebars.
app.engine('handlebars', exphbs({ defaultLayout: 'main' }))
app.set('view engine', 'handlebars')
app.use(dbRoutes)
app.use(viewRoutes)

// Start our server so that it can begin listening to client requests.
app.listen(PORT, function () {
  // Log (server-side) when our server has started
  console.log('Server listening on: http://localhost:' + PORT)
})
