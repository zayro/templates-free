<?php
/*
 * Just have to fill in the variables and replace the text by yours
 * 
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */

$pageName = "FAQ's"; // Put here the page name

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
                                <div class="accordion" id="accordion2">
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne">
                                                <i class="icon-plus icon_grey"></i> Question #1
                                            </a>
                                        </div>
                                        <div id="collapseOne" class="accordion-body collapse in">
                                            <div class="accordion-inner">
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porttitor, lorem a iaculis scelerisque,
                                                erat tortor cursus nisi, in gravida enim leo sed leo. Donec erat dui, 
                                                tristique id commodo a, condimentum sit amet mi. Ut quis pulvinar turpis. Nulla iaculis placerat lacinia. In mattis luctus elit nec feugiat.
                                            </div>
                                        </div>
                                    </div><!-- end .accordion-group -->

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo">
                                                <i class="icon-plus icon_grey"></i> Question #2
                                            </a>
                                        </div>
                                        <div id="collapseTwo" class="accordion-body collapse in">
                                            <div class="accordion-inner">
                                                Donec eu auctor felis. In vel feugiat sapien. Vivamus at ante eget dui semper aliquam ut quis eros. In dapibus,
                                                sem et egestas consectetur, odio libero hendrerit felis, ac vehicula dui lectus ut nisl. Nunc vitae felis cursus est mattis hendrerit.
                                                Integer ornare pulvinar magna nec scelerisque. Nunc interdum quam vitae nisi suscipit luctus. In hac habitasse platea dictumst.
                                                Etiam posuere, nibh non molestie volutpat, nisi enim varius risus, id blandit justo metus id neque. Duis nec sem ligula.
                                                Etiam massa est, laoreet quis auctor eu, ultrices nec dolor.
                                            </div>
                                        </div>
                                    </div><!-- end .accordion-group -->

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree">
                                                <i class="icon-plus icon_grey"></i> Question #3
                                            </a>
                                        </div>
                                        <div id="collapseThree" class="accordion-body collapse in">
                                            <div class="accordion-inner">
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porttitor, lorem a iaculis scelerisque,
                                                erat tortor cursus nisi, in gravida enim leo sed leo. Donec erat dui, 
                                                tristique id commodo a, condimentum sit amet mi. Ut quis pulvinar turpis. Nulla iaculis placerat lacinia. In mattis luctus elit nec feugiat.
                                            </div>
                                        </div>
                                    </div><!-- end .accordion-group -->

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFour">
                                                <i class="icon-plus icon_grey"></i> Question #4
                                            </a>
                                        </div>
                                        <div id="collapseFour" class="accordion-body collapse in">
                                            <div class="accordion-inner">
                                                Donec eu auctor felis. In vel feugiat sapien. Vivamus at ante eget dui semper aliquam ut quis eros. In dapibus,
                                                sem et egestas consectetur, odio libero hendrerit felis, ac vehicula dui lectus ut nisl. Nunc vitae felis cursus est mattis hendrerit.
                                                Integer ornare pulvinar magna nec scelerisque. Nunc interdum quam vitae nisi suscipit luctus. In hac habitasse platea dictumst.
                                                Etiam posuere, nibh non molestie volutpat, nisi enim varius risus, id blandit justo metus id neque. Duis nec sem ligula.
                                                Etiam massa est, laoreet quis auctor eu, ultrices nec dolor.
                                            </div>
                                        </div>
                                    </div><!-- end .accordion-group -->

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFive">
                                                <i class="icon-plus icon_grey"></i> Question #5
                                            </a>
                                        </div>
                                        <div id="collapseFive" class="accordion-body collapse in">
                                            <div class="accordion-inner">
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porttitor, lorem a iaculis scelerisque,
                                                erat tortor cursus nisi, in gravida enim leo sed leo. Donec erat dui, 
                                                tristique id commodo a, condimentum sit amet mi. Ut quis pulvinar turpis. Nulla iaculis placerat lacinia. In mattis luctus elit nec feugiat.
                                            </div>
                                        </div>
                                    </div><!-- end .accordion-group -->

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseSix">
                                                <i class="icon-plus icon_grey"></i> Question #6
                                            </a>
                                        </div>
                                        <div id="collapseSix" class="accordion-body collapse in">
                                            <div class="accordion-inner">
                                                Donec eu auctor felis. In vel feugiat sapien. Vivamus at ante eget dui semper aliquam ut quis eros. In dapibus,
                                                sem et egestas consectetur, odio libero hendrerit felis, ac vehicula dui lectus ut nisl. Nunc vitae felis cursus est mattis hendrerit.
                                                Integer ornare pulvinar magna nec scelerisque. Nunc interdum quam vitae nisi suscipit luctus. In hac habitasse platea dictumst.
                                                Etiam posuere, nibh non molestie volutpat, nisi enim varius risus, id blandit justo metus id neque. Duis nec sem ligula.
                                                Etiam massa est, laoreet quis auctor eu, ultrices nec dolor.
                                            </div>
                                        </div>
                                    </div><!-- end .accordion-group -->

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseSeven">
                                                <i class="icon-plus icon_grey"></i> Question #7
                                            </a>
                                        </div>
                                        <div id="collapseSeven" class="accordion-body collapse in">
                                            <div class="accordion-inner">
                                                Donec eu auctor felis. In vel feugiat sapien. Vivamus at ante eget dui semper aliquam ut quis eros. In dapibus,
                                                sem et egestas consectetur, odio libero hendrerit felis, ac vehicula dui lectus ut nisl. Nunc vitae felis cursus est mattis hendrerit.
                                                Integer ornare pulvinar magna nec scelerisque. Nunc interdum quam vitae nisi suscipit luctus. In hac habitasse platea dictumst.
                                                Etiam posuere, nibh non molestie volutpat, nisi enim varius risus, id blandit justo metus id neque. Duis nec sem ligula.
                                                Etiam massa est, laoreet quis auctor eu, ultrices nec dolor.
                                            </div>
                                        </div>
                                    </div><!-- end .accordion-group -->

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseHeight">
                                                <i class="icon-plus icon_grey"></i> Question #8
                                            </a>
                                        </div>
                                        <div id="collapseHeight" class="accordion-body collapse in">
                                            <div class="accordion-inner">
                                                Donec eu auctor felis. In vel feugiat sapien. Vivamus at ante eget dui semper aliquam ut quis eros. In dapibus,
                                                sem et egestas consectetur, odio libero hendrerit felis, ac vehicula dui lectus ut nisl. Nunc vitae felis cursus est mattis hendrerit.
                                                Integer ornare pulvinar magna nec scelerisque. Nunc interdum quam vitae nisi suscipit luctus. In hac habitasse platea dictumst.
                                                Etiam posuere, nibh non molestie volutpat, nisi enim varius risus, id blandit justo metus id neque. Duis nec sem ligula.
                                                Etiam massa est, laoreet quis auctor eu, ultrices nec dolor.
                                            </div>
                                        </div>
                                    </div><!-- end .accordion-group -->

                                </div><!-- end .accordion -->
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