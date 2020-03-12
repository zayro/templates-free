<?php
/**
 * The main template file.
 *
 * @package WordPress
 * @subpackage Inspiration
 */
	get_header();

	if (is_404()) {
		$_page404 = get_option('page_404');
		if (!empty($_page404) && $_page404 != 'default') {
			query_posts(array('page_id' => $_page404));
		} else {
			get_template_part('part', 'def_404');
			return;
		}
	}

	if ( have_posts() ): the_post();
	get_template_part('part', 'layouts');
	global $_theme_layout;
?>
<!-- Start Content Wrapper -->
	<?php  if ($_theme_layout == 1): ?>
	<div class="content_wrapper_sbr">
	<?php elseif ($_theme_layout == 2): ?>
	<div class="content_wrapper_sbl">
	<?php else: ?>
	<div class="content_wrapper">
	<?php endif; ?>
		<?php get_template_part('part', 'title'); ?>
		<!-- Content Area -->
		<div id="content">
<?php
	if (is_page())
		get_template_part('loop', 'page');
	elseif (is_singular())
		get_template_part('loop', 'single');
	else
		get_template_part('loop', 'posts');
?>
		</div>
		<!-- End Content Area -->
<?php if ($_theme_layout != 3): ?>
		<?php get_sidebar('side'); ?>
<?php endif; ?>
		<div class="clear"></div>
	</div>
	<!-- End Content Wrapper -->
<?php else: ?>
	<!-- Start Content Wrapper -->
	<div class="content_wrapper">
<?php get_template_part('part', 'no_results'); ?>
	</div>
	<!-- End Content Wrapper -->
<?php
	endif;
	get_footer();
 ?>