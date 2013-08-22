Sugar    = require 'sugar'
httpsync = require 'httpsync'

module.exports = (grunt) ->

  config = ->
    config = 
      versions: {}

    request = httpsync.get url: 'http://rubygems.org/api/v1/versions/joosy.json'
    versions = JSON.parse request.end().data.toString()

    config.versions.stable = versions.filter (x) -> !x.prerelease
    config.versions.edge = versions.filter (x) -> x.prerelease

    config

  grunt.loadNpmTasks 'grill'
  grunt.loadNpmTasks 'grunt-gh-pages'

  grunt.initConfig
    grill:
      config: config()
      assets:
        root: 'application.*'
        skip: 'haml/layouts'

    'gh-pages':
      application:
        options:
          clone: 'public'
          command:
            cmd: 'grunt'
            args: ['compile']

  grunt.registerTask 'server', 'grill:server'
  grunt.registerTask 'compile', 'grill:compile'