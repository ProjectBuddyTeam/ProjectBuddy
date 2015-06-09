initMasonry = ->
  $('#home-projects').masonry
    itemSelector: '.project-single',
    columnWidth: 320,
    isFitWidth: true

$(document).on 'ready page:load', ->
  initMasonry()

  # Hacky way to switch between masonry mode and grid-block mode
  $(window).on 'load, resize', Foundation.utils.throttle(( (e) ->
    if !window.matchMedia(Foundation.media_queries.medium).matches
      old_html = $('#home-projects').html()
      if ! $('#home-projects').find('ul').size()
        $('#home-projects').html($('<ul class="small-block-grid-1">' + old_html + '</ul>')).masonry('destroy')
        $('.project-single').each (index, value) ->
          $(value).replaceWith('<li class="project-single">' + $(value).html() + '</li>')
    else
      if $('#home-projects').find('ul').size()
        $('#home-projects > ul').replaceWith($('#home-projects > ul').html())
        $('.project-single').each (index, value) ->
          $(value).replaceWith('<div class="project-single">' + $(value).html() + '</div>')
        initMasonry()
  ), 300)