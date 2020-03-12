<?php
/*
 * Just have to fill in the variables and replace the text by yours
 * 
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */

$pageName = "Single Post"; // Put here the page name

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
                        <div class="span9">
                            <!-- ///////////////////////////////////////////////////////////////////
                            The Post
                            /////////////////////////////////////////////////////////////////////-->
                            <article>
                                <div class="time">
                                    <p class="text_shadow"><span class="date_d">25</span><br />
                                    June<br />
                                    2012</p>
                                </div><!-- end .time -->
                                
                                <div class="heading center">
                                    <div class="separation"></div>
                                    <h2>Just a post</h2>
                                </div><!-- end .heading -->
                                
                                <img src="http://placehold.it/870x180" alt="http://placehold.it/" class="thumbnail">
                                
                                <h4 class="m1">Lorem Ipsum</h4>
                                <p class="justify ">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum dignissim erat, a lacinia enim accumsan eget. 
                                    Etiam tristique felis a erat blandit malesuada. Mauris placerat consequat nisl in mattis. Nulla accumsan porttitor quam vel rhoncus. 
                                    Integer sem odio, ullamcorper non porta sed, porta sit amet risus. Fusce in lacus nec velit dictum posuere at ac augue. 
                                    Cras id sem a ante sagittis pellentesque non id neque. Maecenas erat nulla, molestie a tristique eu, dapibus at eros. 
                                    Aliquam feugiat nibh in augue interdum tempus. Cras mollis sapien eu dolor scelerisque sit amet egestas mauris volutpat. 
                                    Sed vitae tempor nibh. Praesent nunc lectus, tempor eu pretium eget, lobortis nec tortor Nunc porttitor tincidunt ligula, 
                                    nec feugiat dolor ullamcorper non. Vivamus massa orci, ultrices sit amet malesuada ut, congue venenatis ante. 
                                    Quisque sit amet nisi dolor, vitae malesuada turpis. Suspendisse in tellus risus, nec pellentesque ligula. <br />
                                    <span class="label label-info">Integer sem odio !</span></p>
                                <h4 class="m1">Vivamus massa :</h4>
                                <div class="progress progress-striped active">
                                <div class="bar"
                                    style="width: 40%;"></div>
                                </div>
                                <p>
                                    Nam ac dignissim nisl. Nulla nulla eros, varius id tincidunt sed, bibendum nec est. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; 
                                    In hac habitasse platea dictumst. Suspendisse potenti. Nullam congue enim purus. Proin est tellus, gravida eu rhoncus:
                                </p>
                                <ul class="list">
                                    <li>Ut tincidunt massa et mauris tincidunt convallis.</li>
                                    <li>Curabitur eu eros in justo aliquam interdum et a erat.</li>
                                    <li>Donec auctor ante at tellus placerat malesuada.</li>
                                    <li>Phasellus molestie vulputate mauris, a rhoncus nisi viverra a.</li>
                                </ul>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in tellus feugiat lorem feugiat consectetur. 
                                    Fusce tristique mi ac risus bibendum faucibus. Donec turpis risus, pharetra sed hendrerit vel, egestas in augue.
                                    Praesent eget lacus felis, sit amet aliquam enim. Aenean diam est, ullamcorper non porttitor non, feugiat vitae quam.
                                    Ut dictum ullamcorper lectus nec placerat. Donec ut quam id nulla ornare pellentesque. Class aptent taciti sociosqu ad litora torquent per conubia nostra,
                                    per inceptos himenaeos.

                                    Sed nec neque erat, sit amet volutpat orci. Mauris convallis venenatis leo quis vestibulum. Aenean ut neque ac neque sagittis auctor. 
                                    Morbi turpis est, feugiat a ultricies sed, gravida quis libero. In hac habitasse platea dictumst. Aliquam sodales sodales quam, 
                                    non imperdiet nisl egestas sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec arcu orci, 
                                    porttitor quis pellentesque at, pretium eu dolor. Vivamus quis fermentum tortor. Etiam iaculis blandit lorem,
                                    ut consequat mauris vulputate vitae.
                                    
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in tellus feugiat lorem feugiat consectetur. 
                                    Fusce tristique mi ac risus bibendum faucibus. Donec turpis risus, pharetra sed hendrerit vel, egestas in augue.
                                    Praesent eget lacus felis, sit amet aliquam enim. Aenean diam est, ullamcorper non porttitor non, feugiat vitae quam.
                                    Ut dictum ullamcorper lectus nec placerat. Donec ut quam id nulla ornare pellentesque. Class aptent taciti sociosqu ad litora torquent per conubia nostra,
                                    per inceptos himenaeos.
                                    
                                    Sed nec neque erat, sit amet volutpat orci. Mauris convallis venenatis leo quis vestibulum. Aenean ut neque ac neque sagittis auctor. 
                                    Morbi turpis est, feugiat a ultricies sed, gravida quis libero. In hac habitasse platea dictumst. Aliquam sodales sodales quam, 
                                    non imperdiet nisl egestas sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec arcu orci, 
                                    porttitor quis pellentesque at, pretium eu dolor. Vivamus quis fermentum tortor. Etiam iaculis blandit lorem,
                                    ut consequat mauris vulputate vitae.
                                </p>
                                <a href="#" class="btn btn-success"><i class="icon-download icon-white"></i> Download</a>
                            </article>
                            
                            <!-- // Author info // -->
                            <div class="well m2">
                                <h4>About the author: Admin</h4>
                                <div class="m1">
                                    <img src="http://placehold.it/80x80" class=" thumbnail author_thumbnail pull-left" title="image" >
                                    <p>Fusce viverra nunc sed metus gravida vel feugiat magna elementum. Nulla ligula nisl, semper a condimentum sed, venenatis at sem. Nullam sodales faucibus congue.
                                        Proin ornare ornare orci nec sagittis. Morbi tincidunt ultrices nibh, ut consequat dui viverra id. Phasellus vel volutpat metus.</p> 
                                    <a class="btn btn-more pull-right" href="about.php">Read more <span class="more_icon">+</span></a>
                                </div>
                            </div><br />
                            
                            
                            <!-- ///////////////////////////////////////////////////////////////////
                            Comments
                            /////////////////////////////////////////////////////////////////////-->
                            <div class="heading center m2">
                                <div class="separation"></div>
                                <h2>5 comments</h2>
                            </div><!-- end .heading -->
                            <ul class="unstyled">
                                <!-- // A Comment // -->
                                <li>
                                    <div class="well">
                                        <img src="http://placehold.it/48x48" class=" thumbnail author_thumbnail pull-left" title="default image" >
                                        <span><strong>Jhon Doe</strong></span><span class="pull-right">JUNE 20, 2012 AT 11:01</span>
                                        <p>Fusce viverra nunc sed metus gravida vel feugiat magna elementum. Nulla ligula nisl, semper a condimentum sed, venenatis at sem. Nullam sodales faucibus congue.
                                        Proin ornare ornare orci nec sagittis. Morbi tincidunt ultrices nibh, ut consequat dui viverra id. Phasellus vel volutpat metus.</p> 
                                    </div>
                                </li>
                                <!-- // A Comment // -->
                                <li>
                                    <div class="well">
                                        <img src="http://placehold.it/48x48" class=" thumbnail author_thumbnail pull-left" title="default image" >
                                        <span><strong>Jhon Doe</strong></span><span class="pull-right">JUNE 21, 2012 AT 9:12</span>
                                        <p>Nullam dapibus tellus ut sem bibendum vel ullamcorper enim tempor. Nulla facilisi. Mauris aliquet pharetra placerat. Sed eu tellus sit amet elit iaculis tempor eget quis nulla.
                                            Nunc elementum facilisis tincidunt. </p> 
                                    </div>
                                </li>
                                <!-- // A Comment // -->
                                <li>
                                    <div class="well">
                                        <img src="http://placehold.it/48x48" class=" thumbnail author_thumbnail pull-left" title="default image" >
                                        <span><strong>Jhon Doe</strong></span><span class="pull-right">JUNE 21, 2012 PM 11:01</span>
                                        <p>n nec velit quam, quis ultrices ipsum. In ornare eleifend massa nec pharetra. Etiam faucibus imperdiet odio id luctus. Aenean id interdum nulla. Integer ullamcorper porttitor libero in accumsan.
                                            Proin adipiscing metus a dui molestie faucibus. Curabitur in cursus quam. Nulla </p> 
                                    </div>
                                </li>
                                <!-- // A Comment // -->
                                <li>
                                    <div class="well">
                                        <img src="http://placehold.it/48x48" class=" thumbnail author_thumbnail pull-left" title="default image" >
                                        <span><strong>Jhon Doe</strong></span><span class="pull-right">JUNE 24, 2012 AT 12:01</span>
                                        <p>Nulla dapibus scelerisque nisl consectetur porttitor. Nullam ut felis id dui lobortis pharetra et vitae nulla. 
                                            Maecenas justo orci, fringilla a tristique id, convallis vel dui.</p> 
                                    </div>
                                </li>
                                <!-- // A Comment // -->
                                <li>
                                    <div class="well">
                                        <img src="http://placehold.it/48x48" class=" thumbnail author_thumbnail pull-left" title="default image" >
                                        <span><strong>Jhon Doe</strong></span><span class="pull-right">JUNE 29, 2012 AT 3:01</span>
                                        <p>Suspendisse sit amet nisl neque, quis rhoncus ante. Praesent quis enim id justo congue pulvinar eu sit amet sapien. Vivamus pellentesque, felis cursus cursus dapibus, 
                                            libero est placerat sem, eget viverra ligula sapien nec dui. Praesent suscipit risus sit amet nibh fringilla a fringilla ante laoreet.</p> 
                                    </div>
                                </li>
                            </ul>
                            
                            
                            <!-- ///////////////////////////////////////////////////////////////////
                            Form to comment
                            /////////////////////////////////////////////////////////////////////-->
                            <div class="m2">
                                <div class="heading center">
                                    <div class="separation"></div>
                                    <h2>Leave your comment</h2>
                                </div><!-- end .heading -->
                                <div class="well m1">
                                    <form class="form-horizontal" id="form_comment">
                                        <fieldset>
                                            <div class="control-group">
                                                <label class="control-label" for="comment_name">Name</label>
                                                <div class="controls"><input type="text" id="comment_name" class="input-xlarge" ></div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label" for="comment_email">E-mail</label>
                                                <div class="controls"><input type="text" class="input-xlarge" id="comment_email"></div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label" for="comment_website">Website</label>
                                                <div class="controls"><input type="text" id="comment_website" class="input-xlarge"></div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label" for="comment_textarea">Comment</label>
                                                <div class="controls"><textarea id="comment_textarea" rows="4"></textarea></div>
                                            </div>
                                                <div class="controls"><button type="submit" class="btn">Send</button></div>
                                        </fieldset>
                                    </form>
                                </div><!-- end .well -->
                            </div><!-- end .m2 -->
                        </div><!-- end .span9 -->
                        
                        <!-- ///////////////////////////////////////////////////////////////////
                        Sidebar
                        /////////////////////////////////////////////////////////////////////-->
                        
                        <?php include('includes/sidebar.php'); ?>
                        
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