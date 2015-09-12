initMap = ->
  customMapType = new google.maps.StyledMapType(
    [{
      stylers: [
        {hue: '#F8D134'},
        {visibility: 'simplified'},
        {gamma: 0.5},
        {weight: 0.5}
      ]
    },
    {
      elementType: 'labels',
      stylers: [{visibility: 'off'}]
    },
    {
      featureType: 'water',
      stylers: [{color: '#F8D134'}]
    }], {
      name: 'Custom Style'
  })
  customMapTypeId = 'custom_style'
  # Create a map object and specify the DOM element for display.
  map = new (google.maps.Map)(document.getElementById('map'),
    center:
      lat: -34.397
      lng: 150.644
    scrollwheel: false
    zoom: 8
    mapTypeControlOptions:
      mapTypeIds: []
    )
  map.mapTypes.set(customMapTypeId, customMapType)
  map.setMapTypeId(customMapTypeId)
  return

$(document).ready ->
  initMap()
