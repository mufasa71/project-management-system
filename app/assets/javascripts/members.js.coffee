$ ->
  $("#messages_search input").keyup ->
    $.get $("#messages_search").attr("action"), $("#messages_search").serialize(), null, "script"
    false
