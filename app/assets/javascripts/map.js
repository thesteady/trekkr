var configureMap = function() {
    var map = L.mapbox.map('map', 'thesteady.map-ygc6vvpt');
    map.setView([38.3, -121], 5);

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
                '<p class="credit"> Photo Credit: Instagram user <span class="username">' + feature.properties.title + '</span></p>' +
                '<div class="more">' + feature.properties.description + '</div>'
                 ;
      document.getElementById('info').innerHTML = info;

      //highlight the clicked marker
        // first reset any previous marker with the highlight
        // then set the current marker to highlighted.

  });

  // Clear the tooltip when map is clicked
  map.on('click',function(e){
    //i want to reset the text to the site description here
    //var siteDescript = $('.site-descript').text();
     // document.getElementById('info').innerHTML = '';
     // above line will clear the sidebar on map click
  });
      });
};
  
  $(document).ready(configureMap);
