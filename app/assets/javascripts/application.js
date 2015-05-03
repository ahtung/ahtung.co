// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require jquery.transit
//= require_tree .

$(function(){
  $(document).foundation();

  $(document).on('page:fetch', function() {
    $('body').transition({ y: '-100vh' });
  });

  $(document).on('page:load', function() {
    // $('body').transition({ y: '-100vh' }, function() {
      $('body').css({ y: '100vh' });
      $('body').transition({ y: '-=100vh' });
    // });
  });
});

