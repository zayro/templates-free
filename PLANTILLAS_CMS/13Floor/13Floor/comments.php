<?php
// Do not delete these lines
	if (!empty($_SERVER['SCRIPT_FILENAME']) && 'comments.php' == basename($_SERVER['SCRIPT_FILENAME']))
		die (esc_html__('Please do not load this page directly. Thanks!','13floor'));

	if ( post_password_required() ) { ?>

<p class="nocomments"><?php esc_html_e('This post is password protected. Enter the password to view comments.','13floor') ?></p>
<?php
		return;
	}
?>
<!-- You can start editing here. -->

<?php if ( have_comments() ) : ?>
	<div id="comment-section" class="clearfix">
		<h3 id="comments"><?php comments_number(esc_html__('No comments','13floor'), esc_html__('One comment','13floor'), '% '.esc_html__('comments','13floor') );?></h3>
		
	<?php if ( get_comment_pages_count() > 1 && get_option( 'page_comments' ) ) : // Are there comments to navigate through? ?>
		<div class="comment_navigation_top clearfix">
			<div class="nav-previous"><?php previous_comments_link( __( '<span class="meta-nav">&larr;</span> Older Comments', '13floor' ) ); ?></div>
			<div class="nav-next"><?php next_comments_link( __( 'Newer Comments <span class="meta-nav">&rarr;</span>', '13floor' ) ); ?></div>
		</div> <!-- .navigation -->
	<?php endif; // check for comment navigation ?>
	
	<?php if ( ! empty($comments_by_type['comment']) ) : ?>
		<ol class="commentlist clearfix">
			<?php wp_list_comments( array('type'=>'comment','callback'=>'et_custom_comments_display') ); ?>
		</ol>
	<?php endif; ?>
	
	<?php if ( get_comment_pages_count() > 1 && get_option( 'page_comments' ) ) : // Are there comments to navigate through? ?>
		<div class="comment_navigation_bottom clearfix">
			<div class="nav-previous"><?php previous_comments_link( __( '<span class="meta-nav">&larr;</span> Older Comments', '13floor' ) ); ?></div>
			<div class="nav-next"><?php next_comments_link( __( 'Newer Comments <span class="meta-nav">&rarr;</span>', '13floor' ) ); ?></div>
		</div> <!-- .navigation -->
	<?php endif; // check for comment navigation ?>
		
	<?php if ( ! empty($comments_by_type['pings']) ) : ?>
		<div id="trackbacks">
			<h3 id="trackbacks-title"><?php esc_html_e('Trackbacks/Pingbacks','13floor') ?></h3>
			<ol class="pinglist">
				<?php wp_list_comments('type=pings&callback=et_list_pings'); ?>
			</ol>
		</div>
	<?php endif; ?>	
<?php else : // this is displayed if there are no comments so far ?>
	<div id="comment-section" class="nocomments">
		<?php if ('open' == $post->comment_status) : ?>
			<!-- If comments are open, but there are no comments. -->
		<?php else : // comments are closed ?>
			<!-- If comments are closed. -->
				<div id="respond">
					<p class="nocomments"><?php esc_html_e('Comments are closed.','13floor') ?></p>
				</div> <!-- end respond div -->
		<?php endif; ?>
<?php endif; ?>
<?php if ('open' == $post->comment_status) : ?>
	<?php comment_form( array('label_submit' => esc_attr__( 'Submit Comment', '13floor' ), 'title_reply' => '<span>' . esc_attr__( 'Leave a Reply', '13floor' ) . '</span>', 'title_reply_to' => esc_attr__( 'Leave a Reply to %s' )) ); ?>
<?php else: ?>

<?php endif; // if you delete this the sky will fall on your head ?>
</div> <!-- end comment-section -->