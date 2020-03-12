<?php
	// Template Name: Contacts
?>
<?php get_header(); ?>
	<div class="container">
		<div class="span-24">
            <?php if($data['checkbox_google_map'] == true ) { ?>
            <div class="map"><iframe class="bordered_img" width="920" height="350" frameborder="1" scrolling="no" marginheight="0" marginwidth="0" src="<?php echo $data['veles_google_map']; ?>"></iframe></div>
            <?php } ?>
            <?php if($data['checkbox_contact_form'] == true ) { ?>
            <div class="span-16 post_form <?php if($data['checkbox_google_map'] == false ) { ?> notopmargin <?php } ?>">
            	<fieldset class="info_fieldset">
                <div id="note"></div>
                <div id="contacts-form">
                <form id="ajax-contact-form" action="javascript:alert('Was send!');">
                <div class="span-8 form notopmargin">
                  <input class="text" type="text" name="name" value="" placeholder="Name" required /><br />
                </div>
                <div class="span-8 form last notopmargin">
                  <input class="text" type="text" name="email" value="" placeholder="E-mail" required /><br />
                </div>
                <div class="span-16 last formtop">
                    <input class="texts" type="text" name="subject" value="" placeholder="Subject" required /><br />
                </div>
                <div class="span-16 last">
                    <textarea class="text" name="message" rows="5" cols="25" placeholder="Message" required ></textarea><br />
                </div>
                <div class="span-12 last notopmargin">
                    <input class="button" type="submit" name="submit" value="Send message" id="submit_form" required/>
                </div>
                </form>
                </div>
                </fieldset>
            </div>
            <div class="span-8 last <?php if($data['checkbox_google_map'] == false ) { ?> notopmargin <?php } ?>">
                <h4 class=" uppercase"><?php echo stripslashes($data['veles_contact_header']); ?></h4>
                <p><?php if($data['top_text'] == true ) { ?><?php echo $data['veles_adress']; ?><br/><?php } ?>
					<?php if($data['phone'] == true ) { ?><br/><span class="strong">Phone:</span></span> <span class="colored"><?php echo $data['veles_phone']; ?></span><?php } ?>
                    <?php if($data['fax'] == true ) { ?><br/><span class="strong">Fax:</span> <span class="colored"><?php echo $data['veles_fax']; ?></span><?php } ?>
                    <?php if($data['website'] == true ) { ?><br/><span class="strong">Website:</span> <a class="link" href=""><?php echo $data['veles_website']; ?></a><?php } ?>
                    <?php if($data['email'] == true ) { ?><br/><span class="strong">Email:</span> <a class="link nobottommargin" href=""><?php echo $data['veles_email']; ?></a><?php } ?>
                </p>
                <?php if($data['bottom_text'] == true ) { ?><p class="block_all small-italic"><?php echo $data['veles_contact_text']; ?></p><?php } ?>
            	
            </div>
            <?php } ?>
        </div>
        <div class="clear"></div>
	</div>
<?php get_footer(); ?>