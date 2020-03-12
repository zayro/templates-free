<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
add_action('admin_menu', 'tt_custom_post_formats');

function tt_custom_post_formats() {
    add_meta_box('tt_post_format', __('Post format fields', 'themeton'), 'tt_custom_post_format_box', 'post', 'normal', 'high');
}

function tt_custom_post_format_box() {
    global $post;
    $post_id = $post->ID;
    $audio_type = get_post_meta($post_id, 'tt-audio-type', true);
    if ($audio_type != "url") {
        $audio_type = "embed";
    }
    $target = array('blank', 'self', 'parent', 'top');
?>
<div id="themeton_custom_post_format">
    <div class="themeton_format_video themeton_post_format">
        <div class="themeton_format_inside">
            <table class="form-table">
                <tr id="video-format-embed">
                    <th><label><?php _e('Add video embed', 'themeton'); ?></label></th>
                    <td>
                        <textarea name="tt_format_video" cols="60" rows="5"><?php print get_post_meta($post_id, 'tt-video-embed', true); ?></textarea>
                    </td>
                    <td>
                        <?php _e('Example: <br/>&lt;frame src="http://player.vimeo.com/video/22379296?byline=0" width="500" height="281" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen&gt;&lt;/iframe&gt;', 'themeton'); ?>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="themeton_format_audio themeton_post_format">
        <div class="themeton_format_inside">
             <table class="form-table">
                 <tr>
        <th>
            <label for="audio-is-embed"><?php _e('Is Audio Embedded?', 'themeton'); ?></label>
        </th>
        <td>
            <input id="audio-is-embed" name="audio-is-embed" class="theme_check_optional check-show-hide" data-show="#audio-format-embed" data-hide="#audio-format-url" type="checkbox"  <?php checked($audio_type, "embed"); ?> value="use_embed">
        </td>
                </tr>
        <div style="clear:both;"></div>
        
           
                <tr id="audio-format-url">
                    <th><label><?php _e('Post format audio url here', 'themeton'); ?></label></th>
                    <td style="width:250px;">
                        <input name="tt_format_audio_url" id="tt_format_audio_url" value="<?php print get_post_meta($post_id, 'tt-audio-url', true); ?>" type="text" size="30">
                        
                        <input type="button" class="button" value="upload" onclick="browseMediaWindow('tt_format_audio_url');">
                    </td>
                    <td>
                        <?php _e('Please upload only MP3 file, copy and paste audio url on the field. Insert into button doen\'t work, because uploader can work with only images.', 'themeton'); ?>
                    </td>
                </tr>
                <tr id="audio-format-embed">
                    <th><label><?php _e('Add audio embed', 'themeton'); ?></label></th>
                    <td>
                        <textarea name="tt_format_audio_embed" cols="60" rows="5"><?php print get_post_meta($post_id, 'tt-audio-embed', true); ?></textarea>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="themeton_format_status themeton_post_format">
        <div class="themeton_format_inside">
            <table class="form-table">
                <tr id="status-format-embed">
                    <th><label><?php _e('Status URL', 'themeton'); ?></label></th>
                    <td>
                        <input type="text" name="tt_format_status" value="<?php print get_post_meta($post_id, 'tt-status-embed', true); ?>" size="60">
                    </td>
                    <td>
                        <?php _e('Please provide here Twitter or Instagram url. Also you can put here some oEmbed links those provided for <a href="http://codex.wordpress.org/Embeds#Okay.2C_So_What_Sites_Can_I_Embed_From.3F" target="_blank">WordPress embed</a>', 'themeton'); ?>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="themeton_format_quote themeton_post_format">
        <div class="themeton_format_inside">
            <table class="form-table">
                <tr>
                    <th><label><?php _e('Quote author', 'themeton'); ?></label></th>
                    <td>
                        <input name="tt_quote_author" value="<?php print_r(get_post_meta($post_id, 'tt_quote_author', true)); ?>" type="text" size="30">
                    </td>
                </tr>
                <tr>
                    <th><label><?php _e('Link', 'themeton'); ?></label></th>
                    <td>
                        <input name="tt_quote_link" value="<?php print_r(get_post_meta($post_id, 'tt_quote_link', true)); ?>" type="text" size="30">
                    </td>
                </tr>
                <tr>
                    <th><label><?php _e('Link target', 'themeton'); ?></label></th>
                    <td>
                        <select name="tt_quote_target" <?php print_r(get_post_meta($post_id, 'tt_quote_target', true)); ?>>
                            <?php foreach ($target as $tar) {
                            ?>
                                        <option value="<?php echo $tar; ?>" <?php if (get_post_meta($post_id, 'tt_quote_target', true) == $tar)
                                            echo "selected=selected"; ?>><?php echo $tar; ?></option>
                                    <?php } ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th><label><?php _e('Quote text', 'themeton'); ?></label></th>
                    <td>
                        <textarea name="tt_quote_text" style="width:100%;" rows="4" ><?php print_r(get_post_meta($post_id, 'tt_quote_text', true)); ?></textarea>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="themeton_format_link themeton_post_format">
        <div class="themeton_format_inside">
            <table class="form-table">
                <tr>
                    <th><label><?php _e('Link name', 'themeton'); ?></label></th>
                    <td>
                        <input name="tt_format_link_title" value="<?php print_r(get_post_meta($post_id, 'link-title', true)); ?>" type="text" size="30">
                    </td>
                </tr>
                <tr>
                    <th><label><?php _e('Link URL', 'themeton'); ?></label></th>
                    <td>
                        <input name="tt_format_link" value="<?php print_r(get_post_meta($post_id, 'link-url', true)); ?>" type="text" size="30">
                    </td>
                </tr>
                <tr>
                    <th><label><?php _e('Link target', 'themeton'); ?></label></th>
                    <td>
                        <select name="tt_format_link_target" <?php print_r(get_post_meta($post_id, 'link-target', true)); ?>>
                            <?php foreach ($target as $tar) {
                            ?>
                                <option value="<?php echo $tar; ?>" <?php if (get_post_meta($post_id, 'link-target', true) == $tar)
                                    echo "selected=selected"; ?>><?php echo $tar; ?></option>
                                    <?php } ?>
                        </select>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
    <?php wp_nonce_field(plugin_basename(__FILE__), 'tt_post_format_noncename'); ?>
    <script type="text/javascript">
        jQuery(document).ready(function(){
            showHidePostFormatField();
            jQuery('#post-formats-select input:radio').click(showHidePostFormatField);
        });
        function showHidePostFormatField(){
            selectedFrmt=(''+jQuery('#post-formats-select input:radio:checked').val());
            jQuery('#themeton_custom_post_format > div').each(function(){
                if(jQuery(this).hasClass('themeton_format_'+jQuery('#post-formats-select input:radio:checked').val())){
                    jQuery(this).show('slow');
                }else{
                    jQuery(this).hide('slow');
                }
            });
        }
    </script><?php
}

