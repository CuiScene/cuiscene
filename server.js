const express = require('express')
const exphbs = require('express-handlebars')
// const routes = require('./controllers/restaurants_controller.js')

const PORT = process.env.PORT || 8080

const app = express()

// Serve static content for the app from the "public" directory in the application directory.
app.use(express.static('assets'))

// parse application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }))

// parse application/json
app.use(express.json())

// Set Handlebars.
app.engine('handlebars', exphbs({ defaultLayout: 'main' }))
app.set('view engine', 'handlebars')
// app.use(routes)

// Start our server so that it can begin listening to client requests.
app.listen(PORT, function () {
  // Log (server-side) when our server has started
  console.log('Server listening on: http://localhost:' + PORT)
})
