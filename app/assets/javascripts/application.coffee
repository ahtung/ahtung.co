#= require jquery
#= require jquery_ujs
#= require materialize
#= require turbolinks
#= require jquery.transit
#= require contact
#= require jquery.scrollTo

$ ->
  $(document).on 'page:fetch', (event) ->
    $('.progress').animate({opacity: 1.0})
    $('main').fadeOut('fast');

  $(document).on 'page:load', ->
    $('.progress').animate({opacity: 0.0})
    init()
    map = new Contact

  $(window).on 'resize', ->
    new Contact

  $('.progress').animate({opacity: 0.0})
  init()

  $('.nav-links a').on 'click', (event) ->
    link = $(this).attr("href")
    $(window).scrollTo('#work', 300)
    event.preventDefault()


init = () ->
  $('.parallax').parallax()
