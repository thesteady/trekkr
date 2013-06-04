var configureMap = function() {
    // sets up the map base

    var map = L.mapbox.map('map', 'thesteady.map-ygc6vvpt');
    map.setView([36.7, -119.3], 5);

    map.markerLayer.on('ready', function(e) {
      // The GeoJSON representing the point features
      var geoJson = $('#map').data('points');
      map.markerLayer.setGeoJSON(geoJson);
    
      this.eachLayer(function(marker) {
          var feature = marker.feature;
          // Create custom popup content
          var popupContent =

          '<img class="photo" src="' + feature.properties.url + '" width="325">' + '<h4>' + feature.properties.title + '</h4>' +
          '<p>' + feature.properties.description +'</p>' ;

          // http://leafletjs.com/reference.html#popup
          marker.bindPopup(popupContent,{
              closeButton: false,
              minWidth: 320
          });

      });
    });

    

  };
  
  $(document).ready(configureMap);
