/* ---------------------------------------------------------------------- */
	/*	Google Maps
	/* ---------------------------------------------------------------------- */

	(function() {

		var $map = $('#map');

		if( $map.length ) {

			$map.gMap({
				address: 'Level 13, 2 Elizabeth St, Melbourne Victoria 3000 Australia',
				zoom: 16,
				markers: [
					{ 'address' : 'Level 13, 2 Elizabeth St, Melbourne Victoria 3000 Australia' }
				]
			});

		}

	})();

	/* end Google Maps */