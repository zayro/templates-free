(function() {
	tinymce.create('tinymce.plugins.buttonPlugin', {
		init : function(ed, url) {
			// Register commands
			ed.addCommand('mcebutton', function() {
				ed.windowManager.open({
					file : url + '/button_popup.php', // file that contains HTML for our modal window
					width : 220 + parseInt(ed.getLang('button.delta_width', 0)), // size of our window
					height : 265 + parseInt(ed.getLang('button.delta_height', 0)), // size of our window
					inline : 1
				}, {
					plugin_url : url
				});
			});
 
			// Register buttons
			ed.addButton('button', {title : 'Insert Button Shortcode', cmd : 'mcebutton', image: url + '/includes/images/icon_button.png' });
		}
	});
	
	tinymce.create('tinymce.plugins.imgPlugin', {
		init : function(ed, url) {
			// Register commands
			ed.addCommand('mceimg', function() {
				ed.windowManager.open({
					file : url + '/img_popup.php', // file that contains HTML for our modal window
					width : 250 + parseInt(ed.getLang('img.delta_width', 0)), // size of our window
					height : 420 + parseInt(ed.getLang('img.delta_height', 0)), // size of our window
					inline : 1
				}, {
					plugin_url : url
				});
			});
 
			// Register buttons
			ed.addButton('img', {title : 'Insert Image Shortcode', cmd : 'mceimg', image: url + '/includes/images/icon_img.png' });
		}
	});
 
	// Register plugin
	// first parameter is the button ID and must match ID elsewhere
	// second parameter must match the first parameter of the tinymce.create() function above
	tinymce.PluginManager.add('button', tinymce.plugins.buttonPlugin);
	tinymce.PluginManager.add('img', tinymce.plugins.imgPlugin);
 
})();