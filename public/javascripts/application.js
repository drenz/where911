// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function publish_clicked(){
alert('publish clicked')	
}




function initialize() {
  var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
  var myOptions = {
    zoom: 4,
    center: myLatlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  map = new google.maps.Map(document.getElementById("map"), myOptions);

	
}


$(document).ready(function() {
	initialize();
	Framey.observe("publishClicked", function(session_data){
	  publish_clicked();
	});
});