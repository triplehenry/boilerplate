shell = require 'shelljs'

module.exports = (grunt) ->

    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-newer"
    grunt.loadNpmTasks "grunt-contrib-less"
    grunt.loadNpmTasks "grunt-contrib-uglify"
    
    grunt.registerTask "dev", ["watchReact"]

    grunt.registerTask "build", ["setup", "less", "minifyCSS", "buildReact", "uglify", "cleanup"]

    fs = require 'fs'
    ROOT_PATH  = __dirname
    #_getVersion = ->
        #dirArray = fs.readdirSync('./static/min/')

        #if dirArray.length == 0
            #return

        #file_version = dirArray[0]
        #file_version

    #file_version = _getVersion()

    grunt.registerTask "watchReact", "watching react files", ->
        shell.exec "watchify -t coffeeify static/dev/js/main.coffee -o static/build/js/bundle.js -v"

    grunt.registerTask "buildReact", "cleanup files", ->
        shell.exec "browserify -t coffeeify -t [ reactify -x] ./static/dev/js/react/main.coffee -o ./static/build/js/bundle.js"

    grunt.registerTask "setup", "setup", ->
        shell.exec "rm -rf ./static/build/js/*"

    grunt.registerTask "minifyCSS", "minify css", ->
        shell.exec "yuicompressor ./static/dev/css/main.min.css -o ./static/min/" + file_version + "/main.min.css"

    grunt.registerTask "cleanup", "cleanup files", ->
        shell.exec "mv ./static/build/js/main.min.js ./static/min/" + file_version


    grunt.initConfig
  
        coffee:
            compile:
                options:
                    bare: true
                expand: true
                cwd: "./static/dev"
                src: ["**/*.coffee"]
                dest: "./static/build/"
                ext: ".js"

        less:
            compile:
                options: yuicompress: true
                files:
                    "./static/dev/css/main.min.css": "./static/dev/css/imports.less"

        uglify:
            options:
                mangle: false
            js:
                files:
                    './static/build/js/main.min.js': ['./static/build/js/bundle.js']


