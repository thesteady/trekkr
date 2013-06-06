var configureMap = function() {
    var map = L.mapbox.map('map', 'thesteady.map-ygc6vvpt');
    map.setView([38.3, -121], 5);

    //set up empty array to hold highlighted points later
    var selectedLayers = [];

    map.markerLayer.on('ready', function(e) {
      // The GeoJSON representing the point features
      var geoJson = $('#map').data('points');
      map.markerLayer.setGeoJSON(geoJson);

  // Listen for individual marker clicks
  map.markerLayer.on('click',function(e) {
      e.layer.unbindPopup();

      var feature = e.layer.feature;
      // set the text in the sidebar
      var info ='<img class="photo" src="' + feature.properties.url + '" width="325">' +
                '<p class="credit"> Photo Credit: Instagram user <span class="username">'
                + feature.properties.title + '</span></p>' +
                '<br><div class="more">' + feature.properties.description + '</div>';
      document.getElementById('info').innerHTML = info;

      //highlight the clicked marker
      // first reset any previous marker with the highlight
      $(selectedLayers).each(function(index,layer) {
        var unHighlightedIcon = L.icon({
            iconUrl: 'http://a.tiles.mapbox.com/v3/marker/pin-s+543511.png',
            iconSize: [ 20, 50 ],
            iconAnchor: [ 10, 25 ]
          });
        layer.setIcon(unHighlightedIcon);
      });

      // then set the current marker to highlighted.
        var highlightedIcon = L.icon({
          iconUrl: 'http://a.tiles.mapbox.com/v3/marker/pin-s+F5E013.png',
          iconSize: [ 28, 70 ],
          iconAnchor: [ 14, 35 ]
        });

      selectedLayers.push(e.layer);
       e.layer.setIcon(highlightedIcon);
    });
  });
};
  
$(document).ready(configureMap);
