<?php
/*
 * Just have to fill in the variables and replace the text by yours
 * 
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */

$pageName = "Single Page"; // Put here the page name

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
                       <div id="main_container" class="container">
                    <div class="row m1">
                        <div class="span12">
                            <div class="tabbable tabs-left">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#1" data-toggle="tab">Cras quis erat</a></li>
                                    <li><a href="#2" data-toggle="tab">Etiam faucibus</a></li>
                                    <li><a href="#3" data-toggle="tab">Proin vel</a></li>
                                    <li><a href="#4" data-toggle="tab">Fusce </a></li>
                                </ul>
                                <div class="tab-content">
                                    <!-- // A tab // -->
                                    <div class="tab-pane active" id="1">
                                        <h4>A table:</h4>
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Username</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Larry</td>
                                                <td>the Bird</td>
                                                <td>@twitter</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div><!-- end .tab-pane -->
                                    <!-- // A tab // -->
                                    <div class="tab-pane" id="2">
                                        <h4>Nullam bibendum porttitor ornare</h4>
                                        <div class="span5">
                                            <span>Quisque auctor</span>
                                            <div class="progress progress-striped progress-success active">
                                                <div class="bar" style="width: 50%;"></div>
                                            </div>
                                            <span> Nunc porttitor</span>
                                            <div class="progress progress-striped progress-danger active">
                                                <div class="bar" style="width: 10%;"></div>
                                            </div>
                                        </div><!-- end .span5 -->
                                        <div class="span5">
                                            <span>Nam at orc</span>
                                            <div class="progress progress-striped active">
                                                <div class="bar" style="width: 20%;"></div>
                                            </div>
                                            <span> In hac habitasse</span>
                                            <div class="progress progress-striped active">
                                                <div class="bar" style="width: 60%;"></div>
                                            </div>
                                        </div><!-- end .span5 -->
                                    </div><!-- end .tab-pane -->
                                    <!-- // A tab // -->
                                    <div class="tab-pane" id="3">
                                        <h4>Nulla metus odio</h4>
                                        <p>
                                            Proin viverra, eros id commodo dapibus, mauris orci vehicula dui, nec viverra risus erat ut eros. Quisque sit amet tellus vitae nisl scelerisque dapibus. 
                                            Cras cursus quam et sapien commodo dapibus. Nulla metus odio, accumsan eu interdum eget, ultrices vel lacus. In nec tempor dolor.
                                            Nullam nulla mauris, imperdiet a consequat posuere, hendrerit ut orci. Sed a justo ipsum, at volutpat mi. Sed quis neque odio.
                                            Ut tincidunt orci et justo placerat malesuada quis quis nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. 
                                            Fusce malesuada, massa vitae lobortis aliquam, purus nisl pellentesque augue, eu euismod metus nisl a lectus. Curabitur pharetra, arcu fermentum pellentesque ultrices, est eros lobortis mi, vitae rhoncus diam arcu at urna.
                                            Curabitur vehicula mattis pharetra. Mauris iaculis malesuada nulla eu cursus. Ut ullamcorper augue eu orci venenatis adipiscing sollicitudin diam sagittis. 
                                            Vivamus felis leo, dignissim pharetra viverra non, tincidunt porta velit. Donec auctor, lacus a aliquam condimentum, mauris sapien bibendum orci, quis adipiscing mi nisl vitae massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
                                            Sed eros ante, eleifend ut commodo eu, pretium at eros.
                                        </p>
                                    </div><!-- end .tab-pane -->
                                    <!-- // A tab // -->
                                    <div class="tab-pane" id="4">
                                        <h4>Quisque auctor sollicitudin</h4>
                                        <p>
                                        <span class="badge">1</span>
                                            Pellentesque a arcu sed nunc eleifend eleifend. Nullam vel sem turpis, sit amet varius ipsum. Integer ut tortor quis lacus semper semper.
                                            Morbi sed blandit tellus. Etiam nec ultrices dui. Donec metus mi, consectetur tempus ullamcorper at, interdum a diam. Etiam et hendrerit metus. 
                                            Sed velit purus, dapibus et aliquam in, gravida ac tortor. 
                                        </p>
                                        <ul class="list">
                                            <li>Nunc quis metus nec libero malesuada lobortis eget vel nisl.</li>
                                            <li>Nulla et elit a elit viverra malesuada sed sed quam.</li>
                                            <li>Donec pretium ipsum et urna ultrices hendrerit.</li>
                                            <li>Cras non lacus est, non rhoncus neque.</li>
                                        </ul>
                                        <p>
                                        <span class="badge">2</span>
                                            In ac dui arcu, et hendrerit velit. Nulla porttitor quam adipiscing justo adipiscing et venenatis lacus blandit. 
                                            Etiam pharetra fringilla massa a porttitor. Donec laoreet placerat metus ut ullamcorper. Sed non dolor a ipsum egestas tincidunt. 
                                            Curabitur at aliquam eros. Nullam eget urna ut tortor laoreet condimentum. Curabitur at magna eu leo sagittis scelerisque sed vel risus.
                                        </p>
                                        <ul class="list">
                                            <li>Etiam vel felis sit amet turpis convallis vestibulum non et justo.</li>
                                            <li>In ac justo erat, ac pellentesque justo.</li>
                                            <li>Curabitur et nisi id dolor pulvinar tempor ut nec leo.</li>
                                            <li>Cras non lacus est, non rhoncus neque.</li>
                                        </ul>
                                    </div><!-- end .tab-pane -->
                                </div><!-- end .tab-content -->
                            </div><!-- end .tabbable -->
                        </div><!-- end .span12 -->
                        <div class="span12 m2">
                            <div class="separation"></div>
                        </div><!-- end .span12 -->
                        
                        <div class="span6 m1">
                            <div class="heading center">
                                <div class="separation"></div>
                                <h2>Mauris et erat</h2>
                            </div><!-- end .heading -->
                            <p class="justify">Aenean pellentesque dignissim lectus ac porttitor. Phasellus a ante urna, eu commodo ligula. Quisque dolor libero, egestas eget convallis a, euismod in felis.
                               Suspendisse eu facilisis nulla. Vestibulum sollicitudin, turpis varius rutrum mattis, est mi convallis nisl, in tempor nisl justo sit amet magna. 
                               Ut feugiat, massa vitae egestas tincidunt, sapien leo fermentum diam, sed condimentum ante mi eget dui. Nam id magna at elit vulputate porttitor quis non eros.</p>
                        </div><!-- end .span6 -->
                        
                        <div class="span6 m1">
                            <div class="heading center">
                                <div class="separation"></div>
                                <h2>Curabitur sagittis nibh</h2>
                            </div><!-- end .heading -->
                            <p class="justify">In posuere ullamcorper lectus sollicitudin gravida. Morbi imperdiet elementum dolor sit amet dapibus. Sed turpis neque, pellentesque sit amet consectetur ut, cursus eget sem.
                                Integer nec quam mauris, in ultrices eros. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. 
                                Donec in mi quam. Integer mattis interdum risus luctus varius.</p>
                        </div><!-- end .span6 -->
                        
                        <div class="span4 m1">
                            <a href="http://placehold.it/720x400" rel="prettyPhoto"><img src="http://placehold.it/360x200" alt="an image" class="thumbnail"></a>
                        </div><!-- end .span4 -->
                        
                        <div class="span8 m1">
                            <p class="justify">
                                Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce ac mi neque, nec suscipit odio. Nulla malesuada risus ac mi dictum bibendum. Suspendisse convallis dictum erat. Phasellus orci turpis, condimentum at rutrum id, semper nec lacus.
                                Donec mi dui, condimentum quis lacinia id, tempus vitae tellus. Etiam adipiscing, risus eget molestie ornare, turpis ligula rhoncus nunc, sed ullamcorper eros felis eu tortor.
                                Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce ac mi neque, nec suscipit odio. Nulla malesuada risus ac mi dictum bibendum. Suspendisse convallis dictum erat. Phasellus orci turpis, condimentum at rutrum id, semper nec lacus.
                                Donec mi dui, condimentum quis lacinia id, tempus vitae tellus. Etiam adipiscing, risus eget molestie ornare, turpis ligula rhoncus nunc, sed ullamcorper eros felis eu tortor.
                                Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce ac mi neque, nec suscipit odio. Nulla malesuada risus ac mi dictum bibendum. Suspendisse convallis dictum erat. Phasellus orci turpis, condimentum at rutrum id, semper nec lacus.
                            </p>
                            <a class="btn btn-success pull-right" href="portfolio_4col.php"><i class="icon-briefcase icon-white"></i> Show the portfolio</a>
                        </div><!-- end .span8 -->
                        <div class="span12 alert-info alert m2">
                            <p><strong>Info !</strong><br />
                                Aliquam mollis pellentesque libero ut sodales. Praesent rutrum, tortor in porta scelerisque, magna neque ultrices magna, eget tincidunt neque purus a sem. 
                                Nunc id augue ac nisl rutrum aliquet. Aenean ultrices viverra velit sit amet semper. 
                            </p>
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