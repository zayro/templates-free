<!DOCTYPE html>
<html <?php language_attributes(); ?>>
    <head>
        <?php current_title(); ?>
        <?php meta_robots(); ?>
        <?php favicon(); ?>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!-- Mobile Specific Metas
          ================================================== -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">        

        <!-- IMPORTING CSS FILES -->
        <link rel="stylesheet" href="<?php print get_template_directory_uri() . '/css/bootstrap.css';  ?>" type="text/css" />
        <link rel="stylesheet" href="<?php print get_stylesheet_directory_uri() . '/style.css'; ?>" type="text/css" />
        <link rel="stylesheet" href="<?php print get_template_directory_uri() . '/css/responsive.css'; ?>" type="text/css" />
        <link rel="stylesheet" href="<?php print get_stylesheet_directory_uri() . '/css/options.css'; ?>" type="text/css" />
        <?php
        global $data, $item_size, $post_style, $blogConf, $isBlog;
        $item_size_keys = array_keys($item_size);
        $data['item_size'] = isset($data['item_size'])&&$data['item_size']? $data['item_size']:$item_size_keys[1]; ?>
        <script type="text/javascript">
            var tt_theme_uri    = '<?php echo get_template_directory_uri(); ?>';
            var tt_infinite_img = '<?php echo get_template_directory_uri() . '/images/ajax-loader.gif'; ?>';
            var $infinitescroll =  <?php echo (isset($paged)&&$paged)?$paged:1; ?>;
            var $tt_item_size   = '<?php echo $item_size[$data['item_size']] ?>';
            var tt_infinite_loadingMsg  = '<?php _e('Loading the next set of posts...', 'themeton'); ?>';
            var tt_infinite_finishedMsg = '<?php _e('No more pages to load.', 'themeton'); ?>';
			var tt_sharethis = '<?php echo (isset($data['social_media'])&&$data['social_media']) ? "true" : "false"; ?>';
        </script>
        <!-- IMPORTING JS FILES -->
        <?php add_action('wp_print_scripts', 'import_scripts'); ?>
        <?php wp_head();?>
        <?php blog_open_graph_meta(); ?>
		<?php if(isset($data['social_media']) && $data['social_media']) { ?>
			<script type="text/javascript">
				stLight.options({publisher: '<?php echo isset($data['sharethis_key']) ? $data['sharethis_key'] : ""; ?>'});
			</script>
		<?php } ?>
    </head><?php
    $post_skin = isset($data['post_skin']) ? $post_style[$data['post_skin']] : '';
    $full_page = (isset($blogConf['layout']) && $blogConf['layout'] == '0-1-1') ? 'page-fullwidth' : '';
    $modal_mode = (isset($data['modal_mode'])&&!$data['modal_mode']) ? 'no-modal' : '';?>
    
    <body <?php body_class("$post_skin $modal_mode $full_page"); ?>>
        
        <?php if(!is_single($post)){echo'<div class="tt-modal-box hide"><div class="modalback"></div><a href="#" class="lightBoxNav navLeft">Left</a><a href="#" class="lightBoxNav navRight">Right</a><div class="item-single"></div></div>';} ?>
        <!-- Start Header -->
        <header id="header">
            <div class="navbar navbar-fixed-top" <?php echo (is_admin_bar_showing()?"style='top:28px;'":""); ?>>
                <div class="navbar-inner clearfix">
                    <div class="btn-logo-container">
                        <noscript><a href="http://www.vectors4all.com">stock vector icons</a></noscript>
                        <?php logo_init(); ?>
                    </div>
                    <div class="nav-toolbar-container">
                        <div class="nav" id="navigation">
                            <?php navigation(); ?>
                        </div>
                        <div class="header-sidebar">
                            <?php dynamic_sidebar('header-sidebar');?>
                        </div>
                    </div>
                </div>
            </div>
            <?php tt_get_filter_list($isBlog); ?>
            <?php tt_get_tfilter_list($isBlog); ?>
        </header>
        <!-- End Header -->
        <!-- Start Wrapper -->
        <div class="wrapper">