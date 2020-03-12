<?php
/* ----------------------------------------------------------------------------------- */
// All functions and configuration of the theme
/* ----------------------------------------------------------------------------------- */

define('FRAMEWORKPATH', get_template_directory() . '/framework');
define('FRAMEWORKURL', get_template_directory_uri() . '/framework');
define('TT_SHORTNAME', 'multigrid');
define('THEMENAME', 'MultiGrid');

/* ------------------------------------------ */
/* Options Panel
/*------------------------------------------ */

require_once (TEMPLATEPATH . '/admin/index.php');

$s_layout = Array(
    array('title' => 'Full', 'value' => '0-1-1', 'image' => FRAMEWORKURL . '/images/layouts/s0.png'),
    array('title' => 'Right sidebar', 'value' => '1-1-1', 'image' => FRAMEWORKURL . '/images/layouts/s12.png'),
);
$social_url = get_template_directory_uri() . '/framework/images/social-option/';
$social_position = Array(
    $social_url . '01.png' => 'bottom',
    $social_url . '02.png' => 'top',
    $social_url . '03.png' => 'left',
    $social_url . '04.png' => 'right',
);
$images_url = get_template_directory_uri() . '/images/skin/';
$post_style = Array(
    $images_url . '01.png' => 'post-default',
    $images_url . '02.png' => 'post-minimal',
    $images_url . '03.png' => 'post-classic-light',
    $images_url . '04.png' => 'post-classic-dark',
);

$size_url = get_template_directory_uri() . '/framework/images/post-size/';
$item_size = Array(
    $size_url . '01.png' => 's',
    $size_url . '02.png' => 'm',
    $size_url . '03.png' => 'l',
    $size_url . '04.png' => 'xl',
);
global $data;
$sides = $data['custom_sidebar']; //get the slides array
$sidebar = array('Default sidebar');
if (isset($sides) && is_array($sides)) {
    foreach ($sides as $side) {
        if ($side['title'] != "")
            $sidebar = array_merge($sidebar, (array) $side['title']);
    }
}


require_once FRAMEWORKPATH . '/framework.php';
require_once FRAMEWORKPATH . '/' . TT_SHORTNAME . '.php';

require_once( ADMIN_PATH . 'functions/seo.php' );

//if(isset($comp['enable_composer']) && $comp['enable_composer'] == true) {
require_once (get_template_directory(). '/admin/composer/js_composer.php'); // Add Component option
//}

if (!function_exists('get_post_image')) :

    function get_post_image() {
        global $post;
        $first_img = '';
        $slide_imgs = get_post_meta($post->ID, 'tt_slide_images', true);
        if ($slide_imgs != '' && count($slide_imgs) > 0) {
            return $slide_imgs[0]['image'];
        }
        if (has_post_thumbnail($post->ID)) {
            $post_image_tumb = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), 'large');
            return $post_image_tumb[0];
        }
        return $first_img;
    }

endif;

if (!function_exists('get_post_first_image')) :

    function get_post_first_image() {
        global $post;
        $first_img = '';
        if ($post->post_content) {
            $output = preg_match_all('/<img.+src=[\'"]([^\'"]+)[\'"].*>/i', $post->post_content, $matches);
            $first_img = isset($matches[1][0]) ? $matches[1][0] : '';
        }
        return $first_img;
    }

endif;

if (!function_exists('get_post_content_image')) :

    function get_post_content_image() {
        global $post;
        $output = preg_match_all('/<img.+src=[\'"]([^\'"]+)[\'"].*>/i', $post->post_content, $matches);
        $first_img = isset($matches[1][0]) ? $matches[1][0] : '';
        return $first_img;
    }

endif;

register_nav_menus(array(
    'primary-menu' => __('Primary Navigation', 'themeton'),
));
add_action('widgets_init', 'widgets_init');
add_theme_support('post-thumbnails');
add_theme_support('post-formats', array('video', 'audio', 'quote', 'status', 'link'));
add_image_size('theme-thumb', 520, 497, true);
add_filter('widget_text', 'do_shortcode');
add_filter('wp_get_attachment_link', 'gallery_prettyPhoto');

