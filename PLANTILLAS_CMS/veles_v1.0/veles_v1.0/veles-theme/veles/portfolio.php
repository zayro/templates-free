<?php

/* Template Name: Portfolio */



$paged = 1;
if ( get_query_var('paged') ) $paged = get_query_var('paged');
if ( get_query_var('page') ) $paged = get_query_var('page');

query_posts( '&post_type=portfolio&paged=' . $paged );

?>
<?php
$title = get_the_title();
if ( $title == "3 Columns Portfolio")  $data['sl_portfolio_style'] = "3 Columns Portfolio";
if ( $title == "4 Columns Portfolio")  $data['sl_portfolio_style'] = "4 Columns Portfolio";
if ( $title == "Portfolio and Right Sidebar")  $data['sl_portfolio_style'] = "Portfolio and Right Sidebar";
if ( $title == "4 Columns Portfolio")  query_posts( '&post_type=portfolio&posts_per_page=8&paged=' . $paged );
if ( $title == "Portfolio and Right Sidebar")  query_posts( '&post_type=portfolio&posts_per_page=10&paged=' . $paged );
if ( $title == "3 Columns Portfolio")  query_posts( '&post_type=portfolio&posts_per_page=6&paged=' . $paged );
?>
<?php get_header(); ?>

<div class="container">
<?php if ((!($data['sl_portfolio_style'] == "Portfolio and Right Sidebar")) & (!($data['sl_portfolio_style'] == "Portfolio and Left Sidebar"))) { ?>
<div class="span-24">
<?php 
echo "<ul id='filter'><li class='current'><a href='#'>All</a></li>";
$categories = get_categories(array('type' => 'post', 'taxonomy' => 'portfolio-category')); 
foreach($categories as $category) {
  echo "<li><a href='#'>".$category->cat_name."</a></li>";
}
echo "</ul>";

?>
</div>
<?php } ?>


<?php if ($data['sl_portfolio_style'] == "3 Columns Portfolio") { ?>
<ul class="span-24 un_grid" id="portfolio">
<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?> 
	<?php
		$custom = get_post_custom($post->ID);
        $large_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'large'); 
        $small_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'portfolio-three'); 
 		 
        $cat = get_the_category($post->ID); 
 		$cat = $cat[0]; 
    ?>
	<?php $cur_terms = get_the_terms( $post->ID, 'portfolio-category' ); 
  foreach($cur_terms as $cur_term){  
  }  
    ?>
 	<li class="<?php echo strtolower($cur_term->name); ?>">
    <div class="span-8 view view-first">
        <a title=""><img src="<?php echo $small_image_url[0]; ?>" class="bordered_img last" alt=" "/></a>
        <div class="mask">
            <h4><?php the_title(); ?></h4>
            <a href="<?php echo get_permalink(); ?>" class="info">More details</a>
        </div>
    </div>
	</li>
<?php endwhile; endif; ?>				
</ul>
<div class="span-24">	
<?php paginate(); ?>
</div>
<?php } ?>








<?php if ($data['sl_portfolio_style'] == "Portfolio and Right Sidebar") { ?>
<div  class="span-16 notopmargin un_grid16">
<ul id="portfolio">
<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?> 
	<?php
		$custom = get_post_custom($post->ID);
        $large_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'large'); 
        $small_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'portfolio-three'); 
 		 
        $cat = get_the_category($post->ID); 
 		$cat = $cat[0]; 
    ?>
	<?php $cur_terms = get_the_terms( $post->ID, 'portfolio-category' ); 
  foreach($cur_terms as $cur_term){  
  }  
    ?>
    
 	<li class="<?php echo strtolower($cur_term->name); ?>">
    <div class="span-8 view view-first">
        <a title=""><img src="<?php echo $small_image_url[0]; ?>" class="bordered_img last" alt=" "/></a>
        <div class="mask">
            <h4><?php the_title(); ?></h4>
            <a href="<?php echo get_permalink(); ?>" class="info">More details</a>
        </div>
    </div>
	</li>
<?php endwhile; endif; ?>				
</ul>
<div class="span-16">	
<?php paginate(); ?>
</div>
</div>
<div class="span-8 skills last">
<div class="sidebar">
<h5>CAtegories</h5>
<?php 
echo "<ul id='filter-sidebar'><li class='current'><a href='#'>All</a></li>";
$categories = get_categories(array('type' => 'post', 'taxonomy' => 'portfolio-category')); 
foreach($categories as $category) {
  echo "<li><a href='#'>".$category->cat_name."</a></li>";
}
echo "</ul>";

?>
</div>
<div class="big-separator"></div>
<?php get_sidebar(); ?>
</div>
<?php } ?>









<?php if ($data['sl_portfolio_style'] == "Portfolio and Left Sidebar") { ?>
<div class="span-8 skills last left-sidebar">
<div class="sidebar">
<h5>CAtegories</h5>
<?php 
echo "<ul id='filter-sidebar'><li class='current'><a href='#'>All</a></li>";
$categories = get_categories(array('type' => 'post', 'taxonomy' => 'portfolio-category')); 
foreach($categories as $category) {
  echo "<li><a href='#'>".$category->cat_name."</a></li>";
}
echo "</ul>";

?>
</div>
<div class="big-separator"></div>
<?php get_sidebar(); ?>
</div>


<div class="span-16 notopmargin un_grid16 lleft">
<ul id="portfolio" class="un_grid16">
<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?> 
	<?php
		$custom = get_post_custom($post->ID);
        $large_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'large'); 
        $small_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'portfolio-three'); 
 		 
        $cat = get_the_category($post->ID); 
 		$cat = $cat[0]; 
    ?>
	<?php $cur_terms = get_the_terms( $post->ID, 'portfolio-category' ); 
  foreach($cur_terms as $cur_term){  
  }  
    ?>
    
 	<li class="<?php echo strtolower($cur_term->name); ?>">
    <div class="span-8 view view-first left-item">
        <a title=""><img src="<?php echo $small_image_url[0]; ?>" class="bordered_img last" alt=" "/></a>
        <div class="mask">
            <h4><?php the_title(); ?></h4>
            <a href="<?php echo get_permalink(); ?>" class="info">More details</a>
        </div>
    </div>
	</li>
<?php endwhile; endif; ?>				
</ul>
<div class="span-16 left-item">	
<?php paginate(); ?>
</div>
</div>
<?php } ?>











<?php if ($data['sl_portfolio_style'] == "4 Columns Portfolio") { ?>
<ul class="span-24 un_grid" id="portfolio">
<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?> 
	<?php
		$custom = get_post_custom($post->ID);
        $large_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'large'); 
        $small_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'portfolio-fourth'); 
 		 
        $cat = get_the_category($post->ID); 
 		$cat = $cat[0]; 
    ?>
	<?php $cur_terms = get_the_terms( $post->ID, 'portfolio-category' ); 
  foreach($cur_terms as $cur_term){  
  }  
    ?>
 	<li class="<?php echo strtolower($cur_term->name); ?>">
    <div class="span-6 view view-first">
        <a  title=""><img src="<?php echo $small_image_url[0]; ?>" class="bordered_img last" alt=" "/></a>
        <div class="mask">
            <h4><?php the_title(); ?></h4>
            <a href="<?php echo get_permalink(); ?>" class="info">More details</a>
        </div>
    </div>
	</li>
<?php endwhile; endif; ?>				
</ul>
<div class="span-24">	
<?php paginate(); ?>
</div>
<?php } ?>

</div>
<div class="clear"></div>

<?php get_footer(); ?>