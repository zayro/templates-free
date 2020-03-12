<?php
class KwickSlider extends BaseSlider {
	public $id = 'kwick';
	private $width = 952;
	private $height = 392;
	private $min_width;

	public function __construct() {
		add_image_size('slider_accordion', 952, 392, true);
		$this->height = get_option('slider_height', 392);
		$this->min_width = get_option('kwick_min_width');
		$this->default_position = get_option('anything_default_cation_position');
		$this->default_text_position = get_option('anything_default_text_position');
		parent::__construct();
	}

	public function get_name() {
		return __('Accordion', TEMPLATENAME);
	}

	public function scripts() {
		wp_register_style('css_slider_kwick', get_bloginfo('template_directory') . '/sliders/accordion-slider/kwick-slider.css');
		wp_register_script('js_slider_kwick', get_bloginfo('template_directory') . '/sliders/accordion-slider/jquery.kwicks-1.5.1.pack.js', array('jquery'));
		wp_register_script('js_easing', get_bloginfo('template_directory') . '/js/jquery.easing.1.3.js', array('jquery'));
		wp_enqueue_style('css_slider_kwick');
		wp_enqueue_script('js_slider_kwick');
		wp_enqueue_script('js_easing');
	}

	public function scripts_init() {
 ?>
jQuery(function() {
	jQuery('.kwicks').kwicks({
		min     : <?php echo $this->min_width; ?>,
		spacing : 0,
		duration: <?php echo get_option('kwick_duration'); ?>,
		easing  : '<?php echo get_option('kwick_easing'); ?>'
	});
	jQuery(function(){
		jQuery(".slide_title").fadeTo(1, 0.8);
		jQuery(".kwicks").each(function () {
			jQuery(".kwicks").hover(function() {
				jQuery(".slide_title").stop().animate({opacity: 0, left: '400%'}, 250 );
			},function(){
				jQuery(".slide_title").stop().animate({opacity: 0.8, left: '0'},1200 );
			});
			jQuery(".kwicks li").hover(function() {
				jQuery('li.active .slide_caption').stop().animate({opacity: 0.8, bottom: '5'}, 800 );
			},function(){
				jQuery('.slide_caption').stop().animate({opacity: 0, bottom: '-100%'}, 250 );
			});
		});
	});
	jQuery('.kwicks').show();
});
<?php
	}

	protected function get_caption() {
		if (!$this->show_caption)
			return;
		$title = $content = '';
		$title = '<b class="slider_title">'.get_the_title().'</b>';
		$content = apply_filters('the_content', get_the_content());
		$content = str_replace(']]>', ']]&gt;', $content);
		$caption = "{$title}{$content}";
		return "<div class=\"slide_caption\">{$title}{$content}</div>";
	}

	public function render($loop) {
		echo '<div class="SliderBg">';
			echo '<div class="slideContainer">';
				echo '<ul class="kwicks">';
				$slider_height = get_option('slider_height');
				$count = $loop->post_count;
				$thumb_width = $this->width - ($this->min_width * ($count-1));
				while ($loop->have_posts()) {
					$loop->the_post();
					$this->target_link = metaboxesGenerator::the_superlink();
					echo '<li style="width:'.(952/$count).'px">';
					if (!get_post_thumbnail_id())
						continue;
					if ($this->linked_slide && !empty($this->target_link))
						echo "<a href=\"{$this->target_link}\">";
						the_post_thumbnail('slider_accordion', array('title' => false));
					echo '<p class="slide_title"><b class="slider_title">'.get_the_title().'</b>';
					echo $this->get_caption();
					if ($this->linked_slide && !empty($this->target_link))
						echo "</a>";
					echo '</li>';
				}
				echo '</ul>';
			echo '</div>';
		echo '</div>';
	}

	public function options() {
		ap_add_section('anything_slider', __('Accordion Slider', TEMPLATENAME));
		ap_add_input(array(
			'name' => 'kwick_min_width',
			'title' => __('Minimal slides width', TEMPLATENAME),
			'default' => 45,
			'desc' => __('px. The width of a fully collapsed clides.', TEMPLATENAME),
			'class' => 'small-text',
		));
		ap_add_input(array(
			'name' => 'kwick_duration',
			'title' => __('Animation Speed', TEMPLATENAME),
			'default' => 200,
			'desc' => __('ms. The number of milliseconds required for each animation to complete.', TEMPLATENAME),
			'class' => 'small-text',
		));
		ap_add_select(array(
			'name' => 'kwick_easing',
			'title' => __('Transition easing effect', TEMPLATENAME),
			'default' => 'swing',
			'options' => array(
				'linear' => 'linear',
				'swing' => 'swing',
				'easeInQuad' => 'easeInQuad',
				'easeOutQuad' => 'easeOutQuad',
				'easeInOutQuad' => 'easeInOutQuad',
				'easeInCubic' => 'easeInCubic',
				'easeOutCubic' => 'easeOutCubic',
				'easeInOutCubic' => 'easeInOutCubic',
				'easeInQuart' => 'easeInQuart',
				'easeOutQuart' => 'easeOutQuart',
				'easeInOutQuart' => 'easeInOutQuart',
				'easeInQuint' => 'easeInQuint',
				'easeOutQuint' => 'easeOutQuint',
				'easeInOutQuint' => 'easeInOutQuint',
				'easeInSine' => 'easeInSine',
				'easeOutSine' => 'easeOutSine',
				'easeInOutSine' => 'easeInOutSine',
				'easeInExpo' => 'easeInExpo',
				'easeOutExpo' => 'easeOutExpo',
				'easeInOutExpo' => 'easeInOutExpo',
				'easeInCirc' => 'easeInCirc',
				'easeOutCirc' => 'easeOutCirc',
				'easeInOutCirc' => 'easeInOutCirc',
				'easeInElastic' => 'easeInElastic',
				'easeOutElastic' => 'easeOutElastic',
				'easeInOutElastic' => 'easeInOutElastic',
				'easeInBack' => 'easeInBack',
				'easeOutBack' => 'easeOutBack',
				'easeInOutBack' => 'easeInOutBack',
				'easeInBounce' => 'easeInBounce',
				'easeOutBounce' => 'easeOutBounce',
				'easeInOutBounce' => 'easeInOutBounce'
			),
			'desc' => __('Select which easing effect to use for transition.', TEMPLATENAME),
		));

	}
}
?>
