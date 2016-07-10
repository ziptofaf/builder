# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $('.our-checkbox').click ->
    $(this).find("input").prop("checked", true)
    $(this).parent().find('.our-checkbox').removeClass("selected")
    $(this).addClass("selected")
    return


  return
