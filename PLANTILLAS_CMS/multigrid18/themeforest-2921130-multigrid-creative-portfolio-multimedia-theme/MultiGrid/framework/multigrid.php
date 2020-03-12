<?php
/*
 * Universal ThemeTon featured image function
 */
if ( ! function_exists( 'post_image_show_auto_size' ) ) :
function post_image_show_auto_size($permalink = false, $noimage = false, $custom_link = '') {
    global $post, $format, $single, $customlink;
    $videoIcon = "";
    $post_image_tumb = get_post_image();

    if (empty($post_image_tumb)) {
        if (has_post_thumbnail($post->ID)) {
            $post_image_tumb = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), 'large');
            $post_image_tumb = $post_image_tumb[0];
        }
    }
    $image_meta = 'tt_slide_images';
    if ($image_meta != '')
        $slide_imgs = get_post_meta($post->ID, $image_meta, true);

    if (!has_post_thumbnail($post->ID) && !($slide_imgs != '' && count($slide_imgs) > 0)) {
        if ($format == 'video') {
            $videoThumb = get_youtube_vimeo_thumb_url(get_post_meta($post->ID, 'tt-video-embed', true));
            $youtube='src="http://www.youtube.com/embed/';
            $vimeo='src="http://player.vimeo.com/video/';
            if(strpos(get_post_meta($post->ID, 'tt-video-embed', true),$youtube)) {
                $videoIcon = '<div class="instagram-link"><img src="'.get_template_directory_uri().'/images/youtube-icon.png"></div>';
            } else if(strpos(get_post_meta($post->ID, 'tt-video-embed', true),$vimeo)) {
                $videoIcon = '<div class="instagram-link"><img src="'.get_template_directory_uri().'/images/vimeo-icon.png"></div>';
            }
            
            if ($videoThumb !== false) {
                $post_image_tumb = $videoThumb;
            }
        }
    }

    if (!empty($post_image_tumb)) {
        $lrg_img = $post_image_tumb;
        $klass = $format == 'video' ? 'iconVideo' : 'iconImage'
        ?>
        <div class="item-image">
            <div class="entry-image clearfix">
                <div class="hover-content"> <?php if ($slide_imgs != '' && count($slide_imgs) > 1) { ?>
                        <div class="flexslider">
                            <ul class="slides item-click-modal<?php echo $customlink['klass'];?>"><?php
                                foreach ($slide_imgs as $immg) {
                                    $ilink = $immg['image'];
                                    $pre_classes = "preload imgSmall item-preview ";
                                    $classes = $pre_classes;
                                    $classes .= $klass;
                                    $rell = count($slide_imgs) > 1 ? "prettyPhoto[" . $post->ID . "]" : 'prettyPhoto';
                                    if (!$permalink) {
                                        $ilink = $customlink['enable'] == 'true' ? $customlink['url'] : get_permalink($post->ID);
                                        $rell = '';
                                        //$classes = $pre_classes . 'iconPost';
                                    } ?>
                                    <li>
                                        <?php if (!is_single() && !is_page()) { ?>
                                            <a title="<?php the_title(); ?>"<?php echo $customlink['target'];?> class="<?php print $classes; ?>" href="<?php echo $ilink; ?>" rel="<?php print $rell; ?>">
                                            <?php } ?>
                                            <img src="<?php echo $immg['image']; ?>" alt="" style="width:100%; height:auto;" />
                                            <?php if (!is_single() && !is_page()) { ?>
                                            </a>
                                        <?php } ?>
                                    </li><?php
                                } ?>
                            </ul>
                        </div><?php
                    } else {
                        $ilink = $lrg_img;
                        $pre_classes = "preload imgSmall item-preview ";
                        $classes = $pre_classes;
                        if ($slide_imgs != '' && isset($slide_imgs[0])) {
                            $ilink = $lrg_img;
                            $classes .= $klass;
                        } else
                            $classes .= $klass;
                        $rell = count($slide_imgs) > 1 ? "prettyPhoto[" . $post->ID . "]" : 'prettyPhoto';
                        if (!$permalink) {
                            $ilink = $customlink['enable'] == 'true' ? $customlink['url'] : get_permalink($post->ID);
                            $rell = '';
                            //$classes = $pre_classes . 'iconPost';
                        }
                                    ?>
                        <?php if (!is_single() && !is_page()) { ?>
                            <a title="<?php the_title(); ?>" href="<?php print $ilink; ?>"<?php echo $customlink['target'];?> class="<?php print $classes.$customlink['klass']; ?> item-click-modal" rel="<?php print $rell; ?>">
                            <?php } ?>
                            <img src="<?php print $post_image_tumb; ?>" alt="" style="width:100%; height:auto;" />
                            <?php if (!is_single() && !is_page()) { ?>
                            </a>
                        <?php }
                            echo $videoIcon;
                    }
                    ?>
                </div>
            </div>
        </div><?php
        return true;
    } else {
        global $blogConf;
        $bool = (isset($blogConf['hide_content']) && $blogConf['hide_content'] == true) ? true : false;
        if ($bool) {
            get_template_part('post', 'title');
        }
    }
    return false;
}endif;

