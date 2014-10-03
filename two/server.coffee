express = require "express"
bodyParser = require "body-parser"
app = express()

app.use bodyParser.json()

app.listen 8000, ->
    "running on port 8000..."

require("./routes")(app)
