<?php require(sys_includes."/var.php");?>
	<div id="subheader" class="<?php sidebaroption($post->ID); ?>">
		<?php sub_header_text($post->ID); ?>single
	</div>
	<!-- subheader -->
</header>
<!-- header -->

<div class="pagemid <?php sidebaroption($post->ID); ?>">
<div class="topshadow">	
	<div class="inner">
	
		<div id="main">
		<!-- breadcrumb -->
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

		<div class="post" id="post_id_<?php the_ID(); ?>">
	
		<h3><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h3>

		<?php if (has_post_thumbnail()) {
		$image = wp_get_attachment_image_src(get_post_thumbnail_id(get_the_id()), 'full', true); ?>	
		<div class="portimg"><div class="porthumb">	<?php if($timthumboption == "enable") { ?>
			<a rel="prettyPhoto" href="<?php echo $image['0']; ?>"><img src="<?php bloginfo( 'template_directory' ); ?>/timthumb.php?src=<?php echo $image[0]; ?>&amp;w=600" alt="" class="image" /><?php }else{ the_post_thumbnail('post_blog',array('class' =>'image'));  } ?></a>
		</div>
		</div>
		<?php } ?>	

		<div class="divider_space"></div>			
		<div class="entry">	
		<?php the_content(''); ?>
		<?php wp_link_pages(array('before' => '<p><strong>'.__('Pages:', 'versatile_front').'</strong>', 'after' => '</p>', 'next_or_number' => 'number')); ?>
		<?php the_tags( '<p>'.__('Tags', 'versatile_front') ', ', ', '.'</p>'); ?>
		</div>
		<!-- post -->
		<div class="clear"></div>
		</div>

	
		<?php endwhile; else: ?>
		<?php '<p>'.__('Sorry, no posts matched your criteria.', 'versatile_front').'</p>'?>
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

<div class="clear"></div>
<?php get_footer(); ?>