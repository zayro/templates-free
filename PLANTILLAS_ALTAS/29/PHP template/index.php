<?php
/*
 * Just have to fill in the variables and replace the text by yours
 * 
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */

$pageName = "mafiashare.net - FREE THEMES & TEMPLATES"; // Put here the page name

/*
 * For the SEO
 */
$pageDescription = ""; //Decription of the page
$pageKeywords = ""; //Keywords should all be in lowercase and separated by commas. 
/*
 * If you want to add a stylesheet or javascript file, declare them here (just the path)
 * (Example -> In the home page there is a slider who is working with style_slider.css and sequence.jquery-min.js, but you find a slider just into the home page so not necessary 
 * to add the files in header.php or footer.php because they will be loaded in each page and it is unnecessary...If you don't understand go to contact.php and see) 
 */
$stylesheetMore1 = ""; // Ex: styles/yourfile.css
$stylesheetMore2 = ""; // Ex: styles/yourfile.css
$stylesheetMore3 = ""; // Ex: styles/yourfile.css
$javascriptMore1 = ""; // Ex: js/yourfile.js 
$javascriptMore2 = ""; // Ex: js/yourfile.js 
$javascriptMore3 = ""; // Ex: js/yourfile.js 
?>             
<?php 
/*
 * *****************************************************************************
 * HEADER
 * *****************************************************************************
 */
?>   
<?php include('includes/header.php'); ?>
<?php 
/*
 * *****************************************************************************
 * SlIDER (only home page)
 * *****************************************************************************
 */
?>
                <section id="wrapper_slider" class="container">
                    <div class="row">
						<!-- // Say Welcome !// -->
                        <div class="span12 text_shadow center">
                            <h1 class="center">Welcome !</h1>
                            <p class="m1" id="showing">Here you can write a message to introduce yourself.<br /> Lorem ipsum dolor sit amet,
                               consectetur adipiscing elit. Nullam condimentum arcu vel odio elementum rutrum.
                               Nam sed orci quam, eu dictum lectus. Nullam id dolor et metus pulvinar dictum.</p>
                        </div><!-- end .span12 -->
						<div class="span12 text_shadow center">
                            <div class="row hidden-phone">
								<!-- // To place icons with details in relation to the arrows, moves directly into the tags -> Style="..."// -->
								<div class="span1 offset2 center">
									   <img src="images/icons/favorite_white.png" title="home_icon" class="showing_icons">
								</div>
								<div class="span1 offset1 center">
									   <img src="images/icons/shopping_white.png" title="home_icon" style="margin-right: -25px;"  class="showing_icons" >
								</div>
								<div class="span1 offset2 center">
									   <img src="images/icons/bulb_white.png" title="home_icon" style="margin-left: -25px;" class="showing_icons">
								</div>
								<div class="span1 offset1 center">
									   <img src="images/icons/comments_white.png" title="home_icon" style="margin-left: -25px;" class="showing_icons">
								</div>
                            </div><!-- end .row -->
                        </div><!-- end .span12 -->
                        <div class="span3 center" id="extrem_left">
                            <div class="home_button_bg">
                               <a href="home3.html" class="btn btn-large"><i class="icon-picture icon_grey"></i> View Home with slider</a>
                            </div><!-- end .button_bg -->
                        </div><!-- end .span3 -->
                        <div class="span3 center" id="left">
                            <div class="home_button_bg">
                               <a href="portfolio_4col.html" class="btn btn-large"><i class="icon-briefcase icon_grey"></i> Look at our work</a>
                            </div><!-- end .button_bg -->
                        </div><!-- end .span3 -->
                        <div class="span3 center" id="right">
                            <div class="home_button_bg">
                               <a href="blog.html" class="btn btn-large"><i class="icon-comment icon_grey"></i> What we think</a>
                            </div><!-- end .button_bg -->
                        </div><!-- end .span3 -->
                        <div class="span3 center" id="extrem_right">
                            <div class="home_button_bg">
                               <a href="contact.html" class="btn btn-large"><i class="icon-heart icon_grey"></i> Let's get closer</a>
                            </div><!-- end .button_bg -->
                        </div><!-- end .span3 -->
                    </div><!-- end .row -->
                </section><!-- end #wrapper_slider -->
                
            </section><!-- end #wrapper_top -->

<?php 
/*
 * *****************************************************************************
 * QUOTES AREA (only home page)
 * *****************************************************************************
 */
