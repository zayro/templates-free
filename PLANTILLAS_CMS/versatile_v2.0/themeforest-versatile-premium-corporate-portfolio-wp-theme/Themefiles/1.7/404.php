<?php
/**
 * @package WordPress
 * @subpackage Default_Theme
 */

get_header();
?>

</header>
<!-- header -->

<div class="pagemid <?php sidebaroption($post->ID); ?>">
<div class="topshadow">	
	<div class="inner">


	<div id="mainfull">
		<!-- breadcrumb -->
		<?php  $breadcrumbs=get_post_meta($post->ID, 'breadcrumbs_display', true);
		 if($breadcrumbs == '') { ?>
		<div id="breadcrumbs">
		<?php include (TEMPLATEPATH . "/breadcrumb.php"); ?>
		</div>
		<?php } ?>	
		<!-- breadcrumb -->

		<div class="content">
			<h1 class="aligncenter" style="font-size:100px;">Oops! </h1>
			<h2 class="aligncenter"><?php _e('Sorry the page you are looking cannot be found on this server. Please browse the below sitemap.','versatile_front')?></h2>
		<div class="divider"></div>
		<?php include(TEMPLATEPATH. '/search-box.php'); ?>
		<div class="divider"></div>
		<div class="one_half">
			<h3><?php _e('Pages','versatile_front')?></h3>
				<ul class="sitemap"><?php wp_list_pages('title_li=' ); ?></ul>
			</div>

			<div class="one_fourth">
			<h3><?php _e('Feed','versatile_front')?></h3>
				<ul class="sitemap">
					<li><a title="Full content" href="<?php bloginfo('rss2_url'); ?>"><?php _e('Main RSS','versatile_front'); ?></a></li>
					<li><a title="Comment Feed" href="<?php bloginfo('comments_rss2_url'); ?>"><?php _e('Comment Feed','versatile_front'); ?></a></li>
				</ul>
			</div>

			<div class="one_fourth last">
			<h3><?php _e('Categories','versatile_front'); ?></h3>
				<ul class="sitemap"><?php wp_list_cats(''); ?></ul>

			<h3><?php _e('Archives','versatile_front'); ?></h3>
				<ul class="sitemap">
					<?php wp_get_archives('type=monthly&show_post_count=true'); ?>
				</ul>
			</div>

		</div>
		<!-- content -->
	</div>
	<!-- main -->

	</div>
   	<!-- inner -->			
</div>
</div>
<!-- pagemid -->		

<div class="clear"></div>
<?php get_footer(); ?>