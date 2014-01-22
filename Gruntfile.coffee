httpsync = require 'httpsync'

module.exports = (grunt) ->

  config = ->
    config = 
      versions: {}

    request = httpsync.get url: 'http://rubygems.org/api/v1/versions/joosy.json'
    versions = JSON.parse request.end().data.toString()

    config.versions.stable = versions.filter (x) -> !x.prerelease
    config.versions.edge = versions.filter (x) -> x.prerelease

    config.moment = require 'moment'

    config

  grunt.loadNpmTasks 'grill'
  grunt.loadNpmTasks 'grunt-push'

  grunt.initConfig
    grill:
      config: config()
      assets:
        root: 'application.*'
        skip: 'layouts/*.haml'

    push:
      site:
        options:
          cwd: 'public'
          branch: 'gh-pages'

  grunt.registerTask 'server', 'grill:server'
  grunt.registerTask 'compile', 'grill:compile'

  grunt.registerTask 'publish', [
    'push:prepare:site',
    'compile',
    'push:add:site',
    'push:deliver:site'
  ]