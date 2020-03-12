<?php require(sys_includes."/var.php");?>
	<div id="subheader" class="<?php sidebaroption($post->ID); ?>">
		<?php sub_header_text($post->ID); ?>
	</div>
	<!-- subheader -->
</header>
<!-- header -->
<div class="pagemid <?php sidebaroption($post->ID); ?>">	
<div class="topshadow">
	<div class="inner">

	
		<div id="main">
		<?php  $breadcrumbs=get_post_meta($post->ID, 'breadcrumbs_display', true);
		 if($breadcrumbs == '') { ?>
		<div id="breadcrumbs">
		<?php include (TEMPLATEPATH . "/breadcrumb.php"); ?>
		</div>
		<?php } ?>	
		<!-- breadcrumb -->

		<div class="content">
		<?php $aboutauthor = get_option('aboutauthor');?>
		<?php if (have_posts()) : while (have_posts()) : the_post(); ?>

		<div class="blogpost" id="post_id_<?php the_ID(); ?>">

		<?php if (has_post_thumbnail()) {
		$image = wp_get_attachment_image_src(get_post_thumbnail_id(get_the_id()), 'full', true); ?>	
		<div class="portimg" style="width:604px;"><div class="porthumb">
			<a rel="prettyPhoto" href="<?php echo $image['0']; ?>">	<?php $timthumboption=get_option('timthumboption'); if($timthumboption == "enable") { ?><img src="<?php bloginfo( 'template_directory' ); ?>/timthumb.php?src=<?php echo $image[0]; ?>&amp;w=600&amp;zc=1&amp;q=100" alt="" class="image" /><?php }else{ the_post_thumbnail('post_blog',array('class' =>'image'));  } ?></a>
		</div>
		</div>
		<?php } ?>	
				
				<div class="post-info">
					<span><?php the_time('M, D jS, Y') ?></span>
					<span><?php _e('Posted in','versatile_front')?> : <?php the_category(', ') ?> </span>
					<span><?php _e('By','versatile_front')?> : <?php the_author_posts_link(); ?> </span>
					<span><a href="<?php the_permalink(); ?>#comments" title="<?php __('View Comments','versatile_front')?>"><?php comments_number(0, 1, '%'); ?> <?php _e('Comments','versatile_front');?></a></span>
					<?php the_tags();?>
				</div>

		<div class="entry">	
		<?php the_content(''); ?>
		</div>

		<div class="clear"></div>
		<?php if($aboutauthor == "true") { sys_authorinfo(); } ?>

		<!-- post -->
		<div class="clear"></div>
		<?php 
	$relatedpopular=get_option('relatedpopular');
		if($relatedpopular == "true")
			{  sys_relatedpopular();
		 } ?>
		</div>

		<div class="clear"></div>
		<?php comments_template(); ?>
		
		<?php endwhile; else: ?>
		<?php '<p>'.__('Sorry, no posts matched your criteria.', 'versatile_front').'</p>';?>
		<?php endif; ?>	
		</div>
		</div><!--main -->

		<aside id="sidebar">
			<div class="content">
				<?php get_sidebar(); ?>
			</div><!-- content -->
		</aside>
		<!-- sidebar -->
	
	</div>
   	<!-- inner -->			
</div>
</div>
<!-- pagemid -->
<div class="clear"></div>
<?php get_footer(); ?>