db = require "./mongo"
sha1 = require "node-sha1"
User = db.model "User"

exports.find = (req, res) ->
    User.find _id: "ammbot", (err, doc) ->
        if (err)
            res.status(500).json(error: err)
        else
            res.json(users: doc)

exports.find_one = (req, res) ->
    User.findOne _id: req.params.id, (err, doc) ->
       if doc
            res.json doc
        res.status(404).end()

exports.save = (req, res) ->
    req.body._id = req.body.username
    req.body.created = Date.now()

    if req.body.password?
        req.body.password = sha1 req.body.password
    
    user = new User req.body

    user.save (err) ->
        if err
            switch err.name
                when "ValidationError"
                    errMsg = (key for key of err.errors)
                    res.status(400).json(error: "missing fields #{errMsg}")
                when "MongoError"
                    if err.code is 11000
                        res.status(409).json(error: "Duplicate user")
                    else
                        res.status(502).end()

        res.status(201).end()

exports.update = (req, res) ->
    req.body.modified = Date.now()
    if req.body.password?
        req.body.password = sha1 req.body.password

    User.update _id: req.params.id, $set: req.body, (err, doc) ->
        if err
            res.status(502).json(err)

        res.json status: "success"
