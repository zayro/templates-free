<img src="<?php bloginfo('template_directory'); ?>/images/home-icon.png" width="16" height="16" class="bread-icon" />  <?php /* If this is the homepage */ if (is_home()) { ?>
<div class="breadcrumbs">
	<a href="<?php bloginfo('siteurl'); ?>" title="home"><?php _e('Home','versatile_front');?></a></div>
	<?php } ?>
	<?php /* If this is a tag archive */ if (is_tag() ) { ?>

<div class="breadcrumbs">
	<a href="<?php bloginfo('siteurl'); ?>" title="home"><?php _e('Home','versatile_front');?></a> &#187; <a href="#" rel="bookmark" title="Posts Tagged &#8216;<?php single_tag_title(); ?>&#8217;"><?php _e('Posts Tagged','versatile_front');?> &#8216;
    <?php single_tag_title(); ?>
    &#8217;</a>
</div>
<?php } ?>

<?php /* If this is a category archive */ if (is_category()) { ?>
<div class="breadcrumbs">
	<a href="<?php bloginfo('siteurl'); ?>" title="home"><?php _e('Home','versatile_front');?></a> &#187; <a href="#" title="<?php single_cat_title(); ?>">
    <?php single_cat_title(); ?>
    </a>
</div>
<?php } ?>

<?php if /* If this is a page */ (is_page()) { ?>
<div class="breadcrumbs">
	<a href="<?php bloginfo('siteurl'); ?>" title="home"><?php _e('Home','versatile_front');?></a> &#187;
    <?php
	global $wp_query;
	if (empty($wp_query->post->post_parent) ) {
		$parent = $wp_query->post->ID;
		echo '';
	} else {
		$parent = $wp_query->post->post_parent;
		echo '<a href="'.get_permalink($parent).'">'.get_the_title($parent).'</a> 	&#187;';
	}
?>
    <a href="<?php echo get_permalink() ?>" rel="bookmark" title="Permanent Link: <?php the_title(); ?>">
    <?php the_title(); ?>
    </a>
</div>
<?php } ?>

<?php if /* If this is a blog post */ (is_single()) { ?>
<div class="breadcrumbs">
	<a href="<?php bloginfo('siteurl'); ?>" title="home"><?php _e('Home','versatile_front');?></a> &#187;
	<?php the_category(', ') ?>
    &#187; <a href="<?php echo get_permalink() ?>" rel="bookmark" title="Permanent Link: <?php the_title(); ?>">
    <?php the_title(); ?>
    </a>
</div>
<?php } ?>

<?php if /* If this is a search page */ (is_search()) { ?>
<div class="breadcrumbs">
	<a href="<?php bloginfo('siteurl'); ?>" title="home"><?php _e('Home','versatile_front');?></a> &#187; <a href="<?php bloginfo('siteurl'); ?>" title="home"><?php _e('Home','versatile_front');?></a>
</div>
<?php } ?>

<?php /* If this is a 404 page */ if (is_404()) { ?>
<div class="breadcrumbs">
	<a href="<?php bloginfo('siteurl'); ?>" title="home"><?php _e('Home','versatile_front');?></a> &#187; <a href="#" title="404 Error page"><?php _e('404 Error','versatile_front');?></a>
</div>
<?php } ?>

<?php /* If this is a yearly archive */ if (is_year()) { ?>
<div class="breadcrumbs">
	<a href="<?php bloginfo('siteurl'); ?>" title="home"><?php _e('Home','versatile_front');?></a> &#187; <a href="<?php bloginfo('siteurl'); ?>/archives" title="archives"><?php _e('Archives','versatile_front');?></a> &#187; <a href="#" title="Year">
    <?php the_time('Y'); ?>
    </a>
</div>
<?php } ?>

<?php /* If this is a monthly archive */ if (is_month()) { ?>
<div class="breadcrumbs">
	<a href="<?php bloginfo('siteurl'); ?>" title="home"><?php _e('Home','versatile_front');?></a> &#187; <a href="<?php bloginfo('siteurl'); ?>/archives" title="archives"><?php _e('Archives','versatile_front'); ?></a> &#187; <a href="#" title="Month">
    <?php the_time('F, Y'); ?>
    </a>
</div>
<?php } ?>

<?php /* If this is a daily archive */ if (is_day()) { ?>
<div class="breadcrumbs">
	<a href="<?php bloginfo('siteurl'); ?>" title="home"><?php _e('Home','versatile_front');?></a> &#187; <a href="<?php bloginfo('siteurl'); ?>/archives" title="archives"><?php _e('Archives','versatile_front'); ?></a> &#187; <a href="#" title="Month">
    <?php the_time('F jS, Y'); ?>
    </a>
</div>
<?php } ?>

<?php /* If this is a author archive */ if (is_author()) { ?>
<div class="breadcrumbs">
	<a href="<?php bloginfo('siteurl'); ?>" title="home"><?php _e('Home','versatile_front');?></a> &#187; <a href="<?php bloginfo('siteurl'); ?>/archives" title="archives"><?php _e('Archives','versatile_front');?></a> &#187;
    <?php the_author_posts_link(); ?>
    <?php
if(isset($_GET['author_name'])) :
$curauth = get_userdatabylogin($author_name);
else :
$curauth = get_userdata(intval($author));
endif;
?>
    <a title="<?php echo $curauth->display_name; ?>'s posts" href="#"><?php echo $curauth->display_name; ?></a>
</div>
<?php } ?>
<!-- end breadcrumb -->