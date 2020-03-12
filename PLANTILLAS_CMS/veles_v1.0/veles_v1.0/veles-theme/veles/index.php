<?php get_header(); ?>
<?php 
	global $more;
	$more = 0;	 
?>
	<div class="container">
    	<div class="span-24">
        	
			<div class="span-16 notopmargin">

            <?php if (!(have_posts())) { ?><div class="span-24"><h2 class="colored uppercase">There is no posts</h2></div><?php }  ?>   
            <?php if ( have_posts() ) : while ( have_posts() ) : the_post(); 
            ?>	
                <div class="span-16 notopmargin">

                        <?php the_content('<a class="button_readmore" href="'. get_permalink($post->ID) . '"> Read more</a>'); ?>

                </div>
                <?php endwhile;  ?> 
				<?php endif; ?>
            </div>
            <div class="span-8 skills notopmargin last">
				<?php get_sidebar(); ?>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>

<?php get_footer(); ?>