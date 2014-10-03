express = require "express"

app = express()

app.set "views", __dirname + "/views"
app.set "view engine", "jade"

app.use express.static __dirname + "/bower_components"
app.use express.static __dirname + "/static"

app.get "/", (req, res) ->
    res.render "index",
    title: "Ammbot"
    picUrl: "http://d2rhekw5qr4gcj.cloudfront.net/img/400sqf/from/uploads/profiles/ammbot_130522_1201_30.jpg"

app.listen "8000", ->
    console.log "Sawasdee"
