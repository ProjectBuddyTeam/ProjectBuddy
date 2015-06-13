# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->
  PB.projects = PB.projects || new Object()
  PB.projects.show = PB.projects.show || new Object()
  PB.projects.form = PB.projects.form || {}
  PB.projects.show.show_contact = (member_id, button) ->
    $.get('/profile/contacts/' + member_id)
      .done (r, status, xhr) ->
        $(button).hide()
        $('#contact-info').html(r)

  PB.projects.form.init_tags = (element) ->
    $(element).selectize
      delimiter: ','
      persist: false
      create: (input) ->
        {
          value: input
          text: input
        }
  if tag_input = $('input[name="project_project[tag_list]"]')
    PB.projects.form.init_tags(tag_input)