?>
            <section id="wrapper_quotes_area">
                
                <div id="quotes_area" class="container">
                    <div class="quotes_slides_container">
                        <!-- // A quote // -->
                        <div class="quote_slide span12">
                            <cite>‘‘A great slider for a quote, a testimony or just a message’’</cite>
                            <span>Quisque et leo in est facilisis pharetra.</span>
                        </div>
                        
                        <!-- // A quote // -->
                        <div class="quote_slide span12">
                            <cite>‘‘Nam nec orci metus, eget auctor justo.’’</cite>
                            <span>Sed vulputate.</span>
                        </div>
                        
                        <!-- // A quote // -->
                        <div class="quote_slide span12">
                            <cite>‘‘Morbi a dui in libero facilisis egestas ut vel felis.’’</cite>
                            <span>Etiam vel erat id.</span>
                        </div>
                    </div>
                </div><!-- end #quotes_area -->
                
            </section><!-- end #wrapper_quotes_area -->
<?php 
/*
 * *****************************************************************************
 * CONTAINER (different for each pages)
 * *****************************************************************************
 */
?>   
            
            <!-- ///////////////////////////////////////////////////////////////////
            Main container
            /////////////////////////////////////////////////////////////////////-->
            <section id="wrapper_main_container">
                
                <div id="main_container" class="container">
                    <div class="row">
                        <!-- // A Feature // -->
                        <div class="span3 m1  center">
                            <img src="images/icons/pencil.png" title="home_icon_1" class="icon_grey feature_icon" >
                            <div class="heading">
                                <div class="separation"></div>
                                <h2>Customization</h2>
                            </div><!-- end .heading -->
                            <p>Change the color of the entire template in 1 min (see doc), remove the sliders and add them elsewhere! anything is possible.</p>
                            <a class="btn btn-more" href="features.php">Read more <span class="more_icon">+</span></a>
                        </div><!-- end .span3 m1 -->
                        
                        <!-- // A Feature // -->
                        <div class="span3 m1 center">
                            <img src="images/icons/globe.png" title="home_icon_2" class="icon_grey feature_icon" >
                            <div class="heading">
                                <div class="separation"></div>
                                <h2>Compatibility</h2>
                            </div><!-- end .heading -->
                            <p>Compatible with all browsers & 100% Responsive therefore compatible with mobiles and tablets.</p>
                            <a class="btn btn-more" href="features.php">Read more <span class="more_icon">+</span></a>
                        </div><!-- end .span3 m1 -->
                        
                        <!-- // A Feature // -->
                        <div class="span3 m1 center">
                            <img src="images/icons/bulb.png" title="home_icon_3" class="icon_grey feature_icon" >
                            <div class="heading">
                                <div class="separation"></div>
                                <h2>Tailored For Your Needs</h2>
                            </div><!-- end .heading -->
                            <p>A contact page, a portfolio, a blog, a documentation ... All essential pages you need are there.</p>
                            <a class="btn btn-more" href="features.php">Read more <span class="more_icon">+</span></a>
                        </div><!-- end .span3 m1 -->
                        
                        <!-- // A Feature // -->
                        <div class="span3 m1 center">
                            <img src="images/icons/settings.png" title="home_icon_5" class="icon_grey feature_icon" >
                            <div class="heading">
                                <div class="separation"></div>
                                <h2>Built with Bootstrap</h2>
                            </div><!-- end .heading -->
                            <p>Thanks to Bootstrap this template has a huge possibility to create and safe bases (responsive, scaffolding).</p>
                            <a class="btn btn-more" href="features.php">Read more <span class="more_icon">+</span></a>
                        </div><!-- end .span3 m1 -->
                    </div><!-- end .row -->
                    
                    <div class="row">
                        <!-- // Last projects box // -->
                        <?php include('includes/slider_last_projects.php'); ?>
                        
                        <!-- // Arrow up // -->
                        <div id="scroll_top" class="span12 ">
                            <a href="#container_header" class="scroll_top_a" rel="tooltip" title="Go to the top !"><img src="images/scroll_top_bg.png" alt="Go to the top"></a>
                        </div><!-- end #scroll_top -->
                    </div><!-- end .row -->
                </div><!-- end #main_container -->

<?php 
/*
 * *****************************************************************************
 * FOOTER
 * *****************************************************************************
 */
?>                  
<?php include('includes/footer.php'); ?>