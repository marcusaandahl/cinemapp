/*import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/rasmus-melberg/ck3d3vxd42zxh1cobjbmtu8si'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };


*/

import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 3000 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    // MAP
    var map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/rasmus-melberg/ck3d3vxd42zxh1cobjbmtu8si'
    });

    // MARKERS
    var markers = JSON.parse(mapElement.dataset.markers); //get markers
    //for each marker
    markers.forEach((marker) => {
      var popup = new mapboxgl.Popup().setHTML(marker.infoWindow); //inits popup
      new mapboxgl.Marker() //create a marker
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) //create popup
        .addTo(map);
    });

    // FITS MARKERS TO MAP
    fitMapToMarkers(map, markers);

  }
};


export { initMapbox };
