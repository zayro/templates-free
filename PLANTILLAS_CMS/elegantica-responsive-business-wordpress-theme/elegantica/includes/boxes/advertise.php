	<script type="text/javascript">
	  jQuery(document).ready(function(){
		jQuery('.sliderAdvertise').bxSlider({
			controls: true,
			displaySlideQty: 6,
			moveSlideQty: 1,
			prevText : '',
			nextText : '',
			auto : true,
			easing : 'easeInOutQuint',
			pause : 4000
		});
	  });
	</script>
	<div class="advertise">
	<div class="title">
		<div class="titleborder"></div>
		<h2><?php echo stripText($data['translation_advertise_title']) ?></h2>
	</div>
	
		<?php $slides = $data['advertiseimage']; ?>
		<ul class="sliderAdvertise">
		<?php foreach ($slides as $slide) {  ?>
			<li>
			<?php
			  if($slide['url'] != '') :
					   
				 if($slide['link'] != '') : ?>
				   <a href="<?php echo $slide['link']; ?>"><img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $slide['url']; ?>&amp;h=130&amp;w=160"/></a>
				<?php else: ?>
					<img src="<?php echo get_template_directory_uri() ?>/js/timthumb.php?src=<?php echo $slide['url']; ?>&amp;h=130&amp;w=160"/>
				<?php endif; ?>
						
			<?php endif; ?>
			</li>
		<?php } ?>
		</ul>
		
	</div>