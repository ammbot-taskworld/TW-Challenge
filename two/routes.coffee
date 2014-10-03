UserModel = require "./userModel"

module.exports = (app) ->
    app.get "/users", UserModel.find
    app.get "/user/:id", UserModel.find_one
    app.post "/user", UserModel.save
    app.patch "/user/:id", UserModel.update
