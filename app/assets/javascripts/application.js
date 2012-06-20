//= require jquery
//= require jquery_ujs
//= require rails-timeago
//= require twitter/bootstrap
//= require ckeditor-jquery
//= require simple_nested_form
//= require ui.achtung
//= require event_calendar
//= require jquery.ui.autocomplete
//= require jquery.ui.datepicker
//= require jquery.effects.highlight
//= require jquery.ui.sortable
//= require etherpad
//= require jquery.uniform.min.js
//= require_tree .
//

$('.done-checkbox').click(function(){
  $(this).closest('form').submit();
  $(this).closest('form').closest('td').next().toggleClass('title-strike');
});

$(function(){
  $('select, input:checkbox, input:radio, input:file').uniform();
});

