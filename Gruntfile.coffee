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

  grunt.initConfig
    grill:
      config: config()
      assets:
        root: 'application.*'
        skip: 'haml/layouts'


  grunt.registerTask 'server', 'grill:server'
  grunt.registerTask 'compile', 'grill:compile'