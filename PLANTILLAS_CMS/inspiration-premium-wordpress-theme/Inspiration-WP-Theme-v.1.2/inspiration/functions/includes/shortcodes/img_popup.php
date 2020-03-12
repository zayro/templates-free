<?php
// this file contains the contents of the popup window
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Insert Image</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.js"></script>
<script language="javascript" type="text/javascript" src="../../../../../../wp-includes/js/tinymce/tiny_mce_popup.js"></script>
<style type="text/css" src="../../../../../../wp-includes/js/tinymce/themes/advanced/skins/wp_theme/dialog.css"></style>
<link rel="stylesheet" href="includes/css/buttons_tinymce.css" />

<script type="text/javascript">
 
var ButtonDialog = {
	local_ed : 'ed',
	init : function(ed) {
		ButtonDialog.local_ed = ed;
		tinyMCEPopup.resizeToInnerSize();
	},
	insert : function insertButton(ed) {
 
		// Try and remove existing style / blockquote
		tinyMCEPopup.execCommand('mceRemoveNode', false, null);
 
		// set up variables to contain our input values
		var src = jQuery('#button-dialog input#img-src').val();
		var align = jQuery('#button-dialog select#img-align').val();
		var w = jQuery('#button-dialog input#img-w').val();
		var h = jQuery('#button-dialog input#img-h').val();
		var alt = jQuery('#button-dialog input#img-alt').val();
		var title = jQuery('#button-dialog input#img-title').val();
		var mtop = jQuery('#button-dialog input#img-mtop').val();
		var mright = jQuery('#button-dialog input#img-mright').val();
		var mbottom = jQuery('#button-dialog input#img-mbottom').val();
		var mleft = jQuery('#button-dialog input#img-mleft').val();
		var url = jQuery('#button-dialog input#img-url').val();
		var lightbox = jQuery('#button-dialog input#img-lightbox').val();
 
		var output = '';
 
		// setup the output of our shortcode
		output = '[img ';
			output += 'align=' + '"' + align + '"' + ' ';
			output += 'w=' + '"' + w + '"' + ' ';
			output += 'h=' + '"' + h + '"' + ' ';
			output += 'alt=' + '"' + alt + '"';
 
			// only insert if the title field is not blank
			if(title)
				output += ' title=' + '"' + title + '"';
 
			// only insert if the mtop field is not blank
			if(mtop)
				output += ' mtop=' + '"' + mtop + '"';
 
			// only insert if the mright field is not blank
			if(mright)
				output += ' mright=' + '"' + mright + '"';
 
			// only insert if the mbottom field is not blank
			if(mbottom)
				output += ' mbottom=' + '"' + mbottom + '"';
 
			// only insert if the mleft field is not blank
			if(mleft)
				output += ' mleft=' + '"' + mleft + '"';
 
			// only insert if the url field is not blank
			if(url)
				output += ' url=' + '"' + url + '"';
 
			// only insert if the lightbox field is not blank
			if(lightbox)
				output += ' lightbox=' + '"' + lightbox + '"';
		// check to see if the SRC field is blank
		if(src) {	
			output += ']'+ src + '[/img]';
		}
		// if it is blank, use the selected text, if present
		else {
			output += ']'+ButtonDialog.local_ed.selection.getContent() + '[/img]';
		}
		tinyMCEPopup.execCommand('mceInsertContent', false, output);
 
		// Return
		tinyMCEPopup.close();
	}
};
tinyMCEPopup.onInit.add(ButtonDialog.init, ButtonDialog);
 
</script>

</head>
<body>
	<div id="button-dialog">
		<form action="/" method="get" accept-charset="utf-8">
			<div>
				<label for="img-src">Image Path</label>
				<input type="text" name="img-src" value="" id="img-src" />
			</div>
			<div>
				<label for="img-align">Alignment</label>
				<select name="img-align" id="img-align" size="1">
					<option value="left" selected="selected">Left</option>
					<option value="right">Right</option>
					<option value="center">Center</option>
				</select>
			</div>
			<div>
				<label for="img-w">Image Width</label>
				<input type="text" name="img-w" value="" id="img-w" />
			</div>
			<div>
				<label for="img-h">Image Height</label>
				<input type="text" name="img-h" value="" id="img-h" />
			</div>
			<div>
				<label for="img-alt">Alt Text</label>
				<input type="text" name="img-alt" value="" id="img-alt" />
			</div>
			<div>
				<label for="img-title">Image Title</label>
				<input type="text" name="img-title" value="" id="img-title" />
			</div>
			<div>
				<label for="img-mleft">Left Gap</label>
				<input type="text" name="img-mleft" value="" id="img-mleft" />
			</div>
			<div>
				<label for="img-mright">Right Gap</label>
				<input type="text" name="img-mright" value="" id="img-mright" />
			</div>
			<div>
				<label for="img-mtop">Top Gap</label>
				<input type="text" name="img-mtop" value="" id="img-mtop" />
			</div>
			<div>
				<label for="img-mbottom">Bottom Gap</label>
				<input type="text" name="img-mbottom" value="" id="img-mbottom" />
			</div>
			<div>
				<label for="img-url">Image URL</label>
				<input type="text" name="img-url" value="" id="img-url" />
			</div>
			<div>
				<label for="img-lightbox">Lightbox</label>
				<input type="text" name="img-lightbox" value="" id="img-lightbox" />
			</div>
			<div>	
				<a href="javascript:ButtonDialog.insert(ButtonDialog.local_ed)" id="insert" style="display: block; line-height: 24px;">Insert</a>
			</div>
		</form>
	</div>
</body>
</html>