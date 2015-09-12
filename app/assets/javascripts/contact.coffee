initMap = ->
  # Create a map object and specify the DOM element for display.
  map = new (google.maps.Map)(document.getElementById('map'),
    center:
      lat: 41.111724
      lng: 29.019673
    scrollwheel: false
    zoom: 10)
  return

$(document).ready ->
  initMap()