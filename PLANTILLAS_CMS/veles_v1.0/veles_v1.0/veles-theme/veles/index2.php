<?php
	// Template Name: Home Page Style II
?>
<?php get_header(); ?>
<?php 
	global $more;
	$more = 0;	 
?>
        	<!--Slider-->
            <?php if ($data['slider_select'] == "AsyncSlider") { ?>
            <div class="my_asyncslider">
				<?php
                 $async = $data['sl_async'];                 
                 $i=0;
                 foreach($async as $slide){
                     $i++;
                ?>
                <div id="slide-<?php echo stripslashes($i); ?>">
                	<div>
                        <img src="<?php echo stripslashes($async[$i]['url']); ?>" alt="" />
                    </div>
                    <div class="description">
                    	<div><h2><?php echo stripslashes($async[$i]['title']); ?></h2></div>
                        <div><?php echo stripslashes($async[$i]['description']); ?></div>
                        <?php if (!(empty($async[$i]['link']))) { ?>
                    	<a href="<?php echo stripslashes($async[$i]['link']); ?>" class="a-btn">More details</a>
                    	<?php } ?> 
                    </div>
                </div>
                <?php } ?>   
            </div>
            <?php } ?>
            <!--END Slider-->
            <?php if ($data['slider_select'] == "Nivo Slider") { ?>
            <div class="container clear">
            <div class="clear"></div>
        	<div class="slider_area home">
            	<div class="theme-default">
                    <div id="slider" class="nivoSlider">
                        <?php
             $nivoslider = $data['sl_nivoslider'];                 
			 $i=0;
			 foreach($nivoslider as $slide){
				 $i++;
                ?>
                    <a href="<?php echo stripslashes($nivoslider[$i]['link']); ?>"><img src="<?php echo stripslashes($nivoslider[$i]['url']); ?>" alt="" title="<?php echo stripslashes($nivoslider[$i]['description']); ?>" /></a>        
                <?php } ?>
                    </div>
                    
                </div>
            </div>
        </div>
            <?php } ?>
            <?php if ($data['slider_select'] == "Vertical Accordion Slider") { ?>
            <div class="container clear">
        	<div class="slider_area home">
            	<div id="va-accordion" class="va-container slider-area">
                    <div class="va-nav">
                        <span class="va-nav-prev">Previous</span>
                        <span class="va-nav-next">Next</span>
                    </div>
                    <div class="va-wrapper">
                        <div class="va-slice va-slice-1" style="background-image:url(<?php echo stripslashes($data['va-slice-1']); ?>);">
                            <h3 class="va-title"><?php echo stripslashes($data['va-title-1']); ?></h3>
                            <div class="va-content">
                                <p><?php echo stripslashes($data['va-content-1']); ?></p>
                                <a href="<?php echo stripslashes($data['va-url-1']); ?>" class="va-more"></a>
                            </div>
                        </div>
                        <div class="va-slice va-slice-2" style="background-image:url(<?php echo stripslashes($data['va-slice-2']); ?>);">
                            <h3 class="va-title"><?php echo stripslashes($data['va-title-2']); ?></h3>
                            <div class="va-content">
                                <p><?php echo stripslashes($data['va-content-2']); ?></p>
                                <a href="<?php echo stripslashes($data['va-url-2']); ?>" class="va-more"></a>
                            </div>	
                        </div>
                        <div class="va-slice va-slice-3" style="background-image:url(<?php echo stripslashes($data['va-slice-3']); ?>);">
                            <h3 class="va-title"><?php echo stripslashes($data['va-title-3']); ?></h3>
                            <div class="va-content">
                                <p><?php echo stripslashes($data['va-content-3']); ?></p>
                                <a href="<?php echo stripslashes($data['va-url-3']); ?>" class="va-more"></a>
                            </div>	
                        </div>
                        <div class="va-slice va-slice-4" style="background-image:url(<?php echo stripslashes($data['va-slice-4']); ?>);">
                            <h3 class="va-title"><?php echo stripslashes($data['va-title-4']); ?></h3>
                            <div class="va-content">
                                <p><?php echo stripslashes($data['va-content-4']); ?></p>
                                <a href="<?php echo stripslashes($data['va-url-4']); ?>" class="va-more"></a>
                            </div>	
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <?php } ?>
            <?php if ($data['slider_select'] == "Accordion Slider") { ?>
            <div class="container clear">
        	<div class="slider_area home">
            	<div class="kwicks-box">
                    <ul class="kwicks horizontal" >
                    <?php $accordion_slider = $data['sl_accordion'];                 
						 $i=0;
						 foreach($accordion_slider as $slide){
							 $i++;
					?>
                        <li id="kwick_<?php echo $i; ?>"><img src="<?php echo stripslashes($accordion_slider[$i]['url']); ?>" alt="" />
                        <a href="<?php echo stripslashes($accordion_slider[$i]['link']); ?>">
                            <p class="accordian-slider-caption">
                                <span class="accordian-slider-captiontitle">
                                    <?php echo stripslashes($accordion_slider[$i]['title']); ?>
                                </span>
                                <span>
                                    <?php echo stripslashes($accordion_slider[$i]['description']); ?>
                                </span>
                            </p>
                        </a>
                    </li>
                    <?php } ?>
                    </ul>
                </div>
            </div>
        </div>
        	<?php } ?>
            <?php if ($data['slider_select'] == "Static Homepage") { ?>
            <div class="container clear">
                <div class="slider_area home">
                    <div class="static" style="background-image:url(<?php echo stripslashes($data['static_image']); ?>); background-repeat:no-repeat; background-position:center;">
                        <div class="notopmargin left black">
                            <h3 class="notopmargin"><?php echo stripslashes($data['static_image_header']); ?></a></h3>
                            <p><?php echo stripslashes($data['static_image_text']); ?></p>
                        </div>
                    </div>
                </div>
            </div>
            <?php } ?>
            <?php if ($data['slider_select'] == "Video Block") { ?>
            <div class="container clear">
                <div class="slider_area home">
                    <div id="video-block">
                        <?php echo stripslashes($data['sl_video']); ?>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
        
        
        
        <!--Main Content-->
        <div class="container">
        <div class="span-24 <?php if (!($data['slider_select'] == "AsyncSlider") ) { ?>separator<?php } ?>"></div>
        	<div class="span-24">
				<?php if ($data['index2_block_select'] == "One Block") { ?>
                <div class="span-24 notopmargin">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p1_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p1_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p1_t']); ?></p>
                </div>
                <?php } ?>
                <?php if ($data['index2_block_select'] == "Two Blocks") { ?>
                <div class="span-12 notopmargin">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p1_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p1_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p1_t']); ?></p>
                </div>
                <div class="span-12 notopmargin last">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p2_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p2_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p2_t']); ?></p>
                </div>
                <?php } ?>
                <?php if ($data['index2_block_select'] == "Three Blocks") { ?>
                <div class="span-8 notopmargin">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p1_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p1_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p1_t']); ?></p>
                </div>
                <div class="span-8 notopmargin">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p2_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p2_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p2_t']); ?></p>
                </div>
                <div class="span-8 notopmargin last">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p3_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p3_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p3_t']); ?></p>
                </div>
                <?php } ?>
                <?php if ($data['index2_block_select'] == "Four Blocks") { ?>
                <div class="span-12 notopmargin">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p1_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p1_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p1_t']); ?></p>
                </div>
                <div class="span-12 notopmargin last">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p2_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p2_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p2_t']); ?></p>
                </div>
                <div class="span-12 m15">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p3_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p3_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p3_t']); ?></p>
                </div>
                <div class="span-12 m15 last">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p4_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p4_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p4_t']); ?></p>
                </div>
                <?php } ?>
                <?php if ($data['index2_block_select'] == "Six Blocks") { ?>
                <div class="span-8 notopmargin">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p1_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p1_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p1_t']); ?></p>
                </div>
                <div class="span-8 notopmargin">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p2_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p2_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p2_t']); ?></p>
                </div>
                <div class="span-8 notopmargin last">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p3_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p3_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p3_t']); ?></p>
                </div>
                <div class="span-8 m15">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p4_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p4_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p4_t']); ?></p>
                </div>
                <div class="span-8 m15">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p5_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p5_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p5_t']); ?></p>
                </div>
                <div class="span-8 m15 last">
                    <?php if($data['index2_block1_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" src="<?php echo stripslashes($data['index2_block1_p6_i']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index2_block1_p6_h']); ?></h5>
                    <p><?php echo stripslashes($data['index2_block1_p6_t']); ?></p>
                </div>
                <?php } ?>
                <div class="span-24 notopmargin separator"></div>
            </div>
            <div class="span-24 notopmargin">
            	<div class="span-16 notopmargin">
				<?php
                    $loop = new WP_Query(array('post_type' => 'post', 'showposts' => $data['index2_blogs'], 'order' => 'DESC')); 
                ?>
                <?php if (!(have_posts())) { ?><div class="span-24"><h2 class="colored uppercase">There is no posts</h2></div><?php }  ?>   
                <?php while ( $loop->have_posts() ) : $loop->the_post(); ?>	
                <div class="span-16 notopmargin blog">
                    <div class="span-16 blog-title">
                        <div class="date">
                            <h3 class="colored"><?php the_time('d') ?> <?php the_time('M') ?><br/><span><?php the_time('Y') ?></span></h3>
                        </div>
                        <div class="post-title">
                            <h3><a href="<?php echo the_permalink(); ?>"><?php the_title(); ?></a></h3>
                            <div class="meta author">Author: <?php the_author_meta('nickname'); ?></div>
                            <div class="meta comments"> Comments: <a class="link" href="<?php the_permalink() ?>#comments"><?php comments_number('0','1','%')?></a></div>
                            <div class="meta tags" style="padding-left:20px;">Tags: 
							<?php $tag = get_the_tags();
							if (! $tag) { ?> There is no tags							
							<?php } else { ?>
								<?php the_tags(''); ?>
							<?php } ?>
							</div>
                        </div>
                    </div>
                    <?php if (get_post_meta($post->ID, video, true));{ ?>
                    	<div class="view view-first">
						<?php echo get_post_meta($post->ID, video, true); ?>
                        </div>
                    <?php } ?>
                    <?php if ( has_post_thumbnail()) { ?>
                    <div class="view view-first">
                    	<?php $large_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'large'); ?>
                         <?php  
								$pretty_attr = array(
											'class'	=> "bordered_img last center",
							); ?>
                        <div class="blog_wide"><a><?php if ( has_post_thumbnail()) { the_post_thumbnail('blog2',$pretty_attr);	} ?></a></div>
                        <div class="mask">
                            <a href="<?php echo $large_image_url[0]; ?>" rel="prettyPhoto" class="info">Zoom image</a>
                        </div>
                    </div>
                    <?php } ?>
                    <div class="span-16 post-short">
                        <?php the_content('<a class="button_readmore" href="'. get_permalink($post->ID) . '"> Read more</a>'); ?>
                    </div>
                </div>
				<?php endwhile; ?>
            </div>
            
            
            
            <div class="span-8 skills last">
            	<div class="sidebar">
                    <h5>Recent projects</h5>
                    <?php
						$nloop = new WP_Query(array('post_type' => 'portfolio', 'showposts' => $data['index2_portfolio'], 'order' => 'DESC'));
					?>
					<?php if (!(have_posts())) { ?><div class="span-24"><h2 class="colored uppercase">There is no posts</h2></div><?php }  ?>   
					<?php while ( $nloop->have_posts() ) : $nloop->the_post(); ?>	
                    <?php
                        $large_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'large'); 
                        $small_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'portfolio-fourth'); 
                    ?>
                    <div style="margin-left:10px; margin-top:20px;">
                        <div class="view view-first" style="margin-right:0px !important;">
                            <a  title=""><img src="<?php echo $small_image_url[0]; ?>" class="bordered_img last" alt=" "/></a>
                            <div class="mask">
                                <h4><?php the_title(); ?></h4>
                                <a href="<?php echo get_permalink(); ?>" class="info">More details</a>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <?php endwhile; ?>
                </div>
                
            </div>
            
            
            
            </div>
    	</div>
    <!--END main contetnt-->
    <div class="clear"></div>
<?php get_footer(); ?>