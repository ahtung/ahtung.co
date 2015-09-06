# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require materialize
#= require turbolinks
#= require jquery.transit
#= require_tree .
$ ->
  $(document).ready () ->
    $('.parallax').parallax()

    sections = $('section')
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
        return
    return

    nav.find('a').on 'click', ->
      $el = $(this)
      id = $el.attr('href')
      console.log('here')
      $('html, body').animate { scrollTop: $(id).offset().top - nav_height }, 500
      false
