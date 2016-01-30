# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $table = $('#quests')
  $table.on 'click', '.quest-attr a', (e)->
    console.log('clicked')
    e.preventDefault()
    e.stopPropagation()
    window.open($(this).attr('href'))
    return false


  $table.on 'ajax:before', '.toggle-quest', ()->
    console.log('ajax')
    $(this).toggleClass('loading')

  $table.tablesorter()

  $('#whitemarch').on 'click', ()->
    $(this).toggleClass('active')
    $table.toggleClass('no-white-march')

  $('.toggle-quest').on 'click', ()->
    $(this).toggleClass('active')
    klass = "." + $(this).data().target
    $(klass).toggleClass('hidden', $(this).hasClass('active'))