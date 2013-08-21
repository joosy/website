#= require_tree ./
#= require_self

$ ->
  $('.joosy_usage_module img').show()
    .on('mouseenter', -> $(@).removeClass 'desaturate')
    .on('mouseleave', -> $(@).addClass 'desaturate')