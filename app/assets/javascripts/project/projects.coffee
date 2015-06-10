# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->
  PB.projects = PB.projects || new Object()
  PB.projects.show = PB.projects.show || new Object()
  PB.projects.show.show_contact = (member_id, button) ->
    $.get('/profile/contacts/' + member_id)
      .done (r, status, xhr) ->
        $(button).hide()
        $('#contact-info').html(r)