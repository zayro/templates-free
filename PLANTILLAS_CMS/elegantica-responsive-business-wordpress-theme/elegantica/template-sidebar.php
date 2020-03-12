<?php
/*
Template Name: Page with sidebar
*/
?>

<?php get_header(); ?>

<div class = "outerpagewrap">
	<div class="pagewrap">
		<div class="pagecontent">
			<div class="pagecontentContent">
				<h1><?php the_title();?></h1>
				<p><?php the_breadcrumb(); ?></p>
			</div>
			<div class="homeIcon"><a href="<?php echo home_url(); ?>"></a></div>
		</div>

	</div>
</div>
			
<div id="mainwrap">

	<div id="main" class="clearfix">
	

	<div class="pad"></div>

					<div class="content pagesidebar">
							<div class="postcontent">
								<div class="posttext">
									<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
									
									
									<div class="usercontent"><?php the_content('<p class="serif">Read the rest of this page &raquo;</p>'); ?></div>
									
									<?php wp_link_pages(array('before' => '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
									
									<?php endwhile; endif; ?>
								</div>
								<div>
									<h3 class="titleborderh"><?php echo stripText($data['translation_share_page']) ?></h3>	
									<div class="titleborder"></div>
								</div>
								<div class="socialsingle"><?php socialLinkCat(get_permalink(),get_the_title(),false) ?></div>	
							</div>
					</div>
							<?php get_sidebar(); ?>
	</div>
</div>

<?php get_footer(); ?>
