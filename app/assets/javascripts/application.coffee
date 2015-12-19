#= require jquery
#= require jquery_ujs
#= require materialize
#= require jquery.transit
#= require contact
#= require jquery.scrollTo

$ ->
  $(document).on 'page:load', ->
    init()

  $(window).on 'resize', ->
    new Contact

  init()

  $('.brand-logo, .nav-links a').on 'click', (event) ->
    link = $(this).attr("href")
    $(window).scrollTo(link, 300, offset: -80)
    event.preventDefault()


init = () ->
  map = new Contact
