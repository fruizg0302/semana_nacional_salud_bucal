# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#user_jurisdiction_id').parent().hide()
  states = $('#user_jurisdiction_id').html()
  console.log(states)
  $('#user_efederativa_id').change ->
    efederativa = $('#user_efederativa_id :selected').text()
    options = $(states).filter("optgroup[label='#{efederativa}']").html()
    if options
      $('#user_jurisdiction_id').html(options)
      $('#user_jurisdiction_id').parent().show()
    else
      $('#user_jurisdiction_id').empty()
      $('#user_jurisdiction_id').parent().hide()