if (!function_exists('gallery_prettyPhoto')) :

    function gallery_prettyPhoto($content) {
        // add checks if you want to add prettyPhoto on certain places (archives etc).
        return str_replace("<a", "<a title='' alt='' rel='prettyPhoto[x]'", $content);
    }

endif;


add_action('after_setup_theme', 'themeton_setup');
if (!function_exists('themeton_setup')) {

    function themeton_setup() {
        add_editor_style();
        add_theme_support('post-thumbnails');
        add_theme_support('automatic-feed-links');
        load_theme_textdomain('themeton', get_template_directory() . '/languages');
    }

}

if (!function_exists('widgets_init')) :

    function widgets_init() {
        global $footerGrid, $data;
        // Default sidebar.
        register_sidebar(array(
            'name' => __('Default sidebar', 'themeton'),
            'id' => 'default-sidebar',
            'description' => __('The default sidebar widget area', 'themeton'),
            'before_widget' => '<aside id="%1$s" class="widget %2$s">',
            'after_widget' => '</aside>',
            'before_title' => '<h3 class="widget-title">',
            'after_title' => '</h3>',
        ));

        // Left sidebar.
        register_sidebar(array(
            'name' => __('Header sidebar', 'themeton'),
            'id' => 'header-sidebar',
            'description' => __('The header sidebar widget area', 'themeton'),
            'before_widget' => '<div id="%1$s" class="header-sidebar widget %2$s">',
            'after_widget' => '</div>',
            'before_title' => '<h3>',
            'after_title' => '</h3>',
        ));

        // Custom Sidebar
        $name = 'custom_sidebar';
        if (isset($data[$name]) && is_array($data[$name])) {
            foreach ($data[$name] as $row) {
                if ($row != "" && $row['title'] != "") {
                    register_sidebar(array(
                        'name' => $row['title'],
                        'id' => $row['title'],
                        'description' => __('The page widget area', 'energy'),
                        'before_widget' => '<aside id="%1$s" class="dynamic_sidebar widget %2$s">',
                        'after_widget' => '</aside>',
                        'before_title' => '<h3 class="widget-title">',
                        'after_title' => '</h3><div class="widget-content">',
                    ));
                }
            }
        }
    }

endif;

if (!function_exists('mytheme_comment')) :

    function mytheme_comment($comment, $args, $depth) {
        $GLOBALS['comment'] = $comment;
        print '<div class="comment-block">';
        ?>	
        <div class="comment">
            <div class="comment-author">
        <?php print get_avatar($comment, $size = '28', $default = '<path_to_url>', $class = ''); ?>
                <span class="comment-author-link"><span class="author-link-span">
        <?php print get_comment_author_link(); ?></span>
                </span>
                <div class="comment-meta">
                    <span class="comment-date"><?php printf(__('%1$s', 'themeton'), get_comment_date()) ?></span>
                    <span class="comment-replay-link"><?php comment_reply_link(array_merge($args, array('depth' => $depth, 'max_depth' => $args['max_depth']))) ?></span>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="comment-body">
        <?php comment_text() ?>
            </div>
        </div><?php
    }

endif;

if (!function_exists('get_sticky_posts_count')) :

    function get_sticky_posts_count() {
        global $wpdb;
        $sticky_posts = array_map('absint', (array) get_option('sticky_posts'));
        return count($sticky_posts) > 0 ? $wpdb->get_var($wpdb->prepare("SELECT COUNT( 1 ) FROM $wpdb->posts WHERE post_type = 'post' AND post_status = 'publish' AND ID IN (" . implode(',', $sticky_posts) . ")")) : 0;
    }

endif;

