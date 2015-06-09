initMasonry = (container) ->
  if !container.data('inMasonryMode')
    container.masonry
      itemSelector: '.project-single',
      columnWidth: 320,
      isFitWidth: true
    container.data('inMasonryMode', true)

destroyMasonry = (container) ->
  if container.data('inMasonryMode')
    container.masonry('destroy')
    container.data('inMasonryMode', false)

$(document).on 'ready page:load', ->
  initMasonry($('#projects-dynamic-index'))

  $(window).on 'load, resize', Foundation.utils.throttle(( (e) ->
    if !window.matchMedia(Foundation.media_queries.medium).matches
      destroyMasonry $('#projects-dynamic-index')
    else
      initMasonry $('#projects-dynamic-index')
  ), 300)