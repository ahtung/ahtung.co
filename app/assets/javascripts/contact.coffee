class @Contact
  constructor: ->
    map = new (google.maps.Map)(document.getElementById('map'),
      center:
        lat: 41.111724
        lng: 29.019673
      scrollwheel: false
      zoom: 10)