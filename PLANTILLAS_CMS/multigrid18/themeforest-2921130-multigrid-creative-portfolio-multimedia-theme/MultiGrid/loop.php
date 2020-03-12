<?php
global $data, $blogConf, $formatimg, $format, $query, $isBlog, $query_string, $customlink;

$order_type = isset($data['order_type'])?($data['order_type']!='Date'?$data['order_type']:'Date'):'Date';
if (isset($isBlog) && $isBlog == true && isset($blogConf['order_type']))
    $order_type = $blogConf['order_type'];
$order ="";
if ($order_type != 'Date') {
    if ($order_type == 'Date ASC')
        $order = '&order=ASC';
    if ($order_type == 'Title')
        $order = '&orderby=title&order=DESC';
    if ($order_type == 'Title ASC')
        $order = '&orderby=title&order=ASC';
    if ($order_type == 'Random')
        $order = '&orderby=rand';
}

if (isset($isBlog) && $isBlog == true)
    query_posts($query.$order);
else
    query_posts($query_string.$order);

if (have_posts()) {
    while (have_posts()) : the_post();
        $post_options = get_post_meta($post->ID, 'themeton_additional_options', true);
        $format = get_post_format();
        $formatimg = $format == '' ? 'standart' : "format-$format";
        $no_content = (isset($blogConf['hide_content']) && $blogConf['hide_content']==true)? "no-content" : "";
        if(isset($post_options['custom_bg'])&&$post_options['custom_bg'])
        {
            $color = $post_options['bg_color'];
            $class = isset($post_options['dark_light']) ? ("post-".strtolower($post_options['dark_light'])." ") : "";
        } else {
            $args=array('orderby' => 'name');
            $terms = wp_get_post_terms( $post->ID , 'category', $args);
            $option = get_option("taxonomy_".$terms[0]->term_id);
            $color = isset($option['bg_color']) ? $option['bg_color'] : '';
            $class = isset($option['dark_light']) ? ("post-".$option['dark_light']." ") : '';
        }
		
		if(isset($post_options['custom_link'])) {
            $customlink['enable'] = 'true';
            $customlink['url'] = $post_options['custom_link_url'];
            if(!preg_match_all('!https?://[\S]+!', $customlink['url'], $matches))
                $customlink['url'] = "http://" . $customlink['url'];
            $customlink['target'] = ' target="'.$post_options['custom_link_target'].'"';
            $customlink['klass'] = ' custom-link';
        } else {
            $customlink['url'] = get_permalink();
            $customlink['enable'] = $customlink['target'] = $customlink['klass'] = "";
        }
        ?>
        <article id="post-<?php the_ID(); ?>" <?php post_class("$no_content item-not-rewidthed item-hidden item-article item-margin item-not-inited {$customlink['klass']}"); ?> data-title="<?php the_title();echo " | ".get_option('blogname'); ?>" data-permalink="<?php the_permalink();?>">
            <div style="background-color: <?php echo $color; ?>" class="item <?php echo $class; echo (get_post_format()===false?'standard':get_post_format()).'-post'; ?> <?php if(isset($post_options['is_featured_post'])&&$post_options['is_featured_post']){ echo"item-featured"; } ?>" >
                <?php get_template_part('post', 'featuredimage'); ?>
                <?php if($no_content=="") { ?>
                    <div class="item-content">
                    <?php get_template_part('post', 'title'); ?>
                    <?php tt_get_post_category_list(); ?>
                    <?php get_template_part('post', 'content'); ?>
                    </div>
                    <?php get_template_part('post', 'meta'); ?>
                <?php } ?>
            </div>
        </article><?php
    endwhile;
}
?>