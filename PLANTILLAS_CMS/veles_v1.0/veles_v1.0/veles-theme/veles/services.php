<?php
	// Template Name: Services
?>
<?php get_header(); ?>

	<div class="container">
        <div class="span-24">
        	<div class="span-24 notopmargin">
				<?php if($data['services_block1'] == true ) { ?>
                    <h2><?php echo stripslashes($data['services_block1_title']); ?></h2>
                    <div class="span-24 notopmargin">
                    <div style="margin-bottom:20px;"><?php echo stripslashes($data['services_block1_content']); ?></div>
                    </div>
                    <div class="span-24 separator notopmargin"></div>
                <?php } ?>
                
                
                
                <?php if($data['services_block_check'] == true ) { ?>
                <div class="span-24">
					<?php if ($data['services_block_select'] == "One Block") { ?>
                    <div class="span-24 notopmargin">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p1_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p1_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p1_t']); ?></p>
                    </div>
                    <?php } ?>
                    <?php if ($data['services_block_select'] == "Two Blocks") { ?>
                    <div class="span-12 notopmargin">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p1_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p1_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p1_t']); ?></p>
                    </div>
                    <div class="span-12 notopmargin last">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p2_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p2_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p2_t']); ?></p>
                    </div>
                    <?php } ?>
                    <?php if ($data['services_block_select'] == "Three Blocks") { ?>
                    <div class="span-8 notopmargin">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p1_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p1_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p1_t']); ?></p>
                    </div>
                    <div class="span-8 notopmargin">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p2_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p2_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p2_t']); ?></p>
                    </div>
                    <div class="span-8 notopmargin last">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p3_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p3_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p3_t']); ?></p>
                    </div>
                    <?php } ?>
                    <?php if ($data['services_block_select'] == "Four Blocks") { ?>
                    <div class="span-12 notopmargin">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p1_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p1_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p1_t']); ?></p>
                    </div>
                    <div class="span-12 notopmargin last">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p2_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p2_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p2_t']); ?></p>
                    </div>
                    <div class="span-12 m15">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p3_i']); ?>" alt="" />
                        </div>
                
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p3_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p3_t']); ?></p>
                    </div>
                    <div class="span-12 m15 last">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p4_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p4_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p4_t']); ?></p>
                    </div>
                    <?php } ?>
                    <?php if ($data['services_block_select'] == "Six Blocks") { ?>
                    <div class="span-8 notopmargin">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p1_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p1_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p1_t']); ?></p>
                    </div>
                    <div class="span-8 notopmargin">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p2_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p2_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p2_t']); ?></p>
                    </div>
                    <div class="span-8 notopmargin last">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p3_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p3_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p3_t']); ?></p>
                    </div>
                    <div class="span-8 m15">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p4_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p4_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p4_t']); ?></p>
                    </div>
                    <div class="span-8 m15">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p5_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p5_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p5_t']); ?></p>
                    </div>
                    <div class="span-8 m15 last">
                        <?php if($data['services_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['services_block1_p6_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['services_block1_p6_h']); ?></h5>
                        <p><?php echo stripslashes($data['services_block1_p6_t']); ?></p>
                    </div>
                    <?php } ?>
                </div>
                <div class="span-24 separator notopmargin"></div>
                <?php } ?>
                
                
                
                
                
                
                
                
                <div class="span-24">
                	<?php if($data['services_block3'] == true ) { ?>
                	<div class="<?php if($data['services_block3_testimonials'] == false ) { ?>span-24 <?php } else{ ?> span-16 <?php } ?> <?php if($data['services_block3_testimonials'] == false ) { ?>service_full <?php } else{ ?> service <?php } ?> notopmargin">
                        <?php if ($data['services_block3_title'] == true){ ?>
                        <h4 class="uppercase"><?php echo stripslashes($data['services_block3_title']); ?></h4>
                    	<?php } ?>
                        <div>
                        <p><?php echo stripslashes($data['services_block3_content']); ?></p>
                        </div>
                    </div>
                    <?php if($data['services_block3_testimonials'] == true ) { ?>
                    <div class="span-8 last notopmargin skills">
                    	<h5 class="uppercase"><?php echo stripslashes($data['services_block3_testimonials_title']); ?></h5>
                        <div class="testimonialrotator">
                        	<?php if($data['services_block3_testimonials_1'] == true ) { ?>
                            <div class="testimonial">
                                <span><?php echo stripslashes($data['services_block3_testimonials_1']); ?></span>
                                <div class="the-author"><?php echo stripslashes($data['services_block3_testimonials_1_author']); ?></div>
                            </div>
                            <?php } ?>
                            <?php if($data['services_block3_testimonials_2'] == true ) { ?>
                            <div class="testimonial">
                                <span><?php echo stripslashes($data['services_block3_testimonials_2']); ?></span>
                                <div class="the-author"><?php echo stripslashes($data['services_block3_testimonials_2_author']); ?></div>
                            </div>
                            <?php } ?>
                            <?php if($data['services_block3_testimonials_3'] == true ) { ?>
                            <div class="testimonial">
                                <span><?php echo stripslashes($data['services_block3_testimonials_3']); ?></span>
                                <div class="the-author"><?php echo stripslashes($data['services_block3_testimonials_3_author']); ?></div>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                    <?php } ?>
                    <?php } ?>
                </div>
            </div>
         </div>
	</div>
    <div class="clear"></div>
    </div>
<?php get_footer(); ?>