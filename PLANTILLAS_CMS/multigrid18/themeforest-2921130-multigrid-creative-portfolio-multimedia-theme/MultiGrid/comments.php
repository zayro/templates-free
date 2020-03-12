<?php
global $blogConf, $data;
$faceBookDefaultOption = Array(
    'use' => 'false',
    'appId' => '',
    'per_page' => '5'
);
// Do not delete these lines
if (comments_open ()) {
    ?>
    <div id="comments" class="comment-box border">
    <?php
    if (isset($data['facebook_comment']) && $data['facebook_comment']) {
    ?>
        <div id="fb-root"></div>
        <div class="fb-comments" data-href="<?php the_permalink(); ?>" data-num-posts="<?php echo isset($data['comment_perpage']) ? $data['comment_perpage'] : "4"; ?>" data-width="640"></div>
<?php } else {

        if (!empty($_SERVER['SCRIPT_FILENAME']) && 'comments.php' == basename($_SERVER['SCRIPT_FILENAME']))
            die('Please do not load this page directly. Thanks!');

        if (post_password_required ()) {
    ?>
            <p class="nocomments"><?php _e('This post is password protected. Enter the password to view comments.', 'themeton'); ?></p>
    <?php
            return;
        }
    ?>

        <!-- You can start editing here. -->

    <?php if (have_comments ()) : ?>
            <h4 class="comment-box-title"><?php printf(_n(__('One Response to', 'themeton') . ' %2$s', '%1$s ' . __('Responses to', 'themeton') . ' %2$s', get_comments_number()),
                    number_format_i18n(get_comments_number()), '&#8220;' . get_the_title() . '&#8221;'); ?>
            </h4><hr />

        <div class="comment-list">
        <?php wp_list_comments(array('style' => 'div', 'callback' => 'mytheme_comment')); ?>
        </div><!-- post-comments -->

        <div class="navigation">
            <div class="alignleft"><?php previous_comments_link() ?></div>
            <div class="alignright"><?php next_comments_link() ?></div>
        </div>
    <?php else : // this is displayed if there are no comments so far  ?>

    <?php if (comments_open ()) : ?>
                    <!-- If comments are open, but there are no comments. -->

    <?php else : // comments are closed  ?>

    <?php endif; ?>
    <?php endif; ?>


    <?php if (comments_open ()) : ?>

                            <div id="comments-form" class="comments">

                                <h4 id="reply-title"><?php comment_form_title(__('Leave a Comment', 'themeton'), __('Leave a Reply to %s', 'themeton')); ?></h4>
                                <hr />
                                <div id="cancel-comment-reply">
                                    <small><?php cancel_comment_reply_link() ?></small>
                                </div>

        <?php if (get_option('comment_registration') && !is_user_logged_in()) : ?>
                                <p><?php printf(__('You must be <a href="%s">logged in</a> to post a comment.', 'themeton'), wp_login_url(get_permalink())); ?></p>
        <?php else : ?>
                                    <form data-comment-link="<?php the_permalink(); ?>" class="form-horizontal" action="<?php echo get_option('siteurl'); ?>/wp-comments-post.php" method="post" id="commentform">
            <?php if (is_user_logged_in ()) : ?>
                                        <p><?php printf(__('Logged in as <a href="%1$s">%2$s</a>.', 'themeton'), get_option('siteurl') . '/wp-admin/profile.php', $user_identity); ?> <a href="<?php echo wp_logout_url(get_permalink()); ?>" title="<?php _e('Log out of this account', 'themeton'); ?>"><?php _e('Log out &raquo;', 'themeton'); ?></a></p>
            <?php else : ?>
                                            <div class="control-group overlabel-wrapper">
                                                <input type="text" name="author" id="author" class="span5 required" value="" tabindex="1" />
                                                <label for="author" class="overlabel"><?php _e('Name', 'themeton'); ?> (*)</label>
                                            </div>

                                            <div class="control-group overlabel-wrapper">
                                                <input type="text" name="email" id="email" class="required email span5" value="" tabindex="2"/>
                                                <label for="email" class="overlabel"><?php _e('Email', 'themeton'); ?> (*)</label>
                                            </div>

                                            <div class="control-group overlabel-wrapper">
                                                <input type="text" name="url" id="url" class="span5" value="<?php echo esc_attr($comment_author_url); ?>" tabindex="3" />
                                                <label for="url" class="overlabel"><?php _e('Website', 'themeton'); ?></label>
                                            </div>

            <?php endif; ?>

                                            <div class="control-group overlabel-wrapper">
                                                <textarea name="comment" id="comment" class="input-xlarge span8 required" rows="8" tabindex="4"></textarea>
                                                <label for="comment" class="overlabel"><?php _e('Comment', 'themeton'); ?> (*)</label>
                                            </div>

                                            <div class="control-group">
                                                <div class="row">
                                                    <div class="span8 comment-button">
                                                        <input class="btn" type="submit" name="submit" value="<?php _e('Submit Comment', 'themeton'); ?>" id="submit" tabindex="5" />
                                                        <?php comment_id_fields(); ?>
                                                    </div>
                                                </div>
                                            </div>                                
            <?php do_action('comment_form', $post->ID); ?>
                                            <input type="hidden" name="comment_post_ID" value="<?php echo $id; ?>" />
                                        </form>

        <?php endif; // If registration required and not logged in  ?>
                                        </div><!-- comment-box -->

    <?php endif; // if you delete this the sky will fall on your head  ?>
                                        
<?php } ?>
    </div>    
<?php }?>