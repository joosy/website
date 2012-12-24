$(document).ready ->
  $(".joosy_usage_module li a").live "mouseenter", ->
    path = $(this).children().attr("src")
    src = path.replace(".png","_colored.png")
    $(this).children().attr("src",src)
  $(".joosy_usage_module li a").live "mouseleave", ->
    path = $(this).children().attr("src")
    src = path.replace("_colored.png",".png")
    $(this).children().attr("src",src)