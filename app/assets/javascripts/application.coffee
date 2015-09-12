#= require jquery
#= require jquery_ujs
#= require materialize
#= require turbolinks
#= require jquery.transit

$ ->
  init()
  $('.progress').hide();
  $(document).on 'page:fetch', (event) ->
    $('.progress').fadeIn('fast');
    $('main').fadeOut('fast');

  $(document).on 'page:load', ->
    $('.progress').fadeOut('fast')
    init()

init = () ->
  $('.parallax').parallax()

  sections = $('.section')
  nav = $('nav')
  nav_height = nav.outerHeight()
  $(window).on 'scroll', ->
    cur_pos = $(this).scrollTop()
    sections.each ->
      top = $(this).offset().top - nav_height
      bottom = top + $(this).outerHeight()
      if cur_pos >= top and cur_pos <= bottom
        nav.find('a').removeClass 'active'
        sections.removeClass 'active'
        $(this).addClass 'active'
        nav.find('a[href="#' + $(this).attr('id') + '"]').addClass 'active'

  nav.find('a').on 'click', ->
    $el = $(this)
    id = $el.attr('href')
    $('html, body').animate { scrollTop: $(id).offset().top - nav_height }, 500
    false