if (function_exists('add_theme_support')) {
    add_theme_support('post-thumbnails');
    set_post_thumbnail_size(150, 250); // default Post Thumbnail dimensions
}

if (function_exists('add_image_size')) {
    add_image_size('post-thumb', 310, 9999); //300 pixels wide (and unlimited height)
    add_image_size('widget-thumb', 220, 180, true); //(cropped)
}

if (!function_exists('give_linked_images_class')) :

    /**     * Attach a class to linked images' parent anchors * e.g. a img => a.img img */
    function give_linked_images_class($html, $id, $caption, $title, $align, $url, $size, $alt = '') {
        $classes = 'preload'; // separated by spaces, e.g. 'img image-link'
        //// check if there are already classes assigned to the anchor
        if (preg_match('/<a.*? class=".*?">/', $html)) {
            $html = preg_replace('/(<a.*? class=".*?)(".*?>)/', 'rel="prettyphoto" title="" $1 ' . $classes . '$2', $html);
        } else {
            $html = preg_replace('/(<a.*?)>/', '$1 class="preload" rel="prettyphoto" title="" >', $html);
        }
        return $html;
    }

    add_filter('image_send_to_editor', 'give_linked_images_class', 10, 8);
endif;

/*
 *  -------------- Added oembed instagram status ------------------------------------- */

if (!function_exists('wp_oembed_instagram')) :

    function wp_oembed_instagram($matches, $attr, $url, $rawattr) {
        global $post;
        $img_before = $img_after = "";
        if (is_single())
            $size = ( isset($attr['size']) ) ? $attr['size'] : 'l';
        else
            $size = ( isset($attr['size']) ) ? $attr['size'] : 'm';
        if (!is_single() && !is_page()) {
            $img_before = '<a title="' . get_the_title() . '" href="' . get_permalink() . '" class="preload iconInstagram item-preview item-click-modal">';
            $img_after = '</a>';
        }
        return apply_filters('embed_instagram', '<div class="instagram-photo clearfix"><div class="hover-content">' . $img_before . '<img src="http://instagr.am/p/' . $matches[2] . '/media?size=' . $size . '" alt="Instagram" id="instagram-' . $matches[2] . '" class="instagram-size-' . $size . '">' . $img_after . '<a class="instagram-link" href="' . $url . '"><img src="' . get_template_directory_uri() . '/images/instagram-icon.png"></a></div></div>', $matches, $attr, $url, $rawattr);
    }

    wp_embed_register_handler('instagram', '#http://(instagr\.am|instagram.com)/p/(.*)/#i', 'wp_oembed_instagram');
endif;

if (!function_exists('import_scripts')) :

    function import_scripts() {
        global $data;
        wp_register_script('bootstrap', get_template_directory_uri() . '/js/bootstrap.min.js');
        wp_register_script('validate', get_template_directory_uri() . '/js/jquery.validate.min.js');
        wp_register_script('easing', get_template_directory_uri() . '/js/jquery.easing.1.3.js');
        wp_register_script('social', get_template_directory_uri() . '/js/buttons.js');
        wp_register_script('jplayer', get_template_directory_uri() . '/js/jquery.jplayer.min.js');
        wp_register_script('preloader', get_template_directory_uri() . '/js/jquery.preloader.js');
        wp_register_script('nicescroll', get_template_directory_uri() . '/js/jquery.nicescroll.min.js');
        wp_register_script('flexslider', get_template_directory_uri() . '/js/jquery.flexslider-min.js');
        wp_register_script('plusIsotope', get_template_directory_uri() . '/js/jquery.isotope.min.js');
        wp_register_script('infinitescroll', get_template_directory_uri() . '/js/jquery.infinitescroll.min.js');
        wp_register_script('touchswipe', get_template_directory_uri() . '/js/jquery.touchSwipe-1.2.5.js');
        wp_register_script('fbc', 'http://connect.facebook.net/en_US/all.js#xfbml=1&appId=' . (isset($data['facebook_app_id']) ? $data['facebook_app_id'] : ""));
        wp_register_script('theme', get_template_directory_uri() . '/js/scripts.js');

        wp_enqueue_script('jquery');
        wp_enqueue_script('bootstrap');
        wp_enqueue_script('easing');
        wp_enqueue_script('validate');
        wp_enqueue_script('jplayer');
        wp_enqueue_script('preloader');
        wp_enqueue_script('nicescroll');
        wp_enqueue_script('flexslider');
        wp_enqueue_script('plusIsotope');
        wp_enqueue_script('infinitescroll');
        wp_enqueue_script('touchswipe');
        if (isset($data['facebook_comment']) && $data['facebook_comment'])
            wp_enqueue_script('fbc');
        if (isset($data['social_media']) && $data['social_media'])
            wp_enqueue_script('social');
        wp_enqueue_script('theme');
    }

