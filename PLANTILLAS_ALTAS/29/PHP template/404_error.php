<?php
/*
 * Just have to fill in the variables and replace the text by yours
 * 
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */

$pageName = "404 error"; // Put here the page name

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
                        <div class="span8 error_404">
                            <h1>404</h1><h2>error: <span>Not found...</span></h2>
                            <p>
                            The page you trying to reach does not exist, or has been removed. Please use the search form below to find what you are looking for.
                            </p>
                            <form class="form-search center m1">
                                <input type="text" class="input-medium search-query">
                                <button type="submit" class="btn">Search</button>
                            </form>
                        </div><!-- end .span8 m1 -->
                        
                        <!-- ///////////////////////////////////////////////////////////////////
                        About us widget
                        /////////////////////////////////////////////////////////////////////-->
                        <div class="span4 ">
                            <div class="heading center">
                                <div class="separation"></div>
                                <h2>About us</h2>
                            </div><!-- end .heading -->
                            <img src="http://placehold.it/80x80" class="pull-left picture_about_us thumbnail" title="image" >
                            <p class="justify">
                            <a href="#" rel="tooltip" title="Sample tooltip">Nulla arcu est</a>, rhoncus eu aliquet ut, commodo et est.
                            Maecenas consectetur velit in nisl aliquam quis auctor nunc molestie.
                            Lorem ipsum dolor sitium ametirte, consectetur adipiscing elit. 
                            </p>
                            <blockquote class="m1">
                                <p>"Lorem ipsum dolor sit amet, consectetur scing elit. Integer posuere erat a ante venenatis."</p>
                                <small>Manager</small>
                            </blockquote>
                            <div class="btn-group">
                                <a href="portfolio_4col.php" class="btn"><i class="icon-briefcase icon_grey "></i> See our work</a>
                                <a href="blog.php" class="btn"><i class="icon-comment icon_grey"></i> See our blog</a>
                                <a href="contact.php" class="btn"><i class="icon-envelope icon_grey"></i> Contact us</a>
                            </div>
                        </div><!-- end .span4 m1 -->
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