module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON "package.json"

        nodemon:
            dev:
                script: "server.coffee"
                options:
                    args: []
                    ignore: ["node_modules/**" ,"static/**"]
                    watchedExtensions: ["coffee"]
                    ext: "js, coffee"
                    delayTime: 1
                    cwd: __dirname

        grunt.loadNpmTasks "grunt-nodemon"

        grunt.registerTask "default", ["nodemon"]