add_action('save_post', 'save_post_format_meta');

function save_post_format_meta($post_id) {
    global $post;
    if (isset($_POST['tt_post_format_noncename']) && !wp_verify_nonce($_POST['tt_post_format_noncename'], plugin_basename(__FILE__)))
        return $post_id;
    if (defined('DOING_AUTOSAVE') && DOING_AUTOSAVE)
        return $post_id;
    if (!current_user_can('edit_post', $post_id))
        return $post_id;
    if (isset($_POST['post_type']) && 'post' == $_POST['post_type']) {
        $frmt = get_post_format($post_id);
        switch ($frmt) {
            case 'audio':
                if (isset($_POST['audio-is-embed']) && isset($_POST['tt_format_audio_embed']) && $_POST['audio-is-embed'] == 'use_embed') {
                    if (!update_post_meta($post_id, 'tt-audio-embed', stripslashes($_POST['tt_format_audio_embed'])))
                        add_post_meta($post_id, 'tt-audio-embed', stripslashes($_POST['tt_format_audio_embed']));
                    if (!update_post_meta($post_id, 'tt-audio-type', 'embed'))
                        add_post_meta($post_id, 'tt-audio-type', 'embed');
                } else {
                    if(isset($_POST['tt_format_audio_url'])){
                        if (!update_post_meta($post_id, 'tt-audio-url', stripslashes($_POST['tt_format_audio_url'])))
                            add_post_meta($post_id, 'tt-audio-url', stripslashes($_POST['tt_format_audio_url']));
                    }
                    if (!update_post_meta($post_id, 'tt-audio-type', 'url'))
                        add_post_meta($post_id, 'tt-audio-type', 'url');
                }
                break;
            case 'quote':
                if(isset($_POST['tt_quote_link'])){
                    if (get_post_meta($post_id, 'tt_quote_link') == '') {
                        add_post_meta($post_id, 'tt_quote_link', stripslashes($_POST['tt_quote_link']));
                    } else {
                        update_post_meta($post_id, 'tt_quote_link', stripslashes($_POST['tt_quote_link']));
                    }
                }
                if(isset($_POST['tt_quote_target'])){
                    if (get_post_meta($post_id, 'tt_quote_target') == '') {
                        add_post_meta($post_id, 'tt_quote_target', stripslashes($_POST['tt_quote_target']));
                    } else {
                        update_post_meta($post_id, 'tt_quote_target', stripslashes($_POST['tt_quote_target']));
                    }
                }
                if(isset($_POST['tt_quote_text'])){
                    if (get_post_meta($post_id, 'tt_quote_text') == '') {
                        add_post_meta($post_id, 'tt_quote_text', stripslashes($_POST['tt_quote_text']));
                    } else {
                        update_post_meta($post_id, 'tt_quote_text', stripslashes($_POST['tt_quote_text']));
                    }
                }
                if(isset($_POST['tt_quote_author'])){
                    if (get_post_meta($post_id, 'tt_quote_author') == '') {
                        add_post_meta($post_id, 'tt_quote_author', stripslashes($_POST['tt_quote_author']));
                    } else {
                        update_post_meta($post_id, 'tt_quote_author', stripslashes($_POST['tt_quote_author']));
                    }
                }
                break;
            case 'video':
                if(isset($_POST['tt_format_video'])){
                    if (get_post_meta($post_id, 'tt-video-embed') == '') {
                        add_post_meta($post_id, 'tt-video-embed', stripslashes($_POST['tt_format_video']));
                    } else {
                        update_post_meta($post_id, 'tt-video-embed', stripslashes($_POST['tt_format_video']));
                    }
                }
                break;
            case 'status':
                if(isset($_POST['tt_format_status'])){
                    if (get_post_meta($post_id, 'tt-status-embed') == '') {
                        add_post_meta($post_id, 'tt-status-embed', stripslashes($_POST['tt_format_status']));
                    } else {
                        update_post_meta($post_id, 'tt-status-embed', stripslashes($_POST['tt_format_status']));
                    }
                }
                break;
            case 'link':
                if(isset($_POST['tt_format_link'])){
                    if (get_post_meta($post_id, 'link-url') == '') {
                        add_post_meta($post_id, 'link-url', stripslashes($_POST['tt_format_link']));
                    } else {
                        update_post_meta($post_id, 'link-url', stripslashes($_POST['tt_format_link']));
                    }
                }
                if(isset($_POST['tt_format_link_title'])){
                    if (get_post_meta($post_id, 'link-title') == '') {
                        add_post_meta($post_id, 'link-title', stripslashes($_POST['tt_format_link_title']));
                    } else {
                        update_post_meta($post_id, 'link-title', stripslashes($_POST['tt_format_link_title']));
                    }
                }
                if(isset($_POST['tt_format_link_target'])){
                    if (get_post_meta($post_id, 'link-target') == '') {
                        add_post_meta($post_id, 'link-target', stripslashes($_POST['tt_format_link_target']));
                    } else {
                        update_post_meta($post_id, 'link-target', stripslashes($_POST['tt_format_link_target']));
                    }
                }
                break;
        }
    }
}