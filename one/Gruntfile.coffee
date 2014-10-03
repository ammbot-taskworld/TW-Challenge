module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON "package.json"

        coffee:
            compile:
                expand: true,
                flatten: false,
                cwd: "./.src/"
                src: ["**/*.coffee"]
                dest: "./static/js"
                ext: ".js"

        concurrent:
            watch:
                tasks: ["nodemon", "watch"]
            options:
                logConcurrentOutput: true

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

        watch:
            coffee:
                files: ["./.src/**/*.coffee"]
                tasks: ["coffee"]

        grunt.loadNpmTasks "grunt-contrib-coffee"
        grunt.loadNpmTasks "grunt-contrib-watch"
        grunt.loadNpmTasks "grunt-nodemon"
        grunt.loadNpmTasks "grunt-concurrent"

        grunt.registerTask "default", ["coffee", "concurrent:watch"]
