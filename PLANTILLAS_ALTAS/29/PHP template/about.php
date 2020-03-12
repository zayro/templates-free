<?php
/*
 * Just have to fill in the variables and replace the text by yours
 * 
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */

$pageName = "About us"; // Put here the page name

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
                        <div class="span6">
                            <div class="heading center">
                                <div class="separation"></div>
                                <h2>Who we are ?</h2>
                            </div><!-- end .heading -->
                            <img src="http://placehold.it/140x140" alt="http://placehold.it/" class="pull-left picture_about_us thumbnail">
                            <p class="justify text_about_us">
                                Nulla arcu est, rhoncus eu aliquet ut, commodo et est.
                                Maecenas consectetur velit in nisl aliquam quis auctor nunc molestie.
                                Lorem ipsum dolor sitium ametirte, consectetur adipiscing elit.
                                Nulla arcu est, rhoncus eu aliquet ut, commodo et est.
                                Maecenas consectetur velit in nisl aliquam quis auctor nunc molestie.
                                Lorem ipsum dolor sitium ametirte, consectetur adipiscing elit.
                                Nulla arcu est, rhoncus eu aliquet ut, commodo et est.
                                Maecenas consectetur velit in nisl aliquam quis auctor nunc molestie.
                                Lorem ipsum dolor sitium ametirte, consectetur adipiscing elit.
                                Nulla arcu est, rhoncus eu aliquet ut, commodo et est.
                                Maecenas consectetur velit in nisl aliquam quis auctor nunc molestie.
                                Lorem ipsum dolor sitium ametirte, consectetur adipiscing elit.
                                Nulla arcu est, rhoncus eu aliquet ut, commodo et est.
                                Maecenas consectetur velit in nisl aliquam quis auctor nunc molestie.
                                Lorem ipsum dolor sitium ametirte, consectetur adipiscing elit.
                            </p>
                            <div class="btn-group">
                                <a href="portfolio_4col.php" class="btn"><i class="icon-briefcase icon_grey"></i> See our work</a>
                                <a href="blog.php" class="btn"><i class="icon-comment icon_grey"></i> See our blog</a>
                                <a href="contact.php" class="btn"><i class="icon-envelope icon_grey"></i> Contact us</a>
                            </div>
                        </div><!-- end .span6 -->
                        
                        <!-- ///////////////////////////////////////////////////////////////////
                        Skills
                        /////////////////////////////////////////////////////////////////////-->
                        <div class="span6">
                            <div class="heading center">
                                <div class="separation"></div>
                                <h2>What we do ?</h2>
                            </div><!-- end .heading -->
                            <h5>Webdesign</h5>
                            <div class="progress progress-striped active">
                                <div class="bar" style="width: 90%;"></div>
                            </div>
                            <h5>Print</h5>
                            <div class="progress progress-striped active">
                                <div class="bar" style="width: 10%;"></div>
                            </div>
                            <h5>Photography</h5>
                            <div class="progress progress-striped active">
                                <div class="bar" style="width: 60%;"></div>
                            </div>
                            <h5>Marketing</h5>
                            <div class="progress progress-striped active">
                                <div class="bar" style="width: 60%;"></div>
                            </div>
                            <h5>SEO</h5>
                            <div class="progress progress-striped active">
                                <div class="bar" style="width: 100%;"></div>
                            </div>
                            <h5>Graphic</h5>
                            <div class="progress progress-striped active">
                                <div class="bar" style="width: 70%;"></div>
                            </div>
                        </div><!-- end .span6 -->
                        
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