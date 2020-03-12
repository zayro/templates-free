<?php
/*
 * Just have to fill in the variables and replace the text by yours
 * 
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */

$pageName = "Sitemap"; // Put here the page name

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
                    <h3 class="breadcrumb text_shadow">Home / <?php echo $pageName; ?></h3>
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
                        <div class="span4">
                            <div class="heading center">
                                <div class="separation"></div>
                                <h2>Pages list</h2>
                            </div><!-- end .heading -->
                            <ul class="list">
                                <li>
                                    <a href="index.php" class="btn-menu">Home page</a>
                                    <ul>
                                        <li><a href="home2.php">Home page 2</a></li>
                                        <li><a href="home3.php">Home page 3</a></li>
                                        <li><a href="home4.php">Home page 4</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="portfolio_4col.php" class="btn-menu">Portfolio</a>
                                    <ul>
                                        <li><a href="portfolio_3col.php">Portfolio 3 columns</a></li>
                                        <li><a href="portfolio_6col.php">Portfolio 6 columns</a></li>
                                        <li><a href="single_project.php">A single project</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="features.php" class="btn-menu">Pages</a>
                                    <ul>
                                        <li><a href="404_error.php">404 error</a></li>
                                        <li><a href="single_page.php">A single page</a></li>
                                        <li><a href="about.php">About</a></li>
                                        <li><a href="faq.php">FAQ</a></li>
                                        <li><a href="sitemap.php">Sitemap</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="blog.php" class="btn-menu">Blog</a>
                                    <ul>
                                        <li><a href="blog_without_sidebar.php">Blog without sidebar</a></li>
                                        <li><a href="single_post.php">Single post</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.php" class="btn-menu">Contact</a></li>
                            </ul>
                        </div><!-- end .span4 -->
                        
                        <div class="span4">
                            <div class="heading center">
                                <div class="separation"></div>
                                <h2>Blog archives</h2>
                            </div><!-- end .heading -->
                            <ul class="list">
                                <li><a href="blog.php" class="btn-menu">June 2012 (12)</a></li>
                                <li><a href="blog.php" class="btn-menu m1">May 2012 (19)</a></li>
                                <li><a href="blog.php" class="btn-menu m1">April 2012 (12)</a></li>
                                <li><a href="blog.php" class="btn-menu m1">March 2012 (6)</a></li>
                                <li><a href="blog.php" class="btn-menu m1">February 2012 (13)</a></li>
                                <li><a href="blog.php" class="btn-menu m1">January 2012 (1)</a></li>
                                <li><a href="blog.php" class="btn-menu m1">December 2011 (22)</a></li>
                                <li><a href="blog.php" class="btn-menu m1">November 2011 (17)</a></li>
                                <li><a href="blog.php" class="btn-menu m1">October 2011 (5)</a></li>
                                <li><a href="blog.php" class="btn-menu m1">September 2011 (2)</a></li>
                            </ul>
                        </div><!-- end .span4 -->
                        
                        <div class="span4">
                            <div class="heading center">
                                <div class="separation"></div>
                                <h2>Portfolio archives</h2>
                            </div><!-- end .heading -->
                            <ul class="list">
                                <li><a href="portfolio_4col.php" class="btn-menu">June 2012 (2)</a></li>
                                <li><a href="portfolio_4col.php" class="btn-menu m1">May 2012 (17)</a></li>
                                <li><a href="portfolio_4col.php" class="btn-menu m1">April 2012 (15)</a></li>
                                <li><a href="portfolio_4col.php" class="btn-menu m1">March 2012 (4)</a></li>
                                <li><a href="portfolio_4col.php" class="btn-menu m1">February 2012 (11)</a></li>
                                <li><a href="portfolio_4col.php" class="btn-menu m1">January 2012 (1)</a></li>
                                <li><a href="portfolio_4col.php" class="btn-menu m1">December 2011 (4)</a></li>
                                <li><a href="portfolio_4col.php" class="btn-menu m1">November 2011 (18)</a></li>
                                <li><a href="portfolio_4col.php" class="btn-menu m1">October 2011 (23)</a></li>
                                <li><a href="portfolio_4col.php" class="btn-menu m1">September 2011 (46)</a></li>
                            </ul>
                        </div><!-- end .span4 -->
                        
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