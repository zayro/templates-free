<?php
/**
 * The template for displaying the footer.
 *
 * @package WordPress
 * @subpackage Inspiration
 */
?>
<?php if (!is_front_page() || (is_front_page() && get_option('slider_type') == 'disable')): ?>

<?php else: ?>
	<?php if (get_option('use_feature_bottom_line')): ?>
	<!-- Start Featured Bottom Line -->
	<div class="featured_bottom_line_full">
		<?php if (get_option('use_feature_bottom_line')) echo do_shortcode(get_option('feature_bottom_line')); ?>
	</div>
	<!-- End Featured Bottom Line -->
	<?php endif; ?>
<?php endif; ?>

<?php get_sidebar('footer'); ?>
<!-- Start Footer  -->
<div class="footer_full">
	<div id="footer">
		<div class="copy">
			<p><?php echo get_option('copyright'); ?></p>
			<p class="developed_by"><?php _e('Developed By:', TEMPLATENAME); ?>&nbsp;<a href="http://cssmixer.com/">CSSMixer</a></p>
		</div>
		<?php get_social_links(); ?>
		<div class="clear"></div>
	</div>
</div>
<!-- End Footer  -->

<?php
	/* Always have wp_footer() just before the closing </body>
	 * tag of your theme, or you will break many plugins, which
	 * generally use this hook to reference JavaScript files.
	 */

	wp_footer();

//if (is_portfolio() || is_tax('gallery')):
?>

<!-- PrettyPhoto Lightbox Plugin Init -->
<script type="text/javascript">

if (jQuery('a[rel^="prettyPhoto"]')) {
	reloadPrettyPhoto();
	init_pretty();
}

function reloadPrettyPhoto() {
	jQuery(".pp_pic_holder").remove();
	jQuery(".pp_overlay").remove();
	jQuery(".ppt").remove();
	init_pretty();
}

function init_pretty(){
	jQuery('a[rel^="prettyPhoto"]').prettyPhoto({
		animationSpeed: 'normal',
		opacity: 0.70,
		showTitle: false,
		allowresize: true,
		counter_separator_label: '/',
		theme: '<?php echo get_option('lightbox_skin'); ?>'
	});
};
</script>
<?php // endif; ?>
</body>
</html>