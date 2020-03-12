<?php
/*
 * HEADER
 * Opened in each page of your site. You will find the top hidden area, header, the navigation...
 * The variables are declared in the top of each page
 *  
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title><?php echo $pageName ?></title>
        <!-- // FAVICON // -->
        <link rel="icon" type="image/png" href="images/favicon.png" />
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="<?php echo $pageDescription; ?>">
        <meta name="keywords" content="<?php echo $pageKeywords; ?>">
        
        <!-- ///////////////////////////////////////////////////////////////////
        Stylesheet 
        /////////////////////////////////////////////////////////////////////-->
        <link rel="stylesheet" href="css/bootstrap.css" media="screen"  />
        <link rel="stylesheet" href="css/bootstrap-responsive.css" media="screen"  />
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/style_responsive.css">
        <link rel="stylesheet" href="css/prettyPhoto.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
        <?php
            if( $stylesheetMore1 != ""):
                echo'<link rel="stylesheet" href="'. $stylesheetMore1 .'" media="screen"  />';
            endif;
            if( $stylesheetMore2 != ""):
                echo'<link rel="stylesheet" href="'. $stylesheetMore2 .'" media="screen"  />';
            endif;
            if( $stylesheetMore3 != ""):
                echo'<link rel="stylesheet" href="'. $stylesheetMore3 .'" media="screen"  />';
            endif;
        ?>
        <!--[if IE 9]><link rel="stylesheet" href="css/ie9.css" type="text/css" media="screen" /><![endif]-->
        <!--[if IE 8]><link rel="stylesheet" href="css/ie8.css" type="text/css" media="screen" /><![endif]-->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    </head>
    
    <body>
        <div id="page">
            
            <!-- ///////////////////////////////////////////////////////////////////
            Phone area (display when you click on the +)
            /////////////////////////////////////////////////////////////////////-->
            <section id="wrapper_phone_area">
                
                <div class="container">
                    <div class="row">
                        <div class="span8 text_shadow">
                            <h4>Welcome to our new website !</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce velit arcu, ornare iaculis accumsan ut, commodo non arcu.
                            Aliquam ac erat tortor. Etiam vulputate vestibulum placerat.
                            </p>
                        </div>
                        <div class="span2 offset2">
                            <div class="pagination-right text_shadow" >
                                <span>Call us !</span>
                                <i class="icon-user icon-white phone_icon"></i>
                                <span><strong>202-456-1414</strong></span>
                                <div class="social_icons">
                                    <div class="pull-right">
                                        <a href="#" rel="tooltip" title="Join us on facebook"><img src="images/icons_social/facebook.png" alt="facebook icon"  height="22" width="22" class="a_social_icon  facebook"></a>
                                        <a href="#" rel="tooltip" title="Follow us on twitter"><img src="images/icons_social/twitter.png" alt="twitter icon" height="22" width="22" class="a_social_icon twitter"></a>
                                        <a href="#" rel="tooltip" title="Join us on google +"><img src="images/icons_social/gplus.png" alt="gplus icon"  height="22" width="22" class="a_social_icon gplus"></a>
                                        <a href="#" rel="tooltip" title="Join us on youtube"><img src="images/icons_social/youtube.png" alt="youtube icon"  height="22" width="22" class="a_social_icon youtube"></a>
                                        <a href="#" rel="tooltip" title="Join us on vimeo"><img src="images/icons_social/vimeo.png" alt="vimeo icon"  height="22" width="22" class="a_social_icon vimeo"></a>
                                        <a href="#" rel="tooltip" title="Subscribe our rss feed"><img src="images/icons_social/rss.png" alt="rss icon"  height="22" width="22" class="a_social_icon rss"></a>
                                        <!-- disabled// choose yours !
                                        <a href="#" title=""><img src="images/icons_social/addthis.png" alt="addthis icon"  height="22" width="22" class="a_social_icon addthis"></a>
                                        <a href="#" rel="tooltip" title="Follow us on behance"><img src="images/icons_social/behance.png" alt="behance icon"  height="22" width="22" class="a_social_icon behance"></a>
                                        <a href="#" rel="tooltip" title="Join us on blogger"><img src="images/icons_social/blogger.png" alt="blogger icon"  height="22" width="22" class="a_social_icon blogger"></a>
                                        <a href="#" rel="tooltip" title="Join us on digg"><img src="images/icons_social/digg.png" alt="digg icon"  height="22" width="22" class="a_social_icon digg"></a>
                                        <a href="#" rel="tooltip" title="Join us on dribbble"><img src="images/icons_social/dribbble.png" alt="dribbble icon"  height="22" width="22" class="a_social_icon dribbble"></a>
                                        <a href="#" rel="tooltip" title="Follow us on flickr"><img src="images/icons_social/flickr.png" alt="flickr icon"  height="22" width="22" class="a_social_icon flickr"></a>
                                        <a href="#" rel="tooltip" title="Join us on instagram"><img src="images/icons_social/instagram.png" alt="instagram icon"  height="22" width="22" class="a_social_icon instagram"></a>
                                        <a href="#" rel="tooltip" title="Join us on lastfm"><img src="images/icons_social/lastfm.png" alt="lastfm icon"  height="22" width="22" class="a_social_icon lastfm"></a>
                                        <a href="#" title=""><img src="images/icons_social/like.png" alt="like icon"  height="22" width="22" class="a_social_icon like"></a>
                                        <a href="#" rel="tooltip" title="Follow us on linkedin"><img src="images/icons_social/linkedin.png" alt="linkedin icon"  height="22" width="22" class="a_social_icon linkedin"></a>
                                        <a href="#" rel="tooltip" title="Join us on livejournal"><img src="images/icons_social/livejournal.png" alt="livejournal icon"  height="22" width="22" class="a_social_icon livejournal"></a>
                                        <a href="#" rel="tooltip" title="Join us on myspace"><img src="images/icons_social/myspace.png" alt="myspace icon"  height="22" width="22" class="a_social_icon myspace"></a>
                                        <a href="#" rel="tooltip" title="Join us on paypal"><img src="images/icons_social/paypal.png" alt="paypal icon"  height="22" width="22" class="a_social_icon paypal"></a>
                                        <a href="#" rel="tooltip" title="Follow us on picasa"><img src="images/icons_social/picasa.png" alt="picasa icon"  height="22" width="22" class="a_social_icon picasa"></a>
                                        <a href="#" rel="tooltip" title="Join us on reddit"><img src="images/icons_social/reddit.png" alt="reddit icon"  height="22" width="22" class="a_social_icon reddit"></a>
                                        <a href="#" rel="tooltip" title="Join us on sharethis"><img src="images/icons_social/sharethis.png" alt="sharethis icon"  height="22" width="22" class="a_social_icon sharethis"></a>
                                        <a href="#" rel="tooltip" title="Follow us on skype"><img src="images/icons_social/skype.png" alt="skype icon"  height="22" width="22" class="a_social_icon skype"></a>
                                        <a href="#" rel="tooltip" title="Join us on spotify"><img src="images/icons_social/spotify.png" alt="spotify icon"  height="22" width="22" class="a_social_icon spotify"></a>
                                        <a href="#" rel="tooltip" title="Join us on stumbleupon"><img src="images/icons_social/stumbleupon.png" alt="stumbleupon icon"  height="22" width="22" class="a_social_icon stumbleupon"></a>
                                        <a href="#" rel="tooltip" title="Join us on tumblr"><img src="images/icons_social/tumblr.png" alt="tumblr icon"  height="22" width="22" class="a_social_icon tumblr"></a>
                                        <a href="#" rel="tooltip" title="Follow us on wordpress"><img src="images/icons_social/wordpress.png" alt="wordpress icon"  height="22" width="22" class="a_social_icon wordpress"></a>
                                        -->
                                    </div>
                                </div><!-- end .social_icons -->
                            </div>
                        </div>
                    </div><!-- end .row -->
                </div><!-- end .container -->
                
            </section><!-- end #wrapper_phone_area -->
            
            
            
            <!-- ///////////////////////////////////////////////////////////////////
            Wrapper top -> Header + Blue area (slider, page name)
            /////////////////////////////////////////////////////////////////////-->
            <section id="wrapper_top">
                
                <div id="shadow_header_container">
                    <!-- // Header (logo + menu) // -->
                    <header>
                        <div class="container">
                            <div class="row hidden-phone">
                                <a href="#" class="show_phone_area center pull-right"></a>
                            </div><!-- end .row -->
                            <div id="logo" class="pull-left">
                                <a href="index.php"><img src="images/logo.png" alt="your logo goes here ! "></a>
                            </div><!-- end #logo -->
                            <nav class="pull-right navmenu">
                                <ul class="unstyled">
                                    <li>
                                        <a href="index.php" class="btn-menu">Home</a>
                                        <div class="submenu">
                                            <ul class="unstyled">
                                                <li><a href="home2.php">Home page 2</a></li>
                                                <li><a href="home3.php">Home page 3</a></li>
                                                <li><a href="home4.php">Home page 4</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="portfolio_4col.php" class="btn-menu">Portfolio</a>
                                        <div class="submenu">
                                            <ul class="unstyled">
                                                <li><a href="portfolio_3col.php">Portfolio 3 columns</a></li>
                                                <li><a href="portfolio_6col.php">Portfolio 6 columns</a></li>
                                                <li><a href="single_project.php">A single project</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="features.php" class="btn-menu">Pages</a>
                                        <div class="submenu">
                                            <ul class="unstyled">
                                                <li><a href="404_error.php">404 error</a></li>
                                                <li><a href="single_page.php">A single page</a></li>
                                                <li><a href="about.php">About</a></li>
                                                <li><a href="faq.php">FAQ</a></li>
                                                <li><a href="sitemap.php">Sitemap</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="blog.php" class="btn-menu">Blog</a>
                                        <div class="submenu">
                                            <ul class="unstyled">
                                                <li><a href="blog_without_sidebar.php">Blog without sidebar</a></li>
                                                <li><a href="single_post.php">Single post</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li><a href="contact.php" class="btn-menu">Contact</a></li>
                                </ul>
                            </nav><!-- end nav -->
                        </div><!-- end .container -->
                    </header><!-- end header -->
                </div><!-- end #shadow_header_container -->