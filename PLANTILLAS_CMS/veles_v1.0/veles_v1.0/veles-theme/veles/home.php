<?php
	// Template Name: Home Page Style I
$title = get_the_title();
if ( $title == "Nivo Slider")  $data['slider_select'] = "Nivo Slider";
if ( $title == "Accordion Slider")  $data['slider_select'] = "Accordion Slider";
if ( $title == "Vertical Accordion Slider")  $data['slider_select'] = "Vertical Accordion Slider";
if ( $title == "Static Homepage")  $data['slider_select'] = "Static Homepage";
if ( $title == "Video Block")  $data['slider_select'] = "Video Block";
?>
<?php get_header(); ?>
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
        <div class="span-24 <?php if (!(($data['slider_select'] == "AsyncSlider") & (is_front_page()))) { ?>separato<?php } ?>r"></div>
        <div class="<?php if($data['index_block3'] == true ) { ?>span-16<?php } else { ?> span-24<?php } ?>">
        	<?php if($data['index_block1'] == true ) { ?>
            <div class="<?php if($data['index_block3'] == true ) { ?>span-16<?php } else { ?> span-24<?php } ?> notopmargin">
                <div class="<?php if($data['index_block3'] == true ) { ?>span-16<?php } else { ?> span-24<?php } ?> notopmargin last">
                    <h3 class="uppercase"><?php echo stripslashes($data['index_block1_header']); ?></h3>
                </div>
                <div class="<?php if($data['index_block3'] == true ) { ?>span-16<?php } else { ?> span-24<?php } ?> last notopmargin">
                    <p><?php echo stripslashes($data['index_block1_text']); ?></p>
                    <?php if ($data['index_block1_url'] == true) {?>
                    <a class="button_readmore"  href="<?php echo stripslashes($data['index_block1_url']); ?>">Read more</a>
					<?php } ?>
                </div>
            </div>
            <div class="<?php if($data['index_block3'] == true ) { ?>span-16<?php } else { ?> span-24<?php } ?> last separator"></div>
            <?php } ?>
            <?php if($data['index_block2'] == true ) { ?>
            <div class="<?php if($data['index_block3'] == true ) { ?>span-16<?php } else { ?> span-24<?php } ?> <?php if($data['index_block1'] == false ) { ?> notopmargin<?php } ?>">
                <div class="<?php if($data['index_block3'] == true ) { ?>span-16<?php } else { ?> span-24<?php } ?> notopmargin">
                    <h3 class="uppercase"><?php echo stripslashes($data['index_block2_header']); ?></h3>
                    <p class="small-italic"><?php echo stripslashes($data['index_block2_subheader']); ?></p>
                </div>
                <?php if ($data['block_select'] == "Two Blocks") { ?>
                <div class="<?php if($data['index_block3'] == true ) { ?>span-8<?php } else { ?> span-12<?php } ?> notopmargin">
                	<?php if($data['index_block2_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" img src="<?php echo stripslashes($data['index_block2_spec1_img']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index_block2_spec1_header']); ?></h5>
                    <p><?php echo stripslashes($data['index_block2_spec1_text']); ?></p>
                </div>
                <div class="<?php if($data['index_block3'] == true ) { ?>span-8<?php } else { ?> span-12<?php } ?> last notopmargin">
                    <?php if($data['index_block2_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" img src="<?php echo stripslashes($data['index_block2_spec2_img']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index_block2_spec2_header']); ?></h5>
                    <p><?php echo stripslashes($data['index_block2_spec2_text']); ?></p>
                </div>
                <?php } ?>
				<?php if ($data['block_select'] == "Four Blocks") { ?>
                <div class="<?php if($data['index_block3'] == true ) { ?>span-8<?php } else { ?> span-6<?php } ?> notopmargin">
                    <?php if($data['index_block2_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" img src="<?php echo stripslashes($data['index_block2_spec1_img']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index_block2_spec1_header']); ?></h5>
                    <p><?php echo stripslashes($data['index_block2_spec1_text']); ?></p>
                </div>
                <div class="<?php if($data['index_block3'] == true ) { ?>span-8<?php } else { ?> span-6<?php } ?> <?php if($data['index_block3'] == true ) { ?> last <?php } ?> notopmargin">
                	<?php if($data['index_block2_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" img src="<?php echo stripslashes($data['index_block2_spec2_img']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index_block2_spec2_header']); ?></h5>
                    <p><?php echo stripslashes($data['index_block2_spec2_text']); ?></p>
                </div>
                <div class="<?php if($data['index_block3'] == true ) { ?>span-8<?php } else { ?> span-6 notopmargin<?php } ?>">
                	<?php if($data['index_block2_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" img src="<?php echo stripslashes($data['index_block2_spec3_img']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index_block2_spec3_header']); ?></h5>
                    <p><?php echo stripslashes($data['index_block2_spec3_text']); ?></p>
                </div>
                <div class="<?php if($data['index_block3'] == true ) { ?>span-8<?php } else { ?> span-6 notopmargin<?php } ?> last">
                	<?php if($data['index_block2_icons'] == true ) { ?>
                    <div class="icon">
                        <img class="center" img src="<?php echo stripslashes($data['index_block2_spec4_img']); ?>" alt="" />
                    </div>
                    <?php } ?>
                    <h5 class="colored"><?php echo stripslashes($data['index_block2_spec4_header']); ?></h5>
                    <p><?php echo stripslashes($data['index_block2_spec4_text']); ?></p>
                </div>
				<?php } ?>
            </div>
			<?php } ?>
        </div>
		
        
        
        
        <?php if($data['index_block3'] == true ) { ?>
        <?php if ($data['skills_select'] == "Just Header and Text") { ?>
        <div class="span-8 last skills">
        	<h4 class="uppercase colored center"><?php echo stripslashes($data['index_block3_header']); ?></h4>
            <p class="small-italic center"><?php echo stripslashes($data['index_block3_subheader']); ?></p>
        </div>
        <?php } ?>
        <?php if ($data['skills_select'] == "One Skill") { ?>
        <div class="span-8 last skills">
        	<h4 class="uppercase colored center"><?php echo stripslashes($data['index_block3_header']); ?></h4>
            <p class="small-italic center"><?php echo stripslashes($data['index_block3_subheader']); ?></p>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill1_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill1_percent']); ?>%"></span>
            </div>
        </div>
        <?php } ?>
        <?php if ($data['skills_select'] == "Two Skills") { ?>
        <div class="span-8 last skills">
        	<h4 class="uppercase colored center"><?php echo stripslashes($data['index_block3_header']); ?></h4>
            <p class="small-italic center"><?php echo stripslashes($data['index_block3_subheader']); ?></p>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill1_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill1_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill2_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill2_percent']); ?>%"></span>
            </div>
        </div>
        <?php } ?>
        <?php if ($data['skills_select'] == "Three Skills") { ?>
        <div class="span-8 last skills">
        	<h4 class="uppercase colored center"><?php echo stripslashes($data['index_block3_header']); ?></h4>
            <p class="small-italic center"><?php echo stripslashes($data['index_block3_subheader']); ?></p>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill1_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill1_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill2_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill2_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill3_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill3_percent']); ?>%"></span>
            </div>
        </div>
        <?php } ?>
		<?php if ($data['skills_select'] == "Four Skills") { ?>
        <div class="span-8 last skills">
        	<h4 class="uppercase colored center"><?php echo stripslashes($data['index_block3_header']); ?></h4>
            <p class="small-italic center"><?php echo stripslashes($data['index_block3_subheader']); ?></p>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill1_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill1_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill2_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill2_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill3_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill3_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill4_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill4_percent']); ?>%"></span>
            </div>
        </div>
        <?php } ?>
		<?php if ($data['skills_select'] == "Five Skills") { ?>
        <div class="span-8 last skills">
        	<h4 class="uppercase colored center"><?php echo stripslashes($data['index_block3_header']); ?></h4>
            <p class="small-italic center"><?php echo stripslashes($data['index_block3_subheader']); ?></p>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill1_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill1_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill2_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill2_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill3_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill3_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill4_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill4_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill5_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill5_percent']); ?>%"></span>
            </div>
        </div>
        <?php } ?>
        <?php if ($data['skills_select'] == "Six Skills") { ?>
        <div class="span-8 last skills">
        	<h4 class="uppercase colored center"><?php echo stripslashes($data['index_block3_header']); ?></h4>
            <p class="small-italic center"><?php echo stripslashes($data['index_block3_subheader']); ?></p>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill1_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill1_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill2_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill2_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill3_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill3_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill4_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill4_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill5_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill5_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill6_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill6_percent']); ?>%"></span>
            </div>
        </div>
        <?php } ?>
        <?php if ($data['skills_select'] == "Seven Skills") { ?>
        <div class="span-8 last skills">
        	<h4 class="uppercase colored center"><?php echo stripslashes($data['index_block3_header']); ?></h4>
            <p class="small-italic center"><?php echo stripslashes($data['index_block3_subheader']); ?></p>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill1_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill1_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill2_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill2_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill3_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill3_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill4_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill4_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill5_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill5_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill6_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill6_percent']); ?>%"></span>
            </div>
            <h6 class="colored"><?php echo stripslashes($data['index_block3_skill7_header']); ?></h6>
            <div class="progress-bar blue stripes">
                <span style="width: <?php echo stripslashes($data['index_block3_skill7_percent']); ?>%"></span>
            </div>
        </div>
        <?php } ?>
        <?php } ?>
        <?php if($data['index1_block4'] == true ) { ?>
        <?php if($data['index_block2'] == true ) { ?><div class="span-24 separator"></div><?php } ?>
        <div class="span-24">
			<?php if (!(empty($data['index3_block2_title']))) { ?>
            <h3 class="uppercase"><?php echo stripslashes($data['index1_block4_title']); ?></h3>
            <?php } ?>
            <?php if (!(empty($data['index3_block2_content']))) { ?>
            <p class="small-italic nobottommargin"><?php echo stripslashes($data['index1_block4_content']); ?></p>
            <?php } ?>
        </div>
        <div class="span-24 un_grid notopmargin last">
            <div class="index">
                <?php
                    $nloop = new WP_Query(array('post_type' => 'portfolio', 'showposts' => $data['index1_portfolio'], 'order' => 'DESC'));
                ?>
                <?php if (!(have_posts())) { ?><div class="span-24"><h2 class="colored uppercase">There is no posts</h2></div><?php }  ?>   
                <?php while ( $nloop->have_posts() ) : $nloop->the_post(); ?>	
                <?php
                    $large_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'large'); 
                    $small_image_url = wp_get_attachment_image_src( get_post_thumbnail_id(), 'portfolio-fourth'); 
                ?>
                <div>
                 <div class="span-6 view view-first marginx">
                    <a  title=""><img src="<?php echo $small_image_url[0]; ?>" class="bordered_img last" alt=" "/></a>
                    <div class="mask">
                        <h4><?php the_title(); ?></h4>
                        <a href="<?php echo get_permalink(); ?>" class="info">More details</a>
                    </div>
                </div>
                </div>
                <?php endwhile; ?>
            </div>
        </div>
        <?php } ?>
    </div>
    <!--END main contetnt-->
    <div class="clear"></div>
<?php get_footer(); ?>