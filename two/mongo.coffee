mongoose = require "mongoose"
Schema = mongoose.Schema
ObjectId = mongoose.ObjectId

mongoose.connect require("./config").mongo.uri

mongoose.model "User", new Schema {
    _id:
        type: String
        required: true
    password:
        type: String
        required: true
    firstname:
        type: String
        required: true
    lastname:
        type: String
        required: true
    created:
        type: Date
        required: true
    modified:
        type: Date
        default: Date.now
        required: true
}

module.exports = mongoose
