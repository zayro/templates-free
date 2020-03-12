<?php
/*
 * Just have to fill in the variables and replace the text by yours
 * 
 * DON'T FORGET --> A DOCUMENTATION IS HERE TO HELP YOU ;-)
 */

$pageName = "Contact Page"; // Put here the page name

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
$javascriptMore1 = "http://maps.google.com/maps/api/js?sensor=false"; // For the google map
$javascriptMore2 = "js/map.js"; // For the google map
$javascriptMore3 = "js/bootstrap-alert.js"; // Ex: js/yourfile.js 
?>          
<?php 
/*
 * *****************************************************************************
 * SEND THE EMAIL
 * *****************************************************************************
 */
?> 
<?php

$yourEmail = 'your@email.com'; //set your email here..

//If the form is submitted
if(isset($_POST['submitted'])) { 
    //Check to make sure that the name field is not empty
    if($_POST['contact_name'] === '') { 
            $hasError = true;
    } else {
            $name = $_POST['contact_name'];
    }
    //Check to make sure that the subject field is not empty
    if($_POST['contact_subject'] === '') { 
            $hasError = true;
    } else {
            $mail_subject = $_POST['contact_subject'];
    }

    //Check to make sure sure that a valid email address is submitted
    if($_POST['contact_email'] === '')  { 
            $hasError = true;
    } else if (!preg_match("/^[a-z0-9]+([_\\.-][a-z0-9]+)*@([a-z0-9]+([\.-][a-z0-9]+)*)+\\.[a-z]{2,}$/i", $_POST['contact_email'])) {
            $hasError = true;
    } else {
            $email = $_POST['contact_email'];
    }

    //Check to make sure comments were entered	
    if($_POST['contact_textarea'] === '') {
            $hasError = true;
    } else {
            if(function_exists('stripslashes')) {
                    $comments = stripslashes($_POST['contact_textarea']);
            } else {
                    $comments = $_POST['contact_textarea'];
            }
    }

    //If there is no error, send the email
    if(!isset($hasError)) {

            $emailTo = $yourEmail ;
            $subject = $mail_subject;
            $body = "Name: $name \n\nEmail: $email \n\nComments: $comments";
            $headers = 'From : my site <'.$emailTo.'>' . "\r\n" . 'answer to : ' . $email;

            mail($emailTo, $subject, $body, $headers);

            $emailSent = true; 
    }
    
}
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
                    <!-- // Google Map // -->
                    <div id="GoogleMaps"></div>
                    
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
                                <h2>Our address</h2>
                            </div><!-- end .heading -->
                            <blockquote>
                                <p>The White House 1600 Pennsylvania Ave.<br />
                                    NW Washington,DC 20500.<br />
                                    Telephone: 202-456-1414<br />
                                    Fax: 202-456-2461 .</p>
                            </blockquote>
                            <div class="heading center m1">
                                <div class="separation"></div>
                                <h2>We are social</h2>
                            </div><!-- end .heading -->
                            <p>Follow us on:</p>
                            <div class="contact_social_icons">
                                <!-- // Choose yours // -->
                                <a href="#" rel="tooltip" title="Join us on facebook"><img src="images/icons_social/facebook.png" alt="facebook icon"  height="22" width="22" class="a_social_icon  facebook"></a>
                                <a href="#" rel="tooltip" title="Follow us on twitter"><img src="images/icons_social/twitter.png" alt="twitter icon" height="22" width="22" class="a_social_icon twitter"></a>
                                <a href="#" rel="tooltip" title="Join us on google +"><img src="images/icons_social/gplus.png" alt="gplus icon"  height="22" width="22" class="a_social_icon gplus"></a>
                                <a href="#" rel="tooltip" title="Join us on youtube"><img src="images/icons_social/youtube.png" alt="youtube icon"  height="22" width="22" class="a_social_icon youtube"></a>
                                <a href="#" rel="tooltip" title="Join us on vimeo"><img src="images/icons_social/vimeo.png" alt="vimeo icon"  height="22" width="22" class="a_social_icon vimeo"></a>
                                <a href="#" rel="tooltip" title="Subscribe our rss feed"><img src="images/icons_social/rss.png" alt="rss icon"  height="22" width="22" class="a_social_icon rss"></a>
                                <a href="#" title=""><img src="images/icons_social/addthis.png" alt="addthis icon"  height="22" width="22" class="a_social_icon addthis"></a>
                                <a href="#" rel="tooltip" title="Follow us on behance"><img src="images/icons_social/behance.png" alt="behance icon"  height="22" width="22" class="a_social_icon behance"></a>
                                <a href="#" rel="tooltip" title="Join us on blogger"><img src="images/icons_social/blogger.png" alt="blogger icon"  height="22" width="22" class="a_social_icon blogger"></a>
                                <a href="#" rel="tooltip" title="Join us on digg"><img src="images/icons_social/digg.png" alt="digg icon"  height="22" width="22" class="a_social_icon digg"></a>
                                <a href="#" rel="tooltip" title="Join us on dribbble"><img src="images/icons_social/dribbble.png" alt="dribbble icon"  height="22" width="22" class="a_social_icon dribbble"></a>
                                <a href="#" rel="tooltip" title="Follow us on flickr"><img src="images/icons_social/flickr.png" alt="flickr icon"  height="22" width="22" class="a_social_icon flickr"></a>
                                <a href="#" rel="tooltip" title="Join us on instagram"><img src="images/icons_social/instagram.png" alt="instagram icon"  height="22" width="22" class="a_social_icon instagram"></a>
                                <a href="#" rel="tooltip" title="Join us on lastfm"><img src="images/icons_social/lastfm.png" alt="lastfm icon"  height="22" width="22" class="a_social_icon lastfm"></a>
                                <a href="#" title=""><img src="images/icons_social/like.png" alt="like icon"  height="22" width="22" class="a_social_icon like"></a>
                                <a href="#" rel="tooltip" title="Follow us on linkedin"><img src="images/icons_social/linkedin.png" alt="linkedin icon"  height="22" width="22" class="a_social_icon linkedin"></a>
                                <a href="#" rel="tooltip" title="Join us on livejournal"><img src="images/icons_social/livejournal.png" alt="livejournal icon"  height="22" width="22" class="a_social_icon livejournal"></a>
                                <a href="#" rel="tooltip" title="Join us on myspace"><img src="images/icons_social/myspace.png" alt="myspace icon"  height="22" width="22" class="a_social_icon myspace"></a>
                                <a href="#" rel="tooltip" title="Join us on paypal"><img src="images/icons_social/paypal.png" alt="paypal icon"  height="22" width="22" class="a_social_icon paypal"></a>
                                <a href="#" rel="tooltip" title="Follow us on picasa"><img src="images/icons_social/picasa.png" alt="picasa icon"  height="22" width="22" class="a_social_icon picasa"></a>
                                <a href="#" rel="tooltip" title="Join us on reddit"><img src="images/icons_social/reddit.png" alt="reddit icon"  height="22" width="22" class="a_social_icon reddit"></a>
                                <a href="#" rel="tooltip" title="Join us on sharethis"><img src="images/icons_social/sharethis.png" alt="sharethis icon"  height="22" width="22" class="a_social_icon sharethis"></a>
                                <a href="#" rel="tooltip" title="Follow us on skype"><img src="images/icons_social/skype.png" alt="skype icon"  height="22" width="22" class="a_social_icon skype"></a>
                                <a href="#" rel="tooltip" title="Join us on spotify"><img src="images/icons_social/spotify.png" alt="spotify icon"  height="22" width="22" class="a_social_icon spotify"></a>
                                <a href="#" rel="tooltip" title="Join us on stumbleupon"><img src="images/icons_social/stumbleupon.png" alt="stumbleupon icon"  height="22" width="22" class="a_social_icon stumbleupon"></a>
                                <a href="#" rel="tooltip" title="Join us on tumblr"><img src="images/icons_social/tumblr.png" alt="tumblr icon"  height="22" width="22" class="a_social_icon tumblr"></a>
                                <a href="#" rel="tooltip" title="Follow us on wordpress"><img src="images/icons_social/wordpress.png" alt="wordpress icon"  height="22" width="22" class="a_social_icon wordpress"></a>
                            </div>
                        </div><!-- end .span6 m1 -->
                        <div class="span6">
                            <div class="heading center">
                                <div class="separation"></div>
                                <h2>Contact us now</h2>
                            </div><!-- end .heading -->
                            <?php 
                            /*
                            * *****************************************************************************
                            * ALERTS (email sent or not)
                            * *****************************************************************************
                            */
                            ?> 
                            <?php if(isset($emailSent) && $emailSent == true) { ?>
                                    <div class="alert-success alert" >
                                        <a class="close" data-dismiss="alert" href="#">&times;</a>
                                        <strong><?php echo'Thanks, '. $name  .'.';?></strong>
                                            <p><?php echo'Your message was sent successfully. You will receive a response shortly.'; ?></p>
                                    </div><!-- .alert -->
                                <?php } ?>
                                <?php if(isset($hasError) && $hasError == true) { ?>
                                    <div class="alert-error alert">
                                        <a class="close" data-dismiss="alert" href="#">&times;</a>
                                        <strong><?php echo'Sorry,'; ?></strong>
                                            <p><?php echo'Your message can\'t be send...check if your email is correct otherwise a field is missing...'; ?></p>
                                    </div><!-- .alert -->
                                <?php } ?>
                             <?php 
                            /*
                            * *****************************************************************************
                            * END
                            * *****************************************************************************
                            */
                            ?> 
                            <!-- // Form // -->
                            <form class="form-horizontal" id="form_contact" method="post" action="contact.php">
                                <fieldset>
                                    <div class="control-group">
                                        <label class="control-label" for="contact_name">Name</label>
                                        <div class="controls"><input type="text" id="contact_name" name="contact_name" class="input-xlarge" ></div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="contact_email">E-mail</label>
                                        <div class="controls"><input type="text" class="input-xlarge" id="contact_email" name="contact_email" ></div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="contact_subject">Subject</label>
                                        <div class="controls"><input type="text" id="contact_subject" name="contact_subject" class="input-xlarge"></div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="contact_textarea">Message</label>
                                        <div class="controls"><textarea id="contact_textarea" name="contact_textarea"  rows="4"></textarea></div>
                                    </div>
                                        <input type="hidden" name="submitted" id="submitted" value="true" />
                                        <div class="controls"><button type="submit" class="btn"  name="submitted">Send <i class="icon_grey icon-upload"></i></button></div>
                                </fieldset>
                            </form>
                        </div><!-- end .span6 m1 -->
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