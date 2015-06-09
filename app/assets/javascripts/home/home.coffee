$(document).on 'ready page:load', ->
  $('#home-projects').masonry
    itemSelector: '.project-single',
    columnWidth: 320,
    isFitWidth: true