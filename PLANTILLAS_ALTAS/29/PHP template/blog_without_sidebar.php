<?php
/*
 * Just have to fill in the variables and replace the text by yours
 * 
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */

$pageName = "Blog (without sidebar)"; // Put here the page name

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
                            <!-- // A Post // -->
                            <article>
                                <div class="time">
                                    <p class="text_shadow"><span class="date_d">25</span><br />
                                    June<br />
                                    2012</p>
                                </div><!-- end .time -->
                                <div class="heading center">
                                    <div class="separation"></div>
                                    <h2><a href="single_post.php">Just a post</a></h2>
                                </div><!-- end .heading -->
                                <a href="single_post.php" class="thumbnail"><img src="http://placehold.it/1170x180" alt="http://placehold.it/"></a>
                                <p class="justify m1">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum dignissim erat, a lacinia enim accumsan eget. 
                                    Etiam tristique felis a erat blandit malesuada. Mauris placerat consequat nisl in mattis. Nulla accumsan porttitor quam vel rhoncus. 
                                    Integer sem odio, ullamcorper non porta sed, porta sit amet risus. Fusce in lacus nec velit dictum posuere at ac augue. 
                                    Cras id sem a ante sagittis pellentesque non id neque. Maecenas erat nulla, molestie a tristique eu, dapibus at eros. 
                                    Aliquam feugiat nibh in augue interdum tempus. Cras mollis sapien eu dolor scelerisque sit amet egestas mauris volutpat. 
                                    Sed vitae tempor nibh. Praesent nunc lectus, tempor eu pretium eget, lobortis nec tortor [...]
                                </p>
                                <div class="postmetadata m1">
                                    <div class="metadata-author"></div><p>Admin</p>
                                    <div class="metadata-categorie"></div><p>Webdesign, Print</p>  
                                    <div class="metadata-commment"></div><p>5</p>    
                                </div>
                                <a class="btn btn-more pull-right" href="single_post.php">Read more <span class="more_icon">+</span></a>
                            </article>
                            
                            <!-- // A Post // -->
                            <article class="m2">
                                <div class="time">
                                    <p class="text_shadow"><span class="date_d">20</span><br />
                                    June<br />
                                    2012</p>
                                </div><!-- end .time -->
                                <div class="heading center">
                                    <div class="separation"></div>
                                    <h2><a href="single_post.php">A second post</a></h2>
                                </div><!-- end .heading -->
                                <a href="single_post.php" class="thumbnail"><img src="http://placehold.it/1170x180" alt="http://placehold.it/"></a>
                                <p class="justify m1">
                                    Suspendisse hendrerit egestas nibh, in accumsan velit luctus id. Etiam quis mollis arcu.
                                    Vivamus scelerisque ipsum a neque blandit nec commodo nisl viverra. Sed rhoncus rutrum augue, 
                                    sed eleifend sapien facilisis sed. Fusce vel velit in ligula congue varius ut eget odio.
                                    Nulla suscipit fermentum velit vel tempor. Praesent gravida viverra massa, in fermentum turpis eleifend sit amet.
                                    Maecenas varius arcu vitae sapien semper eget fringilla nisi porta. Ut et eros mi, tincidunt blandit mauris. 
                                    Curabitur ultrices rutrum odio sed condimentum. Aenean ut molestie sapien. Curabitur sit amet sodales magna.
                                    Aenean enim turpis, adipiscing in elementum non, gravida et dolor. Nullam neque justo, consectetur ut consectetur sit amet,
                                    dictum semper odio. Nullam vel eros sit amet nunc dictum elementum. Pellentesque sed mauris mi, viverra viverra massa. [...]
                                </p>
                                <div class="postmetadata m1">
                                    <div class="metadata-author"></div><p>Admin</p>
                                    <div class="metadata-categorie"></div><p>Photography</p>  
                                    <div class="metadata-commment"></div><p>19</p>    
                                </div>
                                <a class="btn btn-more pull-right" href="single_post.php">Read more <span class="more_icon">+</span></a>
                            </article>
                            
                            <!-- // A Post // -->
                            <article class="m2">
                                <div class="time">
                                    <p class="text_shadow"><span class="date_d">12</span><br />
                                    June<br />
                                    2012</p>
                                </div><!-- end .time -->
                                <div class="heading center">
                                    <div class="separation"></div>
                                    <h2><a href="single_post.php">A third post</a></h2>
                                </div><!-- end .heading -->
                                <a href="single_post.php" class="thumbnail"><img src="http://placehold.it/1170x180" alt="http://placehold.it/"></a>
                                <p class="justify m1">
                                    Nullam in vulputate sapien. Sed mollis faucibus felis eget viverra. Nulla ultricies, 
                                    odio nec vestibulum sagittis, urna neque dictum dolor, sed vestibulum risus leo ac felis.
                                    Nunc sem mauris, ornare eget auctor ac, congue sit amet dui. Aenean dignissim suscipit nulla lacinia interdum.
                                    Integer leo justo, gravida non lobortis sit amet, placerat nec purus. Sed condimentum mi vel nisl rhoncus rutrum.
                                    Pellentesque porttitor massa et dui vestibulum eu egestas dolor malesuada. Nam adipiscing neque nec odio dapibus interdum. 
                                    Vivamus convallis, massa sollicitudin lacinia ultrices, mauris elit posuere nulla, sit amet blandit turpis turpis dapibus orci.
                                    Donec sed felis nisl. Mauris vel velit dolor, vel rutrum ante. Donec eleifend erat in sapien consectetur semper. Curabitur eget tortor ipsum.
                                    Suspendisse sit amet dui lectus. [...]
                                </p>
                                <div class="postmetadata m1">
                                    <div class="metadata-author"></div><p>Admin</p>
                                    <div class="metadata-categorie"></div><p>SEO, marketing</p>  
                                    <div class="metadata-commment"></div><p>47</p>    
                                </div>
                                <a class="btn btn-more pull-right" href="single_post.php">Read more <span class="more_icon">+</span></a>
                            </article>
                            
                            <!-- // Pagination // -->
                            <div class="btn-group clear blog_pagination m2">
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