<?php
/*
 * Just have to fill in the variables and replace the text by yours
 * 
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */

$pageName = "Home page"; // Put here the page name

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
$stylesheetMore1 = "css/style_slider.css"; // Ex: styles/yourfile.css
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
                    <?php include('includes/slider_2.php'); ?>
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
                        <!-- // About us box // -->
                        <div class="span4 m1  ">
                            <div class="heading center">
                                <div class="separation"></div>
                                <h2>About us</h2>
                            </div><!-- end .heading -->
                            <img src="http://placehold.it/90x90" alt="http://placehold.it/" class="pull-left picture_about_us thumbnail">
                            <p class="justify text_about_us">
                            <a href="#" rel="tooltip" title="Sample tooltip">Nulla arcu est</a>, rhoncus eu aliquet ut, commodo et est.
                            Maecenas consectetur velit in nisl aliquam quis auctor nunc molestie.
                            Lorem ipsum dolor sitium ametirte, consectetur adipiscing elit.
                            </p>
                            <blockquote>
                                <p>"Lorem ipsum dolor sit amet, consectetur scing elit. Integer posuere erat a ante venenatis."</p>
                                <small>Manager</small>
                            </blockquote>
                            <div class="btn-group">
                                <a href="portfolio.php" class="btn"><i class="icon-briefcase icon_grey"></i> See our work</a>
                                <a href="blog.php" class="btn"><i class="icon-comment icon_grey"></i> See our blog</a>
                                <a href="contact.php" class="btn"><i class="icon-envelope icon_grey"></i> Contact us</a>
                            </div>
                        </div><!-- end .span4 m1 -->

                        <!-- // Tables pricing box // -->
                        <div class="span8 m1 ">
                            <div class="heading center">
                                <div class="separation"></div>
                                <h2>Our prices</h2>
                            </div><!-- end .heading -->
                            <div class="row">
                                <div id="tables_pricing">
                                    <!-- // A table // -->
                                    <div class="wrapper_table_pricing span2 ">
                                        <div class="table_pricing center">
                                            <h3>Free</h3>
                                            <div class="separation"></div>
                                            <ul>
                                                <li class="ready"><a href="#" rel="tooltip" title="Add here the features for example">Blog</a></li>
                                                <li>-</li>
                                                <li>-</li>
                                                <li>-</li>
                                                <li>-</li>
                                            </ul>
                                            <h1 class="price">0$</h1>
                                        </div><!-- end .table_pricing -->
                                    </div><!-- end .wrapper_table_pricing -->
                                    <!-- // A table // -->
                                    <div class="wrapper_table_pricing span2">
                                        <div class="table_pricing center">
                                            <h3>Starter</h3>
                                            <div class="separation"></div>
                                            <ul>
                                                <li class="ready"><a href="#" rel="tooltip" title="Add here the features for example">Blog</a></li>
                                                <li>-</li>
                                                <li class="ready"><a href="#" rel="tooltip" title="Add here the features for example">Contact form</a></li>
                                                <li>-</li>
                                                <li>-</li>
                                            </ul>
                                            <h1 class="price">25$</h1>
                                        </div><!-- end .table_pricing -->
                                    </div><!-- end .wrapper_table_pricing -->
                                    <!-- // A table // -->
                                    <div class="wrapper_table_pricing span2">
                                        <div class="table_pricing center">
                                            <h3>Plus</h3>
                                            <div class="separation"></div>
                                            <ul>
                                                <li class="ready"><a href="#" rel="tooltip" title="Add here the features for example">Blog</a></li>
                                                <li class="ready"><a href="#" rel="tooltip" title="Add here the features for example">Portfolio</a></li>
                                                <li class="ready"><a href="#" rel="tooltip" title="Add here the features for example">Contact form</a></li>
                                                <li>-</li>
                                                <li>-</li>
                                            </ul>
                                            <h1 class="price">59$</h1>
                                        </div><!-- end .table_pricing -->
                                    </div><!-- end .wrapper_table_pricing -->
                                    <!-- // A table // -->
                                    <div class="wrapper_table_pricing span2">
                                        <div class="table_pricing center">
                                            <h3>Prenium</h3>
                                            <div class="separation"></div>
                                            <ul>
                                                <li class="ready"><a href="#" rel="tooltip" title="Add here the features for example">Blog</a></li>
                                                <li class="ready"><a href="#" rel="tooltip" title="Add here the features for example">Portfolio</a></li>
                                                <li class="ready"><a href="#" rel="tooltip" title="Add here the features for example">Contact form</a></li>
                                                <li class="ready"><a href="#" rel="tooltip" title="Add here the features for example">Forum</a></li>
                                                <li class="ready"><a href="#" rel="tooltip" title="Add here the features for example">Store</a></li>
                                            </ul>
                                            <h1 class="price">99$</h1>
                                        </div><!-- end .table_pricing -->
                                    </div><!-- end .wrapper_table_pricing -->
                                </div><!-- end #tables_pricing -->
                            </div>
                            <a class="btn btn-more pull-right" href="#">Read more <span class="more_icon">+</span></a>
                        </div><!-- end .span8 -->
                    </div><!-- end .row -->
                        
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