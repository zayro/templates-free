<?php
/*
 * Just have to fill in the variables and replace the text by yours
 * 
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */

$pageName = "Single project"; // Put here the page name

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
                        <div class="span4 m1">
                            <a href="http://placehold.it/720x400" rel="prettyPhoto" class="thumbnail"><img src="http://placehold.it/360x200" alt="a project"></a>
                        </div><!-- end .span4 -->
                        <div class="span8 m1">
                            <p class="justify">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum dignissim erat, a lacinia enim accumsan eget. 
                                Etiam tristique felis a erat blandit malesuada. Mauris placerat consequat nisl in mattis. Nulla accumsan porttitor quam vel rhoncus. 
                                Integer sem odio, ullamcorper non porta sed, porta sit amet risus. Fusce in lacus nec velit dictum posuere. 
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum dignissim erat, a lacinia enim accumsan eget. 
                                Etiam tristique felis a erat blandit malesuada. Mauris placerat consequat nisl in mattis. Nulla accumsan porttitor quam vel rhoncus. 
                                Integer sem odio, ullamcorper non porta sed, porta sit amet risus. Fusce in lacus nec velit dictum posuere. 
                                 Nam elementum dignissim erat, a lacinia enim accumsan eget.
                            </p>
                            <div class="btn-toolbar m1">
                                <div class="btn-group">
                                    <a href="#" class="btn"><i class="icon-tags" style="margin-top: 2px"></i></a>
                                    <a href="#" class="btn">Webdesign</a>
                                </div>
                                <br />
                                <div class="btn-group">
                                    <a href="#" class="btn"><i class="icon-calendar" style="margin-top: 2px"></i></a>
                                    <a class="btn" href="#">June 2012</a>
                                </div>
                            </div><!-- end .btn-toolbar --> 
                        </div><!-- end .span8 -->
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