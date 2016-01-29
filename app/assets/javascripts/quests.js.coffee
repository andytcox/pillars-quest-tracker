# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#quests').on 'click', '.quest-attr a', (e)->
    console.log('clicked')
    e.preventDefault()
    e.stopPropagation()
    window.open($(this).attr('href'))
    return false


  $('#quests').on 'ajax:before', '.toggle-quest', ()->
    console.log('ajax')
    $(this).toggleClass('loading')