$tt_framework = new wp_tt_framework();
$tt_framework->init();

if ($tt_framework->admin) {
    $postSlide = Array(
        'name' => __('Featured image slider', 'themeton'),
        'id' => 'post_slider',
        'type' => 'post',
        'crop' => false,
    );
    $tt_framework->admin->addSlideMeta($postSlide);

    global $sidebar;
    $tt_framework->admin->addMeta(Array(
        'type' => 'page',
        'title' => 'Page additional options',
        'meta_boxes' => Array(
            'hide_pagetitle' => Array('name' => 'hide_pagetitle', 'rel' => 'default,page-template-blog.php,page-template-portfolio.php', 'type' => 'checkbox', 'description' => __('If turn it ON, your page shows with title on top.', 'themeton'), 'title' => __('Show page title?', 'themeton'), 'std' => 'checked'),
            'teaser_text' => Array('name' => 'teaser_text', 'rel' => 'default,page-template-blog.php,page-template-portfolio.php,page-template-archive.php', 'type' => 'textarea', 'description' => __('Please enter teaser your text here.', 'themeton'), 'title' => __('Teaser text', 'themeton')),
            'meta_author' => Array('name' => 'meta_author', 'rel' => 'default', 'type' => 'checkbox', 'description' => __('If turn it ON, post show without author link on page', 'themeton'), 'title' => __('Hide post author ?', 'themeton')),
            'show_filter' => Array('name' => 'show_filter', 'rel' => 'page-template-blog.php,page-template-portfolio.php', 'type' => 'checkbox', 'description' => __('If turn it ON, this page shows with <tt>Post Filter by Category</tt> on top area.', 'themeton'), 'title' => __('Show post filter by Category?', 'themeton'), 'std' => 'checked'),
            'show_filter_tag' => Array('name' => 'show_filter_tag', 'rel' => 'page-template-blog.php,page-template-portfolio.php', 'type' => 'checkbox', 'description' => __('If turn it ON, this page shows with <tt>Post Filter by Tag</tt> on top area.', 'themeton'), 'title' => __('Show post filter by Tag?', 'themeton'), 'std' => ''),
            'custom_layout' => Array('name' => 'custom_layout', 'rel' => 'default', 'type' => 'layouts', 'description' => __('Choose the sidebar layout for this specific post. You can choose Full width or Right sidebar.', 'themeton'), 'options' => Array('select sidebar position' => $s_layout), 'title' => __('Page layout', 'themeton'), 'std' => '1-1-1'),
            'custom_sidebar' => Array('name' => 'custom_sidebar', 'show' => '#custom_layout', 'rel' => 'default', 'type' => 'select', 'title' => __('Select sidebar', 'themeton'), 'std' => 'default', 'options' => $sidebar, 'description' => 'Please select sidebar here. You can add custom sidebar for your need on Sidebar tab of <tt>Theme Options</tt> panel.'),
            'blog_categories' => Array('name' => 'blog_categories', 'rel' => 'page-template-blog.php,page-template-portfolio.php', 'title' => __('Including blog categories', 'themeton'), 'type' => 'terms', 'term' => 'category', 'std' => '', 'description' => __('Selecte categories include in this page. If you didn\'t select anyone from those categories, page shows with posts from all the categories.', 'themeton')),
            'posts_perpage' => Array('name' => 'posts_perpage', 'rel' => 'page-template-blog.php,page-template-portfolio.php', 'title' => __('Pagination number', 'themeton'), 'type' => 'text', 'std' => '12', 'description' => __('The number is used for posts as displaying a limited number of results on this page.', 'themeton')),
            'hide_content' => Array('name' => 'hide_content', 'rel' => 'page-template-blog.php,page-template-portfolio.php', 'type' => 'checkbox', 'description' => __('If turn it ON, posts show by just featured image or post format element. It means your posts will show without title, meta and content on this page.', 'themeton'), 'title' => __('Hide content?', 'themeton')),
            'post_contshow' => Array('name' => 'post_contshow', 'rel' => 'page-template-blog.php,page-template-portfolio.php', 'title' => 'Content control of posts', 'type' => 'select', 'std' => 'Full', 'options' => Array('Hide', 'Full', '5', '10', '20', '30', '40', '50', '60', '70', '80', '90', '100'), 'description' => '- <tt>Full</tt> means show post contents and If there have excerpts or read more split on content of posts, content shows for those. <br>- Number selections are count of words splitting of this blog posts.'),
            'order_type' => Array('name' => 'order_type', 'rel' => 'page-template-blog.php,page-template-portfolio.php', 'type' => 'select', 'std' => 'category', 'options' => Array('Date', 'Date ASC', 'Title', 'Title ASC', 'Random'), 'description' => __('Select order type of posts. If you select Random order here, your posts show random ordering every 5 minutes. If we don\'t know current random order, database query rendering new random order for your next page (pagination result) and we will see duplicate posts sometimes.', 'themeton'), 'title' => __('Order type', 'themeton')),
        )
    ));

    $tt_framework->admin->addMeta(Array(
        'type' => 'post',
        'title' => 'Post additional options',
        'meta_boxes' => Array(
            'custom_bg' => Array('name' => 'custom_bg', 'show' => '#bg_color,#dark_light,#post_style', 'type' => 'checkbox', 'description' => __('If turn this option ON, your current post background color will define your selected color on Blog/Category page.', 'themeton'), 'title' => __('Custom background color?', 'themeton')),
            'bg_color' => Array('name' => 'bg_color', 'type' => 'color', 'description' => __('Please choose custom color here.', 'themeton'), 'title' => __('Background color', 'themeton'), 'std' => '#FFF'),
            'dark_light' => Array('name' => 'dark_light', 'type' => 'radio', 'description' => __('This option controls your text color. If you pick darker color on previous field, you should select here dark choice. Then your text show white color.', 'themeton'), 'title' => __('Is your background color Dark? Or Light?', 'themeton'), 'std' => 'None', 'options' => array('Default', 'Dark', 'Light')),
            'post_meta' => Array('name' => 'post_meta', 'type' => 'checkbox', 'description' => __('If turn it ON, post will show without meta on single', 'themeton'), 'title' => __('Hide post meta?', 'themeton')),
            'meta_author' => Array('name' => 'meta_author', 'type' => 'checkbox', 'description' => __('If turn it ON, post will show without author link on blog/category pages', 'themeton'), 'title' => __('Hide post author ?', 'themeton')),
            'image_hide' => Array('name' => 'image_hide', 'type' => 'checkbox', 'description' => __('If turn it ON, your post will show without Featured Image in single post entered. This option only refers to this single post/single page.', 'themeton'), 'title' => __('Hide featured images on single?', 'themeton')),
            'is_featured_post' => Array('name' => 'is_featured_post', 'type' => 'checkbox', 'description' => __('If turn it ON, your post size displays larger than regular posts.', 'themeton'), 'title' => __('Is this featured?', 'themeton')),
			'custom_sidebar' => Array('name' => 'custom_sidebar', 'type' => 'select', 'title' => __('Select sidebar', 'themeton'), 'std' => 'default', 'options' => $sidebar, 'description' => 'Please select sidebar here. You can add custom sidebar for your need on Sidebar tab of <tt>Theme Options</tt> panel.'),
			'custom_link' => Array('name' => 'custom_link', 'type' => 'checkbox', 'show' => '#custom_link_url,#custom_link_target', 'title' => __('Custom link', 'themeton'), 'description' => 'If turn it ON, link will jump custom link instead of modal/single post window.'),
            'custom_link_url' => Array('name' => 'custom_link_url', 'type' => 'text', 'title' => __('Custom link url', 'themeton'), 'description' => 'Add here custom web address.'),
            'custom_link_target' => Array('name' => 'custom_link_target', 'type' => 'select', 'title' => __('Custom link target', 'themeton'), 'options' => array('_self', '_blank'), 'description' => 'Select link target.'),
		)
    ));
}
if ( ! function_exists( 'showBrief' ) ) :
function showBrief($str, $length) {
    $str = strip_tags($str);
    $str = explode(" ", $str);
    return implode(" ", array_slice($str, 0, $length));
}endif;

if (isset($_REQUEST['like_it'])) {
    global $wpdb;
    $ip = $_SERVER['REMOTE_ADDR'];
    $pid = $_REQUEST['like_it'];
    $liked = get_post_meta($pid, 'post_liked', true);
    $voteStatusByIp = $wpdb->get_var("SELECT COUNT(*) FROM " . $wpdb->prefix . "liked WHERE post_id = '$pid' AND ip = '$ip'");
    if (!isset($_COOKIE['liked-' . $pid]) && $voteStatusByIp == 0) {

        if ($liked == '') {
            $liked = 1;
            add_post_meta($pid, 'post_liked', 1);
            $lk = 1;
        } else {
            $lk = (intval($liked) + 1);
            update_post_meta($pid, 'post_liked', $lk);
        }
        setcookie('liked-' . $pid, 1);
    }
    print $lk . ' like';
    if ($lk > 1)
        echo's';
    die;
} ?>