<?php
	// Template Name: About Us
?>
<?php get_header(); ?>
	<div class="container">
        <div class="span-24">
        	<div class="span-24 notopmargin">
            	<?php if($data['about_block1'] == true ) { ?>
                <h2><?php echo stripslashes($data['about_block1_header']); ?></h2>
                <p class="small-italic"><?php echo stripslashes($data['about_block1_description']); ?></p>
                <?php if($data['about_block1_presentation'] == true ) { ?>
                <div class="span-24 notopmargin">
                	<?php if ($data['about_block_select'] == "One Block") { ?>
                	<div class="span-24 notopmargin">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p1_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p1_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p1_t']); ?></p>
                    </div>
					<?php } ?>
                	<?php if ($data['about_block_select'] == "Two Blocks") { ?>
                	<div class="span-12 notopmargin">
                        <?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p1_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p1_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p1_t']); ?></p>
                    </div>
                    <div class="span-12 notopmargin last">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p2_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p2_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p2_t']); ?></p>
                    </div>
					<?php } ?>
                	<?php if ($data['about_block_select'] == "Three Blocks") { ?>
                	<div class="span-8 notopmargin">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p1_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p1_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p1_t']); ?></p>
                    </div>
                    <div class="span-8 notopmargin">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p2_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p2_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p2_t']); ?></p>
                    </div>
                    <div class="span-8 notopmargin last">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p3_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p3_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p3_t']); ?></p>
                    </div>
					<?php } ?>
					<?php if ($data['about_block_select'] == "Four Blocks") { ?>
                	<div class="span-12 notopmargin">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p1_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p1_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p1_t']); ?></p>
                    </div>
                    <div class="span-12 notopmargin last">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p2_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p2_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p2_t']); ?></p>
                    </div>
                    <div class="span-12 m15">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p3_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p3_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p3_t']); ?></p>
                    </div>
                    <div class="span-12 m15 last">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p4_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p4_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p4_t']); ?></p>
                    </div>
					<?php } ?>
                    <?php if ($data['about_block_select'] == "Six Blocks") { ?>
                	<div class="span-8 notopmargin">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p1_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p1_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p1_t']); ?></p>
                    </div>
                    <div class="span-8 notopmargin">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p2_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p2_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p2_t']); ?></p>
                    </div>
                    <div class="span-8 notopmargin last">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p3_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p3_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p3_t']); ?></p>
                    </div>
                    <div class="span-8 m15">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p4_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p4_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p4_t']); ?></p>
                    </div>
                    <div class="span-8 m15">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p5_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p5_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p5_t']); ?></p>
                    </div>
                    <div class="span-8 m15 last">
                    	<?php if($data['about_block1_icons'] == true ) { ?>
                        <div class="icon">
                            <img class="center" src="<?php echo stripslashes($data['about_block1_p6_i']); ?>" alt="" />
                        </div>
                        <?php } ?>
                        <h5 class="colored"><?php echo stripslashes($data['about_block1_p6_h']); ?></h5>
                        <p><?php echo stripslashes($data['about_block1_p6_t']); ?></p>
                    </div>
					<?php } ?>
                </div>
                <?php } ?>
                <div class="span-24 separator notopmargin"></div>
                <?php } ?>
                <?php if($data['about_block2'] == true ) { ?>
                <?php if($data['about_block2_image'] == true ) { ?>
                <div class="span-8 <?php if($data['about_block1'] == false ) { ?> notopmargin <?php } ?> ">
                    <img src="<?php echo stripslashes($data['about_block2_image_upload']); ?>" alt="" />
                </div>
                <?php } ?>
                <div class="<?php if($data['about_block2_image'] == true ) { ?> span-16 <?php } else { ?> span-24 <?php } ?> <?php if($data['about_block1'] == false ) { ?> notopmargin <?php } ?> last">
                	<div class="<?php if($data['about_block2_image'] == true ) { ?> span-16 <?php } else { ?> span-24 <?php } ?> notopmargin why">
						<h4><?php echo stripslashes($data['about_block2_h']); ?></h4>
                	</div>
                    <div class="<?php if(($data['about_block2_image'] == true ) & ($data['about_block2_spec'] == true )) { ?> span-8<?php } ?>   <?php if(($data['about_block2_image'] == false ) & ($data['about_block2_spec'] == true )) { ?> span-16<?php } ?>   <?php if(($data['about_block2_image'] == true ) & ($data['about_block2_spec'] == false )) { ?> span-16<?php } ?> <?php if(($data['about_block2_image'] == false ) & ($data['about_block2_spec'] == false )) { ?> span-24<?php } ?> notopmargin">
                    	<p><?php echo stripslashes($data['about_block2_t']); ?></p>
                    </div>
                    <?php if($data['about_block2_spec'] == true ) { ?>
                    <div class="span-8 notopmargin last skills">
                    	<h5 class="colored"><?php echo stripslashes($data['about_block2_spec_h']); ?></h5>
                    	<p class="small nobottommargin"><?php echo stripslashes($data['about_block2_spec_t']); ?></p>
                    </div>
                    <?php } ?>
                </div>
                <div class="span-24 notopmargin separator"></div>
                <?php } ?>
                <?php if($data['about_block3'] == true ) { ?>
                <div class="span-24 <?php if(($data['about_block2'] == false ) & ($data['about_block1'] == false )){ ?> notopmargin<?php } ?>">
                    <h3><?php echo stripslashes($data['about_block3_h']); ?></h3>
                    <p class="small-italic"><?php echo stripslashes($data['about_block3_t']); ?></p>
                    <div class="span-6 notopmargin clients">
                        <img src="<?php echo stripslashes($data['about_block3_image_upload_1']); ?>" alt="" />
                    </div>
                    <div class="span-6 notopmargin clients">
                        <img src="<?php echo stripslashes($data['about_block3_image_upload_2']); ?>" alt="" />
                    </div>
                    <div class="span-6 notopmargin clients">
                        <img src="<?php echo stripslashes($data['about_block3_image_upload_3']); ?>" alt="" />
                    </div>
                    <div class="span-6 notopmargin clients last">
                        <img src="<?php echo stripslashes($data['about_block3_image_upload_4']); ?>" alt="" />
                    </div>
            	</div>
                <?php } ?>
            </div>
         </div>
	</div>
    <div class="clear">
    </div>
</div>
<?php get_footer(); ?>