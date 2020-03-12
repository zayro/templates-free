<?php
footer();
global $data;
?>



<footer>
		
<div id="footer">
	<div class="totop"><div class="gototop"><div class="arrowgototop"></div></div></div>
	<div class="fshadow"></div>
	
	<div id="footerinside">
	


		<div class="footer_widget">
			
				<div class="footer_widget1">
				<?php dynamic_sidebar( 'footer1' ); ?>
				<?php if($data['showsocialfooter']){ ?>
				<div class="socialfooter">
				<h3>SOCIALIZE WITH US</h3>
				<div class="socialcategory"><?php socialLink() ?></div>
				</div>	
				<?php } ?>				
				</div>	
				
				<div class="footer_widget2">	
				<?php dynamic_sidebar( 'footer2' ); ?>
				</div>	
				
				<div class="footer_widget3">	
				<?php dynamic_sidebar( 'footer3' ); ?>
				</div>
				
				<div class="footer_widget4 last">	
				<?php dynamic_sidebar( 'footer4' ); ?>
				</div>
				
		</div>



	</div>
	
	
	
		<div id="footerbwrap">
			<div id="footerb">
			<div class="footernav">

					<?php wp_nav_menu( array( 'menu_class' => 'footernav','theme_location' => 'footer-menu' ) ); ?>

			</div>
			<div class="copyright">
			<?php 
	
				echo stripslashes($data['copyright']); ?>
			</div>
		</div>
	</div>
</div>
	

</footer>	
		
<?php wp_footer();  ?>
<script type="text/javascript" charset="utf-8">
 jQuery(document).ready(function(){
    jQuery("a[rel^='lightbox']").prettyPhoto({theme:'light_rounded',overlay_gallery: false,show_title: false});
  });
</script>
</body>
</html>
