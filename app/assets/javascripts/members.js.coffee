# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  $("#messages_search input").keyup ->
    $.get $("#messages_search").attr("action"), $("#messages_search").serialize(), null, "script"
    false
