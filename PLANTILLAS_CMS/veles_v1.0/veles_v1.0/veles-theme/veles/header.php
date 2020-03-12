<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?> >
<head>
<meta http-equiv="Content-Type" content='text/html; charset=utf-8' />
<title><?php bloginfo('name') ?></title>
<meta name="description" content="<?php bloginfo('description'); ?>" />  
<meta name="keywords" content="<?php bloginfo('name'); ?>" />
<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
<link href="<?php echo get_template_directory_uri(); ?>/css/reset.css" rel="stylesheet" type="text/css" />
<link href="<?php echo get_template_directory_uri(); ?>/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/nivo-default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/nivo-slider.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="<?php echo get_template_directory_uri(); ?>/css/prettyPhoto.css"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/superfish-menu/superfish.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/nivo-slider/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/jquery.asyncslider.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/custom.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/jquery.tweet.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/jquery.quovolver.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/testimonialrotator.js"></script>

<?php  global $data; 
if ( ! isset( $content_width ) ) $content_width = 940;?>
<?php wp_link_pages(); ?>
<?php  global $makro; ?>
<script>
jQuery(document).ready(function($){
	$(".testimonialrotator").testimonialrotator({
		settings_slideshowTime:2
		});
});
</script>
<script type="text/javascript">
/***************************************************
			TWITTER FEED
***************************************************/

jQuery.noConflict()(function($){
$(document).ready(function() {  

	  $(".tweet").tweet({
        	count: 2,
        	username: '<?php echo $data['twitter_feed']; ?>',
        	loading_text: "loading twitter..."      
		});
});
});
</script>
<script type="text/javascript">
jQuery.noConflict()(function($){
		
		$('blockquote').quovolver();
		
	});
</script>

<?php if ($data['slider_select'] == "Vertical Accordion Slider") { ?>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/jquery.contentcarousel.js"></script>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/jquery.vaccordion.js"></script>


<script>
/***************************************************
			VERTICAL ACCORDION SLIDER
***************************************************/

jQuery.noConflict()(function($){
$('#ca-container').contentcarousel();
});
jQuery.noConflict()(function($) {
	$('#va-accordion').vaccordion();
});
</script>
<?php } ?>
<?php if ($data['slider_select'] == "Accordion Slider") { ?>
<script type="text/javascript" src="<?php echo get_template_directory_uri(); ?>/js/kwicks/jquery.kwicks-1.5.1.pack.js"></script>
<script>
/***************************************************
			ACCORDION SLIDER
***************************************************/
jQuery.noConflict()(function($){
	$('.kwicks').kwicks({
		max : 900,
		spacing : 0
	});
});
</script>
<?php } ?>
<link rel="icon" href="<?php echo $data['media_upload_favicon']; ?>" />
<link rel="shortcut icon" href="<?php echo $data['media_upload_favicon']; ?>" />
<style type="text/css">
body {
	background-image: <?php echo 'url("'.strip_tags($data['custom_bg']).'")'; ?>; 
	background-color: <?php echo strip_tags($data['body_background'])." !important"; ?> 
}
</style>
<?php 
	$head_font_one = $data['headers_font_one'];
	$head_font_two = $data['headers_font_two'];
	$head_font_three = $data['headers_font_three'];
	$head_font_four = $data['headers_font_four'];
	$head_font_five = $data['headers_font_five'];
	$head_font_six = $data['headers_font_six'];					

 ?>