endif;

if (!function_exists('get_format_audio_feature')) :

    function get_format_audio_feature($current_post_id) {
        global $post;
        if (get_post_meta($current_post_id, 'tt-audio-type', true) != 'url') {
            echo get_post_meta($current_post_id, 'tt-audio-embed', true);
        } else {
            ?>
            <div id="jquery_jplayer_<?php echo $current_post_id; ?>" pid="<?php echo $current_post_id; ?>" class="jp-jplayer jp-jplayer-audio" src="<?php echo get_post_meta($current_post_id, 'tt-audio-url', true); ?>" style="width: 0px; height: 0px; "></div>
            <div class="jp-audio-container">
                <div class="jp-audio">
                    <div class="jp-type-single">
                        <div id="jp_interface_<?php echo $current_post_id; ?>" class="jp-interface">
                            <ul class="jp-controls">
                                <li><div class="seperator-first"></div></li>
                                <li><div class="seperator-second"></div></li>
                                <li><a href="#" class="jp-play" tabindex="1" style="display: block; ">play</a></li>
                                <li><a href="#" class="jp-pause" tabindex="1" style="display: none; ">pause</a></li>
                                <li><a href="#" class="jp-mute" tabindex="1">mute</a></li>
                                <li><a href="#" class="jp-unmute" tabindex="1" style="display: none; ">unmute</a></li>
                            </ul>
                            <div class="jp-progress-container">
                                <div class="jp-progress">
                                    <div class="jp-seek-bar" style="width: 100%; ">
                                        <div class="jp-play-bar" style="width: 1.18944845234691%; "></div>
                                    </div>
                                </div>
                            </div>
                            <div class="jp-volume-bar-container">
                                <div class="jp-volume-bar">
                                    <div class="jp-volume-bar-value" style="width: 80%; "></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
                    <?php
                }
            }

        endif;

        if (!function_exists('tt_get_filter_list')) :

//tt_get_post_format_filter() ->
            function tt_get_filter_list($isBlog = false) {
                global $data, $post;
                ?>
        <!-- Start Filter --><?php
        if ($isBlog) {
            $filter = get_post_meta($post->ID, 'themeton_additional_options', true);
            if (isset($filter['show_filter'])) {
                        ?>
                <div id="options" class="category-list clearfix">
                    <h3><?php _e('Post Filter', 'themeton') ?></h3> <?php
                $args = array(
                    'type' => 'post',
                    'orderby' => 'name',
                    'order' => 'ASC',
                    'hide_empty' => 1,
                );
                $categories = get_categories($args);
                ?>
                    <ul id="filters" class="option-set clearfix post-category" data-option-key="filter">
                        <li><a href="#filter" data-option-value="*" class="selected"><?php _e('Show all', 'themeton') ?></a></li><?php
                foreach ($categories as $category) {
                    echo'<li class="hide"><a href="#filter" data-option-value=".category-' . $category->slug . '" title="' . $category->name . '" ' . ' class="post-category-item">' . $category->name . '</a></li>';
                }
                        ?>
                    </ul>
                </div><?php
            }
        }
                ?>
        <!-- End Filter --><?php
    }

