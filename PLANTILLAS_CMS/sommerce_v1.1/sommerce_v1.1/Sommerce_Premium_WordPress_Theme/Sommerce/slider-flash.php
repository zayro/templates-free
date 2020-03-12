<?php 
/**
 * @package WordPress
 * @subpackage Sommerce
 * @since 1.0
 */
 
if ( yiw_is_empty() )
    return;
?>
 
                <div id="slider" class="inner flash">
                	<div id="piecemaker"></div>
			    </div>               
    
			    <script type="text/javascript">
			      var flashvars = {};
			      flashvars.cssSource = "<?php echo get_template_directory_uri() ?>/piecemaker/piecemaker.css";
			      flashvars.xmlSource = "<?php echo get_template_directory_uri() ?>/piecemaker/piecemaker.php";
					
			      var params = {};
			      params.play = "true";
			      params.menu = "false";
			      params.scale = "showall";
			      params.wmode = "transparent";
			      params.allowfullscreen = "true";
			      params.allowscriptaccess = "always";
			      params.allownetworking = "all";
				  
			      swfobject.embedSWF('<?php echo get_template_directory_uri() ?>/piecemaker/piecemaker.swf', 'piecemaker', '960', '390', '10', null, flashvars, params, null);
			    
			    </script>