<?php
/*
 * Just have to fill in the variables and replace the text by yours
 * 
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */

$pageName = "Welcome !"; // Put here the page name

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
 * TOP OF THE PAGE (TITLE + BREADCRUMB)
 * *****************************************************************************
 */
?>
                <!-- // Big area for the slider or the page name// -->
                <section id="wrapper_slider" class="container">
                    <h2 class="page_name text_shadow"><?php echo $pageName; ?></h2>
                    <h3 class="breadcrumb text_shadow"></h3>
                </section><!-- end #wrapper_slider -->
                
            </section><!-- end #wrapper_top -->
            
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