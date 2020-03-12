<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
     <title><?php echo get_option('blogname'); ?> - Comments on <?php the_title(); ?></title>

	<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php echo get_option('blog_charset'); ?>" />
	<style type="text/css" media="screen">
		@import url( <?php bloginfo('stylesheet_url'); ?> );
	</style>

</head>
<body id="commentspopup">
    
    <div class="page-padding">
        <div class="page-width">
			<div class="content">
				<div class="post">
					<?php
					/* Don't remove these lines. */
					add_filter('comment_text', 'popuplinks');
					if ( have_posts() ) :
					while ( have_posts() ) : the_post();
					?>
					<h2 id="comments">Comments</h2>
					
					<p><a href="<?php echo get_post_comments_feed_link($post->ID); ?>"><abbr title="Really Simple Syndication">RSS</abbr> feed for comments on this post.</a></p>
					
					<?php if ('open' == $post->ping_status) { ?>
					<p>The <abbr title="Universal Resource Locator">URL</abbr> to TrackBack this entry is: <em><?php trackback_url() ?></em></p>
					<?php } ?>
					
					<?php
					// this line is WordPress' motor, do not delete it.
					$commenter = wp_get_current_commenter();
					extract($commenter);
					$comments = get_approved_comments($id);
					$post = get_post($id);
					if ( post_password_required($post) ) {  // and it doesn't match the cookie
						echo(get_the_password_form());
					} else { ?>
					
					<?php if ($comments) { ?>
					<ol id="commentlist">
					<?php foreach ($comments as $comment) { ?>
						<li id="comment-<?php comment_ID() ?>">
						<?php comment_text() ?>
						<p><cite><?php comment_type('Comment', 'Trackback', 'Pingback'); ?> by <?php comment_author_link() ?> &#8212; <?php comment_date() ?> @ <a href="#comment-<?php comment_ID() ?>"><?php comment_time() ?></a></cite></p>
						</li>
					
					<?php } // end for each comment ?>
					</ol>
					<?php } else { // this is displayed if there are no comments so far ?>
						<p>No comments yet.</p>
					<?php } ?>
					
					<?php if ('open' == $post->comment_status) { ?>
					<h2>Leave a comment</h2>
					<p>Line and paragraph breaks automatic, e-mail address never displayed, <acronym title="Hypertext Markup Language">HTML</acronym> allowed: <code><?php echo allowed_tags(); ?></code></p>
					
					<form action="<?php echo get_option('siteurl'); ?>/wp-comments-post.php" method="post" id="commentform">
					<?php if ( $user_ID ) : ?>
						<p>Logged in as <a href="<?php echo get_option('siteurl'); ?>/wp-admin/profile.php"><?php echo $user_identity; ?></a>. <a href="<?php echo wp_logout_url(get_permalink()); ?>" title="Log out of this account">Log out &raquo;</a></p>
					<?php else : ?>
						<p>
						  <input type="text" name="author" id="author" class="textarea" value="<?php echo $comment_author; ?>" size="28" tabindex="1" />
						   <label for="author">Name</label>
						</p>
					
						<p>
						  <input type="text" name="email" id="email" value="<?php echo $comment_author_email; ?>" size="28" tabindex="2" />
						   <label for="email">E-mail</label>
						</p>
					
						<p>
						  <input type="text" name="url" id="url" value="<?php echo $comment_author_url; ?>" size="28" tabindex="3" />
						   <label for="url"><abbr title="Universal Resource Locator">URL</abbr></label>
						</p>
					<?php endif; ?>
					
						<p>
						  <label for="comment">Your Comment</label>
						<br />
						  <textarea name="comment" id="comment" cols="70" rows="4" tabindex="4"></textarea>
						</p>
					
						<p>
						  <input type="hidden" name="comment_post_ID" value="<?php echo $id; ?>" />
						  <input type="hidden" name="redirect_to" value="<?php echo attribute_escape($_SERVER["REQUEST_URI"]); ?>" />
						  <input name="submit" type="image" src="<?php bloginfo('stylesheet_directory'); ?>/images/submit2.gif" id="submit" tabindex="5" value="Submit" />
							
						<?php do_action('comment_form', $post->ID); ?>
					</form>
					<?php } else { // comments are closed ?>
					<p>Sorry, the comment form is closed at this time.</p>
					<?php }
					} // end password check
				?>
				</div>
			</div>	
        <div id="footer">
    	<p><a href="javascript:window.close()">Close this window.</a><br />
        <?php timer_stop(1); ?> &nbsp; Powered by <a href="http://wordpress.org/" title="Powered by WordPress, state-of-the-art semantic personal publishing platform">WordPress</a></p>

    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    

<?php // if you delete this the sky will fall on your head
endwhile; //endwhile have_posts()
else: //have_posts()
?>
<p>Sorry, no posts matched your criteria.</p>
<?php endif; ?>
<!-- // this is just the end of the motor - don't touch that line either :) -->
<?php //} ?>
<?php // Seen at http://www.mijnkopthee.nl/log2/archive/2003/05/28/esc(18) ?>
<script type="text/javascript">
<!--
document.onkeypress = function esc(e) {
	if(typeof(e) == "undefined") { e=event; }
	if (e.keyCode == 27) { self.close(); }
}
// -->
</script>
</body>
</html>
