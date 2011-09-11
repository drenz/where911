// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function publish_clicked(){
alert('publish clicked')	
}



function initialize() {
	// Create the context menu element
	var contextMenu = $(document.createElement('ul'))
		.attr('id', 'contextMenu');

	// Fill our context menu with links
	contextMenu.append(
		'<li><a href="#zoomIn">Zoom in</a></li>' +
		'<li><a href="#zoomOut">Zoom out</a></li>' +
		'<li><a href="#centerHere">Center map here</a></li>');
		
	// Disable the browser context menu on our context menu
	contextMenu.bind('contextmenu', function() { return false; });

	// Append it to the map object
	$("#map").append(contextMenu);

	// Keep track of where you clicked
	var clickedLatLng;

	// Display and position the menu
	google.maps.event.addListener(map, 'rightclick', function(e)
	{
		// start buy hiding the context menu if its open
		contextMenu.hide();

		var mapDiv = $("#map"),
			x = e.pixel.x,
			y = e.pixel.y;

		// save the clicked location
		clickedLatLng = e.latLng;

		// adjust if clicked to close to the edge of the map
		if ( x > mapDiv.width() - contextMenu.width() )
			x -= contextMenu.width();

		if ( y > mapDiv.height() - contextMenu.height() )
			y -= contextMenu.height();

		// Set the location and fade in the context menu
		contextMenu.css({ top: y, left: x }).fadeIn(100);
	});
	// Set some events on the context menu links
	contextMenu.find('a').click( function()
	{
		// fade out the menu
		contextMenu.fadeOut(75);

		// The link's href minus the #
		var action = $(this).attr('href').substr(1);

		switch ( action )
		{
			case 'zoomIn':
				map.setZoom(
					map.getZoom() + 1
				);
				map.panTo(clickedLatLng);
				break;

			case 'zoomOut':
				map.setZoom(
					map.getZoom() - 1
				);
				map.panTo(clickedLatLng);
				break;

			case 'centerHere':
				map.panTo(clickedLatLng);
				break;
		}

		return false;
	});
	
	// Hover events for effect
	contextMenu.find('a').hover( function() {
		$(this).parent().addClass('hover');
	}, function() {
		$(this).parent().removeClass('hover');
	});
	
			
};



$(document).ready(function() {
	initialize();
	Framey.observe("publishClicked", function(session_data){
	  publish_clicked();
	});
});