endif;

if (!function_exists('tt_get_tfilter_list')) :

    function tt_get_tfilter_list($isBlog = false) {
        global $data, $post;
                ?>
        <!-- Start Filter --><?php
        if ($isBlog) {
            $filter = get_post_meta($post->ID, 'themeton_additional_options', true);
            if (isset($filter['show_filter_tag'])) {
                        ?>
                <div id="toptions" class="tag-list clearfix">
                    <h3><?php _e('Post Filter', 'themeton') ?></h3> 
                <?php $categories = get_tags(); ?>
                    <ul id="tfilters" class="option-set clearfix post-tag" data-option-key="tfilter">
                        <li><a href="#tfilter" data-option-value="*" class="selected"><?php _e('Show all', 'themeton') ?></a></li><?php
                foreach ($categories as $category) {
                    echo'<li class="hide"><a href="#tfilter" data-option-value=".tag-' . $category->slug . '" title="' . $category->name . '" ' . ' class="post-tag-item">' . $category->name . '</a></li>';
                }
                ?>
                    </ul>
                </div><?php
            }
        }
        ?>
        <!-- End Filter --><?php
    }

endif;

if (!function_exists('tt_get_post_category_list')) :

    function tt_get_post_category_list() {
        if (get_the_category_list()) {
            echo '<span class="item-category">';
            echo '<span>';
            printf(get_the_category_list('</span><span>'));
            echo '</span> ';
            echo '</span> ';
        }
    }

endif;

// Themeton Mega Menu
require_once FRAMEWORKPATH . '/admin/lib/themeton_mega_menu.php';

if (!function_exists('get_attachment_id_from_src')) :

    function get_attachment_id_from_src($image_src) {
        global $wpdb;
        $query = "SELECT ID FROM {$wpdb->posts} WHERE guid='$image_src'";
        $id = $wpdb->get_var($query);
        return $id;
    }

endif;

if (!function_exists('get_youtube_vimeo_thumb_url')) :

    function get_youtube_vimeo_thumb_url($embed) {
        $search = 'src="http://www.youtube.com/embed/';
        $posStart = strpos($embed, $search);
        $thumb_url = false;
        if ($posStart !== false) {
            $posStart+=strlen($search);
            $posEnd = (strpos($embed, '?', $posStart) > -1) ? strpos($embed, '?', $posStart) : strpos($embed, '"', $posStart);
            if ($posEnd !== false) {
                $thumb_url = substr($embed, $posStart, $posEnd - $posStart);
                $thumb_url = 'http://img.youtube.com/vi/' . $thumb_url . '/0.jpg';
            }
        }

        if ($thumb_url === false) {
            $search = 'src="http://player.vimeo.com/video/';
            $posStart = strpos($embed, $search);
            if ($posStart !== false) {
                $posStart+=strlen($search);
                $posEnd = strpos($embed, '?', $posStart);
                if ($posEnd !== false) {
                    $thumb_url = substr($embed, $posStart, $posEnd - $posStart);
                    $thumb_url = unserialize(file_get_contents("http://vimeo.com/api/v2/video/" . $thumb_url . ".php"));
                    $thumb_url = $thumb_url[0]['thumbnail_large'];
                }
            }
        }
        return $thumb_url;
    }

endif;

