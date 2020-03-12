<?php
/*
Template Name: Home with Nivo Slider
*/
?>

<?php get_header(); ?>


<script type="text/javascript">
jQuery(document).ready(function () {
jQuery('#nslider').nivoSlider({
		effect:'<?php echo $data['effect']; ?>', // Specify sets like: 'fold,fade,sliceDown'
        slices:<?php echo $data['slices']; ?>, // For slice animations
        boxCols: <?php echo $data['boxcols']; ?>, // For box animations
        boxRows: <?php echo $data['boxrows']; ?>, // For box animations
        animSpeed:<?php echo $data['anispeed']; ?>, // Slide transition speed
        pauseTime:<?php echo $data['pausetime']; ?>, // How long each slide will show
        startSlide:0, // Set starting Slide (0 index)
        directionNav:true, // Next & Prev navigation
        directionNavHide:true, // Only show on hover
		controlNav:false, // 1,2,3... navigation
		pauseOnHover:false,
		startSlide: 0,
		controlNavThumbs: false,
		controlNavThumbsFromRel: false,
		controlNavThumbsSearch: '',
		controlNavThumbsReplace: '',
		captionOpacity:1 
    });
});	
</script>	
<div id="nslider-wrapper">
	<div class="sliderNivo">
	<div id="nslider" class="nivoSlider">
	
	<?php $slides = $data['nivo_slider']; 
		if(!empty($slides)){
		foreach ($slides as $slide) { 
	
          if($slide['url'] != '') :
                   
             if($slide['link'] != '') : ?>
               <a href="<?php echo $slide['link']; ?>"><img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $slide['url']; ?>&amp;h=380&amp;w=940" title="<?php echo stripText($slide['description']); ?>" /></a>
            <?php else: ?>
                <img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $slide['url']; ?>&amp;h=380&amp;w=940" title="<?php echo stripText($slide['description']); ?>" />
            <?php endif; ?>
                    
        <?php endif; ?>
	<?php } }?>
</div></div>
	
</div>

	<div class="clear"></div>
	
	<div id="mainwrap" class="homewrap">

		<div id="main" class="clearfix">

			<?php if(isset($data['infotext_status'])) { ?>
				<div class="infotextwrap">
					<div class="infotext">
						<h2><?php echo  stripText($data['infotext'])?></h2>
					</div>
				</div>
			<?php }?>
			
			<div class="clear"></div>
			
			<?php if($data['box_status']) { ?>

				<?php include('includes/boxes/homebox.php'); ?>
				
			<?php }?>				
			
			<div class="clear"></div>

			<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
			
			
			<div class="usercontent homeuser"><?php the_content(); ?></div>
			
			
			<?php endwhile; endif; ?>
			
			
			<div class="clear"></div>			

			<?php if($data['racent_status_port']) { ?>
				<?php include('includes/boxes/homeracentPort.php'); ?>
			
			<?php }?>
			
			<?php if($data['racent_status']) { ?>
				<?php include('includes/boxes/homeracentPost.php'); ?>
			
			<?php }?>	

			<div class="clear"> </div>
			
			<?php if($data['showadvertise']) { ?>

				<?php include('includes/boxes/advertise.php'); ?>
				
			<?php }?>		

			<div class="clear"> </div>	

		</div>
	</div>


<?php get_footer(); ?>