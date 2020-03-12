jQuery(function (){
	var GoogleMap = {
		marker: null,
		infoWindow: null,
		map: null,

		init: function(){
			if(document.getElementById('map_canvas') == null)
				return false;
			
			if(TMap.marker.latitude == 0 || TMap.marker.longitude == 0)
				return false;
			
			var Lat_Long = new google.maps.LatLng(TMap.marker.latitude, TMap.marker.longitude);

			var mapOptions = {
				center: Lat_Long,
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				navigationControl: true
			};

			GoogleMap.map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
			GoogleMap.map.setZoom(TMap.zoom);
			GoogleMap.marker = new google.maps.Marker({
				position: Lat_Long,
				map: GoogleMap.map,
				title: TMap.marker.title
			});

			GoogleMap.infoWindow = new google.maps.InfoWindow({
				content:  '<p style="color:#000;">'+TMap.marker.description+'</p>'
			});

			//GoogleMap.infoWindow.open(GoogleMap.map, GoogleMap.marker);
			google.maps.event.addListener(GoogleMap.marker, "click", function(event) {
				GoogleMap.infoWindow.open(GoogleMap.map, GoogleMap.marker);
			});

			google.maps.event.addListener(GoogleMap.map, "click", function(event) {
				GoogleMap.infoWindow.close();
			});

			return true;
		}
	};

	GoogleMap.init();
	
});