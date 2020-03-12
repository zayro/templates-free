    <?php  global $data; 
	?>
    <!--Footer-->
    <div class="footer">
    	<div class="container">
        	<div class="span-6 logo_area">
            	<?php if($data['footer_logo'] == true ) { ?>
            	<a href=""><img src="<?php echo stripslashes($data['footer_logo']); ?>" alt="Logo" /></a>
                <?php } ?>
                <h6><?php echo $data['feel_free']; ?></h6>
                <p><?php echo $data['veles_adress']; ?><br/><span class="black">Phone:</span> <?php echo $data['veles_phone']; ?></p>
                <div class="separator"></div>
                <?php if($data['Twitter'] == true ) { ?>
                <div class="tweet-icon">
                    <a href="<?php echo $data['twitter_url']; ?>" class='social' title='Twitter'><img src="<?php echo get_template_directory_uri(); ?>/images/1px.png" alt="" width="26px" height="26px" /></a>
                </div>
                <?php } ?>
                <?php if($data['Facebook'] == true ) { ?>
                <div class="facebook-icon">
                    <a href="<?php echo $data['facebook_url']; ?>" class='social' title='Facebook'><img src="<?php echo get_template_directory_uri(); ?>/images/1px.png" alt="" width="26px" height="26px" /></a>
                </div>
                <?php } ?>
                <?php if($data['Google+'] == true ) { ?>
                <div class="google-icon">
                    <a href="<?php echo $data['google_url']; ?>" class='social' title='Google +'><img src="<?php echo get_template_directory_uri(); ?>/images/1px.png" alt="" width="26px" height="26px" /></a>
                </div>
                <?php } ?>
                <?php if($data['Vimeo'] == true ) { ?>
                <div class="vimeo-icon">
                    <a href="<?php echo $data['vimeo_url']; ?>" class='social' title='Vimeo'><img src="<?php echo get_template_directory_uri(); ?>/images/1px.png" alt="" width="26px" height="26px" /></a>
                </div>
                <?php } ?>
                <?php if($data['Dribbble'] == true ) { ?>
                <div class="dribbble-icon">
                    <a href="<?php echo $data['dribbble_url']; ?>" class='social' title='Dribbble'><img src="<?php echo get_template_directory_uri(); ?>/images/1px.png" alt="" width="26px" height="26px" /></a>
                </div>
                <?php } ?>
            </div>
        	<div class="span-6">
                <h5 class="footer_welcome"><?php echo stripslashes($data['footer_block2_title']); ?></h5>
                <div class="span-6 separator"></div>
                <p><?php echo stripslashes($data['footer_block2_text']); ?></p>
                <?php if($data['footer_block2_spec'] == true ) { ?>
				<p class="small-italic highlight"><?php echo stripslashes($data['footer_block2_spec']); ?></p>
            	<?php } ?>
            </div>
            <div class="span-6 posts recent">
            	<?php if (empty($data['footer_block3_text']) & empty($data['footer_block3_title'])){ ?>
                <h5 class="footer_welcome"><span class="colored">Recent</span> posts</h5>
                <div class="span-6 separator" style="margin-bottom:0px;"></div>
                <ul style="margin-top:25px;">
                <li><?php wp_get_archives('type=postbypost&limit=5'); ?></li>
                </ul>
                <?php } ?>
                <?php if (($data['footer_block3_text']) || ($data['footer_block3_title'])){ ?>
                <h5 class="footer_welcome"><?php if (empty($data['footer_block3_title'])) { echo "No title here"; }else{ echo $data['footer_block3_title']; }?></h5>
                <div class="span-6 separator"></div>
                <p class="small"><?php echo $data['footer_block3_text']; ?></p>
                <?php } ?>
            </div>
            <div class="span-6 last">
            	<?php if (empty($data['footer_block4_text']) & empty($data['footer_block4_title'])){ ?>
                <h5 class="footer_welcome"><span class="colored">Twitter</span> feed</h5>
                <div class="span-6 separator"></div>
                <div id="jstwitter" class="tweet">
                </div>
                <?php } ?>
                <?php if (($data['footer_block4_text']) || ($data['footer_block4_title'])){ ?>
                <h5 class="footer_welcome"><?php if (empty($data['footer_block4_title'])) { echo "No title here"; }else{ echo stripslashes($data['footer_block4_title']); }?></h5>
                <div class="span-6 separator"></div>
                <p class="small"><?php echo stripslashes($data['footer_block4_text']); ?></p>
                <?php } ?>
            </div>
        </div>
    	<div class="clear"></div>
    </div>
    <?php wp_footer(); ?>
    <!--End Footer-->
</body>
</html>