if (!function_exists('blog_open_graph_meta')) :

    function blog_open_graph_meta() {
        global $data, $post, $paged, $page;
        $ogImg = false;
//    if(is_page_template('page.php') || is_single()) {
        if (is_page() || is_single()) {
            $ogImg = get_post_image();
            if (!$ogImg) {
                $ogImg = get_post_first_image();
            }
            if (!$ogImg) {
                $ogImg = get_youtube_vimeo_thumb_url(get_post_meta($post->ID, 'tt-video-embed', true));
            }
        }
        ?>
        <!-- START - Open Graph Meta -->
        <meta property='og:title' 	    content='<?php
        wp_title('|', true, 'right');
        bloginfo('name');
        $site_description = get_bloginfo('description', 'display');
        if ($site_description && ( is_home() || is_front_page() ))
            echo " | $site_description";
        if ($paged >= 2 || $page >= 2)
            echo ' | ' . sprintf(__('Page %s', 'themeton'), max($paged, $page));
        ?>'/>
        <meta property='og:image' 	content='<?php echo $ogImg ? $ogImg : ''; ?>'/>
        <meta property='og:site_name'   content='<?php bloginfo('name'); ?>'/>
        <meta property='og:description' content='<?php echo get_bloginfo('description'); ?>'/>
        <!-- END   - Open Graph Meta --><?php
    }

endif;



// Fixing duplicating issue when has Ramdom post order
global $data;
if (!is_admin() && isset($data['order_type']) && $data['order_type'] == 'Random') {

    session_start();
    add_filter('posts_orderby', 'edit_posts_orderby');
    if (!function_exists('edit_posts_orderby')) :

        function edit_posts_orderby($orderby_statement) {
            if (isset($_SESSION['expiretime'])) {
                if ($_SESSION['expiretime'] < time())
                    session_unset();
            } else
                $_SESSION['expiretime'] = time() + 300;

            $seed = $_SESSION['seed'];
            if (empty($seed)) {
                $seed = rand();
                $_SESSION['seed'] = $seed;
            }
            $orderby_statement = 'RAND(' . $seed . ')';

            return $orderby_statement;
        }

endif;
}

if (!function_exists('remove_category_list_rel')) :

// Remove rel attribute from the category list
    function remove_category_list_rel($output) {
        $output = str_replace(' rel="category tag"', '', $output);
        $output = str_replace(' rel="category"', '', $output);
        $output = str_replace(' rel="tag"', '', $output);
        return $output;
    }

    add_filter('wp_list_categories', 'remove_category_list_rel');
    add_filter('the_category', 'remove_category_list_rel');
endif;

if (!function_exists('tt_theme_feature_pointer_header')) :
// Feature Pointers
    add_action('admin_enqueue_scripts', 'tt_theme_feature_pointer_header');

    function tt_theme_feature_pointer_header() {
        global $pagenow;
        $enqueue = false;

        $dismissedStr = (string) get_user_meta(get_current_user_id(), 'dismissed_wp_pointers', true);
        $dismissed = explode(',', $dismissedStr);

        // with activate istall option
        if (is_admin() && isset($_GET['activated']) && $pagenow == 'themes.php') {
            $removed = str_replace(",tt_feature_pointer", "", $dismissedStr);
            $dismissed = explode(',', $removed);
            update_user_meta(get_current_user_id(), 'dismissed_wp_pointers', $removed);
        }

        if (!in_array('tt_feature_pointer', $dismissed)) {
            $enqueue = true;
            add_action('admin_print_footer_scripts', 'tt_feature_pointer');
        }

        if ($enqueue) {
            // Enqueue pointers
            wp_enqueue_script('wp-pointer');
            wp_enqueue_style('wp-pointer');
        }
    }

endif;

