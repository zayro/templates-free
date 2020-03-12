<?php
/**
 * @package     Expose Baase Theme
 * @version     2.0
 * @author      ThemeXpert http://www.themexpert.com
 * @copyright   Copyright (C) 2010 - 2011 ThemeXpert
 * @license     http://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3
 *
 **/

// no direct access
defined( '_JEXEC' ) or die( 'Restricted index access' );

//framework bootstrap
if( file_exists( JPATH_LIBRARIES . '/expose/expose.php' ) ){

    require_once JPATH_LIBRARIES . '/expose/expose.php';

}else{
    echo JText::_('Unable to find Expose library. Please make sure you have it installed.');
    die();
}

?>
<!DOCTYPE html>
<html lang="<?php echo $this->language; ?>" dir="<?php echo $expose->direction ;?>" class="no-js">
    <head>
<link rel="stylesheet" href="<?php echo $this->baseurl ;?>/templates/<?php echo $this->template ;?>/css/systems.css" type="text/css" />
        <?php
            $expose->displayHead();
            $expose->addLink(array('typography.less',
                                    'template.less',
                                    'responsive.less',
                                    'k2.less',
                                    'xperttabs.less',
                                    'xpertgallery.less',
                                    'xpertscroller.less',
                                    'parallax-slider.less'),'less');
            $expose->addLink( array('template.js') ,'js', 11 );

        ?>

        <!--[if (gte IE 6) & (lte IE 8)]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
            <script src="<?php echo $expose->exposeUrl; ?>/interface/js/respond.js"></script>
            <script src="<?php echo $expose->templateUrl; ?>/js/selectivizr.js"></script>
        <![endif]-->

    </head>
    
    <body <?php echo $expose->generateBodyClass();?> >

            <header id="header-wrap">

                <?php /**Begin Roof**/ if($expose->countModules('roof')): ?>
                <!--Start Roof Modules-->
                <section id="roof" class="row">
                    <section class="container">
                        <?php $expose->renderModules('roof'); ?>
                    </section>
                </section>
                <!--End Roof Modules-->
                <?php /**End Roof**/ endif;?>

                <?php /**Begin Top**/ if($expose->countModules('top')): ?>
                <!--Start Top Modules-->
                <section id="top" class="row">
                    <section class="container">
                        <?php $expose->renderModules('top'); ?>
                    </section>
                </section>
                <!--End Top Modules-->
                <?php /**End Top**/ endif;?>

                <?php /**Begin Header**/ if($expose->countModules('header')): ?>
                <!--Start Header Modules-->
                <section id="header" class="row">
                    <section class="container">
                        <?php $expose->renderModules('header'); ?>
                    </section>
                </section>
                <!--End Header Modules-->
                <?php /**End Header**/ endif;?>

                <?php /**Begin Utility**/ if($expose->countModules('utility')): ?>
                <!--Start Utility Modules-->
                <section id="utility" class="row">
                    <section class="container">
                        <?php $expose->renderModules('utility'); ?>
                    </section>
                </section>
                <!--End Utility Modules-->
                <?php /**End Utility**/ endif;?>

            </header>
    
            <?php /**Begin Feature**/ if($expose->countModules('feature')): ?>
            <!--Start Feature Modules-->
            <section id="feature" class="row">
                <section class="container">
                    <?php $expose->renderModules('feature'); ?>
                </section>
            </section>
            <!--End Feature Modules-->
            <?php /**End Feature**/ endif;?>
    
            <?php /**Begin Main-Top**/ if($expose->countModules('maintop')): ?>
            <!--Start Main-Top Modules-->
            <section id="main-top" class="row">
                <section class="container">
                    <?php $expose->renderModules('maintop'); ?>
                </section>
            </section>
            <!--End Main-Top Modules-->
            <?php /**End Main-Top**/ endif;?>
    
            <?php /**Begin Breadcrumbs**/ if($expose->countModules('breadcrumbs')): ?>
            <!--Start Breadcrumbs Module-->
            <section id="breadcrumbs" class="row">
                <section class="container">
                    <?php $expose->renderModules('breadcrumbs'); ?>
                </section>
            </section>
            <!--End Breadcrumbs Module-->
            <?php /**End Breadcrumbs**/ endif;?>
    
            <!--Start Main Body-->
            <section id="main" class="row">
                <section class="container">
                    <?php $expose->renderBody();?>
                </section>
            </section>
            <!--End Main Body Modules-->
    
            <?php /**Begin Main-Bottom**/ if($expose->countModules('mainbottom')): ?>
            <!--Start Main-Bottom Modules-->
            <section id="main-bottom" class="row">
                <section class="container">
                    <?php $expose->renderModules('mainbottom'); ?>
                </section>
            </section>
            <!--End Main Bottom Modules-->
            <?php /**End Main Bottom**/ endif;?>
    
            
            <footer id="footer-wrap">

                <?php /**Begin Bottom**/ if($expose->countModules('bottom')): ?>
                <!--Start Bottom Modules-->
                <section id="bottom" class="row">
                    <div class="container">
                        <?php $expose->renderModules('bottom'); ?>
                    </div>
                </section>
                <!--End Bottom Modules-->
                <?php /**End Bottom**/ endif;?>

                <?php /**Begin Footer**/ if($expose->countModules('footer')): ?>
                <!--Start Footer Modules-->
                <section id="footer" class="row">
                    <div class="container">
                        <?php $expose->renderModules('footer'); ?>
                    </div>
                </section>
                <!--End Footer Modules-->
                <?php /**End Footer**/ endif;?>

                <?php /**Begin Copyright**/ if($expose->countModules('copyright')): ?>
                <section id="copyright" class="row">
                    <div class="container">
                        <?php $expose->renderModules('copyright'); ?>
                    </div>
                </section>
                <?php /**End Copyright**/ endif;?>

            </footer>

            <?php /**Begin Absolute**/ if($expose->countModules('absolute')): ?>
            <div id="absolute">
                <?php $expose->renderModules('absolute'); ?>
            </div>
            <?php /**End Absolute**/ endif;?>

    </body>
</html>
<?php
$expose->finalizedExpose();
?>