#= require jquery
#= require jquery_ujs
#= require materialize
#= require jquery.transit
#= require jquery.scrollTo

$ ->
  $(document).on 'page:load', ->
    init()

  $('.brand-logo, .nav-links a').on 'click', (event) ->
    link = $(this).attr("href")
    $(window).scrollTo(link, 300, offset: -80)
    event.preventDefault()