if (!function_exists('tt_feature_pointer')) :

    function tt_feature_pointer() {
        $back_end_pointer_message = array(
            'tt_option_group' => array(
                'selector' => '#toplevel_page_theme-options',
                'content' => '<h3>Options Panel</h3><p>Check out our admin panel where you have access to over 70+ options.  We have split these options up into 3 different sections to help you customize your site.</p><a class="button-primary" href="admin.php?page=theme-options">next</a>'),
            'theme-options' => array(
                'selector' => '#toplevel_page_theme-options li.tt-theme-options',
                'content' => '<h3>Themes Options</h3><p>It has options relevant to the entire site such as logo, favicon, skin and more, without having to change any code.</p><a class="button-primary" href="admin.php?page=seo-options">next</a>'),
            'seo-options' => array(
                'selector' => '#toplevel_page_theme-options li.tt-theme-seo',
                'content' => '<h3>SEO options</h3><p>If you fully configure Theme SEO option then your sites getting high traffic. The panel gives you control over title tags, noindex, meta tags, slugs, image and much more.</p><a class="button-primary" href="admin.php?page=comp-options">next</a>'),
            'comp-options' => array(
                'selector' => '#toplevel_page_theme-options li.tt-theme-elements',
                'content' => '<h3>Theme Elements</h3><p>Select for which content types Theme Element (visual shortcode) should be available during post creation/editing. Also you can disable Theme Elements.</p><a class="button-primary" href="post-new.php?post_type=page">next</a>'),
            'tt_pointer' => array(
                'selector' => '.wpb_switch-to-composer',
                'content' => '<h3>Theme Elements</h3><p>It will save you tons of time working on the site content. Now you’ll be able to create complex layouts within minutes!</p>'),
        );
        ?>
        <script type="text/javascript">
            jQuery(document).ready(function($) { <?php
        $tt_pointer_page = 'tt_option_group';
        if (isset($_REQUEST['post_type'])) {
            $tt_pointer_page = 'tt_pointer';
        } elseif (isset($_REQUEST['page'])) {
            $tt_pointer_page = $_REQUEST['page'];
        }

        if (isset($_REQUEST['taxonomy']) && $_REQUEST['taxonomy'] == 'slidercatalog' && isset($_REQUEST['post_type']) && $_REQUEST['post_type'] == 'slider') {
            $tt_pointer_page = 'slider_adding';
        }
        ?>
                    
                            $page='<?php echo $tt_pointer_page; ?>';
                    
                            $('#toplevel_page_theme-options>.wp-submenu li').each(function(i){
                                liClass='';
                                switch(i){
                                    case 0: liClass="tt-theme-options";  break;
                                    case 1: liClass="tt-theme-seo";      break;
                                    case 2: liClass="tt-theme-elements"; break;
                                    case 3: liClass="tt-theme-guide";    break;
                                }
                                $(this).addClass(liClass);
                            });
                    
                            function tt_dismiss_wp_pointer(){
                                $.post( ajaxurl, {
                                    pointer: 'tt_feature_pointer',
                                    action: 'dismiss-wp-pointer'
                                });
                            }
                    
                            function tt_open_wp_pointer(){
                                $('<?php echo $back_end_pointer_message[$tt_pointer_page]['selector']; ?>').pointer({
                                    content: '<?php echo $back_end_pointer_message[$tt_pointer_page]['content']; ?>',
                                    position: {
                                        edge: 'left',
                                        align: 'center'
                                    },
                                    close: function() { tt_dismiss_wp_pointer(); }
                                }).pointer('open');
                            }
                    
                            switch($page){
                                case 'tt_option_group':
                                case 'theme-options' :
                                case 'seo-options'     :
                                //                case 'theme-guide'          : { $('#toplevel_page_theme-options li.tt-theme-guide').pointer('open');    break; }
                            case 'theme-guide'          :
                            case 'tt_pointer'     :
                            case 'slider_adding'  :{tt_open_wp_pointer(); break;}
                            case 'comp-options'   : {
                                    $('.controls input').each(function(){
                                        if($(this).attr('name')=='check_composer[page]' && $(this).attr('checked')!='checked'){
                                            $(this).attr('checked','checked');
                                            $('#c_of_save').click();
                                        }
                                    });
                                    tt_open_wp_pointer();
                                    break; 
                                }
                        }
                    });
        </script><?php
    }

endif;

if (!function_exists('infiniteScroll')) :

