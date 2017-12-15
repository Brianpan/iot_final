# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).ready(->

  # map utils
  location_draw = () ->
    console.log("reflesh")
    # latest one
    $.ajax(
      url: "/dashboard/map_sensor_data"
      dataType: "json"
      cache: false
      data:
        device_id: 1

      success: (data) =>
        currentPoint = data["current"]
        L.marker([currentPoint.x, currentPoint.y]).addTo(mymap).bindPopup("<b>Current location</b>").openPopup()
        for d in data["history"]
          L.circle([d.x, d.y], {
            color: 'red',
            fillColor: '#f03',
            fillOpacity: 0.7,
            radius: 6
          }).addTo(mymap)
    )

  mymap = L.map('mapid').setView([33.647, -117.841], 16);
  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
    maxZoom: 18,
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
        '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        'Imagery © <a href="http://mapbox.com">Mapbox</a>',
    id: 'mapbox.streets'
  }).addTo(mymap)

  location_draw()
  setInterval( location_draw, 30000 )

)