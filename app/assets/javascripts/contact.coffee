initMap = ->
  # Create a map object and specify the DOM element for display.
  map = new (google.maps.Map)(document.getElementById('map'),
    center:
      lat: -34.397
      lng: 150.644
    scrollwheel: false
    zoom: 8)
  return

$(document).ready ->
  initMap()