// Infinite Scroll
    function infiniteScroll() {
        global $wp_query, $data;
        $pages = $wp_query->max_num_pages;
        if (!$pages) {
            $pages = 1;
        }
        if (1 < $pages) {
            $auto_infinite_scroll = (isset($data['auto_infinite_scroll']) && $data['auto_infinite_scroll']) ? true : false;
            echo '<nav id="page_nav" data-pages="' . $pages . '"><a href=""></a></nav>';
            if (!$auto_infinite_scroll) {
                echo '<nav><a class="next-items" style="cursor:pointer;">' . __('NEXT', 'themeton') . '</a></nav>';
            }
        }
    }

endif;

if (!function_exists('style_search_form')) :

// Customize the search form
    function style_search_form($form) {
        $form = '<form method="get" id="searchform" class="form-search " action="' . get_option('home') . '/" >
            <div class="input-append">';
        $form .= '<button type="submit" id="searchsubmit"></button>';
        if (is_search()) {
            $form .='<input type="text" value="' . attribute_escape(apply_filters('the_search_query', get_search_query())) . '" name="s" class="span3" id="appendedInputButton" onfocus="if(this.value==this.defaultValue)this.value=\'\';" onblur="if(this.value==\'\')this.value=this.defaultValue;"/>';
        } else {
            $form .='<input type="text" value="Search this site" name="s" class="span3" id="appendedInputButton" onfocus="if(this.value==this.defaultValue)this.value=\'\';" onblur="if(this.value==\'\')this.value=this.defaultValue;"/>';
        }
        $form .= '</div>
            </form>';
        return $form;
    }

    add_filter('get_search_form', 'style_search_form');
endif;

if (!function_exists('add_theme_caps')) :

    function add_theme_caps() {
        $role = get_role('author');
        $role->add_cap('edit_theme_options');
    }

    add_action('admin_init', 'add_theme_caps');
endif;

if (!function_exists('is_mobile')) :

    function is_mobile() {
        if (preg_match('/(alcatel|amoi|android|avantgo|blackberry|benq|cell|cricket|docomo|elaine|htc|iemobile|iphone|ipad|ipaq|ipod|j2me|java|midp|mini|mmp|mobi|motorola|nec-|nokia|palm|panasonic|philips|phone|sagem|sharp|sie-|smartphone|sony|symbian|t-mobile|telus|up\.browser|up\.link|vodafone|wap|webos|wireless|xda|xoom|zte)/i', $_SERVER['HTTP_USER_AGENT']))
            return true;
        else
            return false;
    }

endif;

if (!function_exists('tt_prev_next_post')) :

// Next prev post
    function tt_prev_next_post() {
        global $formatimg, $format;
        echo "<div class='clearfix next_prev'><div class='sep-container clearfix'><hr class='seperator left-s'><hr class='seperator'></div>";

        //Get Previous
        $next_post = get_next_post();
        if (!empty($next_post)) {
            query_posts('p=' . $next_post->ID);
            if (have_posts()) {
                the_post();
                ?>
                <div id="prev" class="single_prev">
                    <a href="<?php the_permalink(); ?>" class="link-content" title="<?php the_title(); ?>">
                        <div class="single_prev_post"><?php echo showBrief(get_the_title(), 3); ?> ...</div>
                    </a>
                </div><?php
            }
            wp_reset_query();
        }
        //Get Next
        $prev_post = get_previous_post();
        if (!empty($prev_post)) {
            query_posts('p=' . $prev_post->ID);
            if (have_posts()) {
                the_post();
                ?>
                <div id="next" class="single_next">
                    <a href="<?php the_permalink(); ?>" class="link-content" title="<?php the_title(); ?>">
                        <div class="single_next_post"><?php echo showBrief(get_the_title(), 3); ?> ...</div>
                    </a>
                </div><?php
            }
            wp_reset_query();
        }
        echo "</div>";
    }

endif;

//Function for Favicon upload
if (!function_exists('custom_upload_mimes')) {
    add_filter('upload_mimes', 'custom_upload_mimes');

    function custom_upload_mimes($existing_mimes = array()) {
        $existing_mimes['ico'] = "image/x-icon";
        return $existing_mimes;
    }

}