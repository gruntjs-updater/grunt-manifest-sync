gruntConfig = (grunt) ->
  grunt.initConfig
    #Compile Coffeescript
    coffee:
      compile:
        expand: true
        cwd: "src"
        src: ["*.coffee"]
        dest: "tasks"
        ext: ".js"

    #Clean build directory
    clean:
      coffeescript: ["tasks"]

    #For testing Grunt plugin
    manifestSync:
      main:
        options:
            primaryManifest: "package.json"
            manifests:
              _import: ["tests/manifests.json"]
              foo: "tests/foo.json"
              bower:
                _dest: "tests/bower.json"
                dest: "bower.json"

    #Watch for file changes
    watch:
      coffeescript:
        files: "src/*.coffee"
        tasks: ["buildCoffeescript", "manifestSync"]
        reload: true

    grunt.loadTasks "tasks"

    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-contrib-clean"

    grunt.registerTask "default", ["build"]
    grunt.registerTask "build", ["buildCoffeescript"]

    grunt.registerTask "buildCoffeescript", ["clean:coffeescript", "coffee:compile"]

module.exports = gruntConfig
