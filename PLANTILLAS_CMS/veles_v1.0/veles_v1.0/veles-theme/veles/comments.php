<?php

// Do not delete these lines
	if (!empty($_SERVER['SCRIPT_FILENAME']) && 'comments.php' == basename($_SERVER['SCRIPT_FILENAME']))
		die ('Please do not load this page directly. Thanks!');

	if ( post_password_required() ) { ?>
		<h4 class="collored">This post is password protected. Enter the password to view comments.</h4>
	<?php
		return;
	}
?>

<!-- You can start editing here. -->
<div class="three-fourth last">
<h4 class="notopmargin uppercase"><?php comments_number('<span  class="colored">NO</span> comments yet','<span  class="colored">1</span> Comment:','<span  class="colored">%</span> Comments:')?></h4>
<?php if ( have_comments() ) : ?>
	
        <ul>
        	<?php wp_list_comments('max_depth=3&callback=mytheme_comment'); ?>     
       </ul>
	
 <?php else : // this is displayed if there are no comments so far ?>
	<?php if ( comments_open() ) : ?>
		<!-- If comments are open, but there are no comments. -->
	 <?php else : // comments are closed ?>
		<!-- If comments are closed. -->
		<h4 class="collored">Comments are closed.</h4>
	<?php endif; ?>
<?php endif; ?>
</div>
<div class="clear"></div>
<?php if ( comments_open() ) : ?>
</div>
<div class="">
<div class="span-16 post_form">
<div id="respond">
<h4 class="colored uppercase"><?php comment_form_title( 'Leave a Reply:', 'Leave a Reply to %s:' ); ?></h4>
<div class="dot-separator margin15"></div>
<!--- replace comment_form();  -->
<?php paginate_comments_links('prev_text=back&next_text=forward'); ?>
<div class="cancel-comment-reply">
	<small><?php cancel_comment_reply_link(); ?></small>
</div>

<?php if ( get_option('comment_registration') && !is_user_logged_in() ) : ?>
<p class="blockquote4">You must be <a href="<?php echo wp_login_url( get_permalink() ); ?>">logged in</a> to post a comment.</p>
<?php else : ?>
<form action="<?php echo get_option('siteurl'); ?>/wp-comments-post.php" method="post" id="contact-form">


<?php if ( is_user_logged_in() ) : ?>
<p class="blockquote4" style="font-size:12px; font-style:normal;"><span  class="strong">Logged in as <span  class="colored"><?php echo $user_identity; ?></span>.</span> <a class="button_readmore" style="font-size:10px; padding-top:1px;" href="<?php echo wp_logout_url(get_permalink()); ?>" title="Log out of this account">LOG OUT</a></p>
<?php else : ?>
	<div class="span-8 form notopmargin">
		<input type="text" name="author" value="<?php echo esc_attr($comment_author); ?>" class="text" />
    </div>
    
    <div class="span-8 form notopmargin last">
	<input type="text" name="email"  value="<?php echo esc_attr($comment_author_email); ?>" class="text"/>
    </div>
<?php endif; ?>

	<div class="span-16  last">
		<textarea id="comment" name="comment" cols="" rows="10" class="text" placeholder="Message"></textarea>
		<div class="span-12 last" style="margin-top:10px;">
        <input name="submit" type="submit" id="submit" class="button"  value="Post Comment" />
        </div>
	</div>
		
	
<p><?php comment_id_fields(); ?></p>
<?php do_action('comment_form', $post->ID); ?>
</form>

<?php endif; // If registration required and not logged in ?>

</div>
</div>
<?php endif; // if you delete this the sky will fall on your head ?>