<style type="text/css">
h1 {
	font-family: <?php echo $head_font_one['face']; ?>;
	color: <?php echo $head_font_one['color']; ?>;
	font-style: <?php echo $head_font_one['style']; ?>;
	font-size: <?php echo $head_font_one['size']; ?>; 
	
}
h2{
	font-family: <?php echo $head_font_two['face']; ?>;
	color: <?php echo $head_font_two['color']; ?>;
	font-style: <?php echo $head_font_two['style']; ?>;
	font-size: <?php echo $head_font_two['size']; ?>; 
	
}
h3 {
	font-family: <?php echo $head_font_three['face']; ?>;
	color: <?php echo $head_font_three['color']; ?>;
	font-style: <?php echo $head_font_three['style']; ?>;
	font-size: <?php echo $head_font_three['size']; ?>; 
	
}
h4{
	font-family: <?php echo $head_font_four['face']; ?>;
	color: <?php echo $head_font_four['color']; ?>;
	font-style: <?php echo $head_font_four['style']; ?>;
	font-size: <?php echo $head_font_four['size']; ?>; 
	
}
h5 {
	font-family: <?php echo $head_font_five['face']; ?>;
	color: <?php echo $head_font_five['color']; ?>;
	font-style: <?php echo $head_font_five['style']; ?>;
	font-size: <?php echo $head_font_five['size']; ?>; 
	
}
h6 {
	font-family: <?php echo $head_font_six['face']; ?>;
	color: <?php echo $head_font_six['color']; ?>;
	font-style: <?php echo $head_font_six['style']; ?>;
	font-size: <?php echo $head_font_six['size']; ?>; 
	
}
.colored {color: <?php echo $data['colored']; ?>}
.button_readmore:hover, .comment-reply-link:hover {color: <?php echo $data['colored']; ?>}
h5 > a{ color:<?php echo $data['colored']; ?>}
.partner img:hover, .clients img:hover {border:1px solid <?php echo $data['colored']; ?>}
.highlight a:hover { color:<?php echo $data['colored']; ?>}
#jstwitter .tweet a {color: <?php echo $data['colored']; ?>}
input:focus {
-moz-box-shadow: 0 0 0 1px <?php echo $data['colored']; ?> inset;
-webkit-box-shadow: 0 0 0 1px <?php echo $data['colored']; ?> inset;
box-shadow: 0 0 0 1px <?php echo $data['colored']; ?> inset}
.subpage_block:hover { color:<?php echo $data['colored']; ?>}		  
.view a.info:hover {background: <?php echo $data['colored']; ?>}
.pagination li.current a, .pagination .current, .current{ background: <?php echo $data['colored']; ?>}
.pagination li a:hover, .page-numbers:hover {background: <?php echo $data['colored']; ?>}
#note { color:<?php echo $data['colored']; ?>}
.sidebar ul li:hover  a, .footer li:hover a { color:<?php echo $data['colored']; ?>}
#filter-sidebar li.current { color:<?php echo $data['colored']; ?> }
ul.navigation-sidebar li.current a, ul.navigation-sidebar a:hover {color:<?php echo $data['colored']; ?>  }
ul.navigation-sidebar li.current a { color: <?php echo $data['colored']; ?> !important;}
ul.navigation-sidebar a:hover {	color:<?php echo $data['colored']; ?>}
.tags p:hover, .tagcloud a:hover {background:<?php echo $data['colored']; ?>}
.va-slice h3:hover{	color:<?php echo $data['colored']; ?>}
.va-slice ul li a{background:<?php echo $data['colored']; ?>}
.va-more{	background-color:<?php echo $data['colored']; ?>}
.tweet_list li a{ color:<?php echo $data['colored']; ?>}
.red {color:<?php echo $data['colored']; ?>}
</style>
<?php if (is_page_template('contacts.php') ) { ?>

<script type="text/javascript">
jQuery.noConflict()(function($){
$(document).ready(function ()
{ // after loading the DOM
    $("#ajax-contact-form").submit(function ()
    {
        // this points to our form
        var str = $(this).serialize(); // Serialize the data for the POST-request
        $.ajax(
        {
            type: "POST",
            url: '<?php echo get_template_directory_uri(); ?>/contact.php',
            data: str,
            success: function (msg)
            {
                $("#note").ajaxComplete(function (event, request, settings)
                {
                    if (msg == 'OK')
                    {
                        result = '<div class="notification_ok">Message was sent to website administrator, thank you!</div>';
                        $("#contacts-form").hide();
                    }
                    else
                    {
                        result = msg;
                    }
                    $(this).html(result);
                });
            }
        });
        return false;
    });
});
});
</script>
<?php } ?>
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<?php wp_head(); ?>
</head>
<body <?php body_class('main_body'); ?>>
	<?php if ($data['top_line_style'] == "Line With Content") { ?>
	<div class="top_line">
        <div class="container">
        	<?php if (empty($data['top_line_block1'])){ ?>
        	<div class="rss">
            Subscribe to be notified for updates: <a href="<?php bloginfo('url'); ?>/feed">RSS Feed</a>
            </div>
            <?php } else {?>
            <div class="rss">
            <?php echo $data['top_line_block1']; ?>
            </div>
            <?php } ?>
            <?php if($data['top_line_search'] == true ) { ?>
            <nav>
                <ul>
                    <li id="login">
                        <a id="login-trigger" href="#">
                            Search <span>&#x25BC;</span>
                        </a>
                        <div id="login-content">
                            <form action="<?php echo home_url(); ?>/" method="get" id="searchform">
                                <div class="span-5 notopmargin">
                                <fieldset id="inputs">
                                    <input type="text" value="<?php the_search_query(); ?>" name="s" id="s" placeholder="search..."  />   
                                </fieldset>
                                </div>
                                <div class="span-2 notopmargin last">
                                <fieldset id="actions">
                                    <input type="submit" id="submit" value="Search">
                                </fieldset>
                                </div>
                            </form>
                        </div>                     
                    </li>
                </ul>
            </nav>
            <?php } ?>
        </div>
    </div>
    <?php } ?>
    <?php if ($data['top_line_style'] == "Line Without Content") { ?>
	<div class="top_line" style="height:5px;">
    </div>
    <?php } ?>
    <!--Header-->
    <div class="container">
    	<div class="span-8">
        	<div id="logo">
            <?php if ($data['logo_select'] == "Image") { ?>
                <a href="<?php bloginfo('url'); ?>" class="colored">
					<?php  if(empty($data['media_upload_logo'])) { echo "<h4 class='colored uppercase'>Logo not found</h4>"; } else { ?> 
                    	<img src="<?php echo stripslashes($data['media_upload_logo']) ?>" alt="Logo" />
                    <?php } ?>                
				</a>
			<?php } ?>
            <?php if ($data['logo_select'] == "Text") { ?>
                <a href="<?php bloginfo('url'); ?>"></br>
                	<h3><?php echo $data['logo_text']; ?></h3>
                    <span class="notopmargin nobottommargin"><?php echo $data['logo_slogan']; ?></span>
                </a>
			<?php } ?>
            </div>
        </div>
        <div class="span-16 last">
        	<?php wp_nav_menu( array('theme_location' => 'main_menu', 'menu_class' => 'menu sf_menu')); ?>
        </div>
       <?php if (!(($data['slider_select'] == "AsyncSlider") & (is_front_page()) || (is_page_template('index3.php')) || (is_page_template('index2.php')))) { ?> <div class="span-24<?php if ((is_front_page()) || (is_page_template('home.php')) || (is_page_template('index3.php')) || (is_page_template('index2.php'))) { ?><?php if (($data['slider_select'] == "Nivo Slider") || ($data['slider_select'] == "Vertical Accordion Slider") || ($data['slider_select'] == "Accordion Slider") || ($data['slider_select'] == "Static Homepage") || ($data['slider_select'] == "Video Block")) { ?> mb30<?php } ?><?php } ?> separator"></div><?php } ?>
        	<?php if (($data['slider_select'] == "AsyncSlider") & (is_front_page())& (is_front_page()) || (is_page_template('index3.php')) || (is_page_template('index2.php'))) { ?><div class="span-24"></div> <?php } ?>
            <div class="span-24 red margin15">
			<?php if ( !(is_front_page())) { ?>
            	<?php if ( !(is_page_template('home.php')) & !(is_page_template('index2.php'))  & !(is_page_template('index3.php'))) { ?>
                <?php kama_breadcrumbs(); // Вызов навигационной цепочки ?>
					<div class="span-24 notopmargin separator"></div>
            	<?php } ?>
			<?php } ?>
            </div>
        </div>
        <!-- END Header-->
        <div class="clear">