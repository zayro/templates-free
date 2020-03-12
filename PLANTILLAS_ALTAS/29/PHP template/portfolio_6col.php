<?php
/*
 * Just have to fill in the variables and replace the text by yours
 * 
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */

$pageName = "Portfolio (6 columns)"; // Put here the page name

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
                        <div class="span12">
                            <div class="heading center m1">
                                <div class="separation"></div>
                                <h2>Our projects</h2>
                            </div><!-- end .heading -->
                            <div class="btn-group pull-left filters">
                                <a href="#" class="btn" data-filter="*"><i class="icon-tags" style="margin-top: 2px"></i></a>
                                <a href="#" class="btn" data-filter=".category_webdesign">Webdesign</a>
                                <a href="#" class="btn" data-filter=".category_print">Print</a>
                                <a href="#" class="btn" data-filter=".category_photography">Photography</a>
                                <a href="#" class="btn" data-filter=".category_marketing">Marketing</a>
                                <a href="#" class="btn" data-filter=".category_seo">SEO</a>
                                <a href="#" class="btn" data-filter=".category_graphic">Graphic</a>
                            </div>
                            <div class="btn-group pull-right filters">
                                <a href="#" class="btn" data-filter="*"><i class="icon-calendar" style="margin-top: 2px"></i></a>
                                <button class="btn dropdown-toggle" data-toggle="dropdown">
                                    Select from a date
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu filters">
                                    <li><a href="#" data-filter=".date_june2012">June 2012</a></li>
                                    <li><a href="#" data-filter=".date_may2012">May 2012</a></li>
                                    <li><a href="#" data-filter=".date_april2012">April 2012</a></li>
                                    <li><a href="#" data-filter=".date_march2012">March 2012</a></li>
                                    <li><a href="#" data-filter=".date_february2012">February 2012</a></li>
                                    <li><a href="#" data-filter=".date_january2012">January 2012</a></li>
                                    <li><a href="#" data-filter=".date_december2011">December 2011</a></li>
                                </ul>
                            </div>
                        </div><!-- end .span12 -->
                        
                        <div class="span12">
                            <div class="row portfolio_container">
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_webdesign category_marketing date_june2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_webdesign date_june2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_photography category_seo date_june2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_webdesign category_marketing date_may2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_graphic date_may2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_marketing category_graphic date_april2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_webdesign date_march2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_graphic category_print date_march2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_webdesign date_march2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_marketing category_print date_february2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_seo date_february2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_webdesign date_january2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_seo category_print date_january2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_graphic date_january2012">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_graphic date_december2011">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_webdesign date_december2011">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_graphic date_december2011">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                                <!-- // A Project // -->
                                <div class="span2">
                                    <div class="viewport thumbnail six_col category_webdesign date_december2011">
                                        <div>
                                            <span class="dark-background"><a href="http://placehold.it/320x240" class="project_glass" rel="prettyPhoto"  title="Your project name" ></a><a href="single_project.php" class="project_link"></a></span>
                                            <img src="http://placehold.it/160x120" alt="" height="120" width="160"/>
                                        </div>
                                    </div><!-- end .viewport -->
                                </div><!-- end .span2 -->
                            </div><!-- end .row -->
                        </div><!-- end .span12 -->
                        
                        <!-- // Pagination // -->
                        <div class="span12 m2">
                            <div class="btn-group portfolio_pagination">
                                <a href="#" class="btn">«</a>
                                <a href="#" class="btn">1</a>
                                <a href="#" class="btn">2</a>
                                <a href="#" class="btn">3</a>
                                <a href="#" class="btn">4</a>
                                <a href="#" class="btn">»</a>
                            </div>
                        </div><!-- end .span12 -->
                        
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