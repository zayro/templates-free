<?php

// quote
function quotetext_shortcode($atts, $content, $code) {
	extract(shortcode_atts(array(
		'w' => '',
		'align' => 'left',
		'top' => '0',
		'right' => '0',
		'bottom' => '0',
		'left' => '0',
	), $atts));
	if (!empty($w)) {
		$w = "width: {$w}px;";
	}
	return "<div class='align{$align}' style='{$w} margin:{$top}px {$right}px {$bottom}px {$left}px;'><blockquote><p>{$content}</p></blockquote></div>";
}
add_shortcode('quote', 'quotetext_shortcode');

// code
function code_shortcode($atts, $content, $code) {
	$content = htmlentities2($content);
	return "<code>$content</code>";
}
add_shortcode('code_block', 'code_shortcode');

// clearfix
function clear_shortcode($atts, $content, $code) {
	return "<div class=\"clear\"></div>";
}
add_shortcode('clear', 'clear_shortcode');

// info boxes
function info_boxes_shortcode($atts, $content, $code) {
	return "<div class=\"{$code}\">{$content}</div>";
}
add_shortcode('succsess_box', 'info_boxes_shortcode');
add_shortcode('warning_box', 'info_boxes_shortcode');
add_shortcode('error_box', 'info_boxes_shortcode');
add_shortcode('info_box', 'info_boxes_shortcode');

// button
function btn_shortcode($atts, $content, $code) {
	extract(shortcode_atts(array(
		'url' => '#',
		'title' => '',
		'align' => '',
		'target' => '_self',
		'size' => '',
	), $atts));
	$class = $code;
	$wrap_left = $wrap_right = '';
	$style = '';
	switch($align) {
		case 'left':
			$class .= ' alignleft';
		break;
		case 'right':
			$class .= ' alignright';
		break;
		case 'wide':

		break;
		case 'center':
			$wrap_left = '<p style="margin: 0 auto; text-align:center;">';
			$wrap_right = '</p>';
			$style = 'display:inline-block;';
		break;
		default:
			$style = 'display:inline-block;';
		break;
	}
	$class .= ' '.$size ;
	return "{$wrap_left}<a href=\"{$url}\" target=\"{$target}\" title=\"{$title}\" class=\"{$class}\" style=\"{$style}\">{$content}</a>{$wrap_right}<span class=\"clear\"></span>";
}
add_shortcode('btn', 'btn_shortcode');

// button (coloured)
//function button_shortcode($atts, $content, $code) {
//	extract(shortcode_atts(array(
//		'url' => '#',
//		'title' => '',
//		'color' => 'black',
//		'target' => '_self',
//		'size' => 'medium',
//	), $atts));
//	$class = $code;
//	$class .= ' '.$size ;
//	$class .= ' '.$color ;
//	return "<a href=\"{$url}\" target=\"{$target}\" title=\"{$title}\" class=\"{$class}\">{$content}</a>";
//}
//add_shortcode('button', 'button_shortcode');

// TAG <pre>
function pre_shortcode($atts, $content, $code) {
	return "<pre>{$content}</pre>";
}
add_shortcode('pre', 'pre_shortcode');

// columns
function columns_shortcode($atts, $content, $code) {
	global $short_code_row;
	$short_code_row++;
	extract(shortcode_atts(array(
		'indent' => 40,
		'top' => '',
		'bottom' => '',
	), $atts));
	$content = do_shortcode($content);
	$styles = array();
	if (!empty($top)) {
		$styles['margin-top'] = $top.'px';
	}
	if (!empty($bottom)) {
		$styles['margin-bottom'] = $bottom.'px';
	}
	$style = '';
	foreach($styles as $key => $val) {
		$style .= $key.': '.$val.'; ';
	}
	if (!empty($style))
		$style = "style=\"{$style}\"";
	return "<div class=\"auto-row-{$short_code_row}\" {$style}>
	{$content}
	<div class=\"clear\"></div>
</div>
<script type=\"text/javascript\">
	jQuery('.auto-row-{$short_code_row}').autoColumn({$indent}, 'div.auto-column');
	jQuery('.auto-row-{$short_code_row}').autoHeight('div.auto-column');
</script>";
}
add_shortcode('columns', 'columns_shortcode');

// column
function column_shortcode($atts, $content, $code) {
	extract(shortcode_atts(array(
		'places' => 1,
	), $atts));
	$content = do_shortcode($content);
	return "<div data-place=\"{$places}\" class=\"auto-column\">{$content}</div>";
}
add_shortcode('column', 'column_shortcode');

// icon
function icons_shortcode($atts, $content, $code) {
	extract(shortcode_atts(array(
		'src' => '',
		'align' => ''
	), $atts));
	if (empty($src) && isset($atts[0])) {
		$src = get_bloginfo('template_url').'/images/icons/' . strtolower($atts[0]) . '.png';
	}
	if (empty($align) && isset($atts[1])) {
		$align = " class=\"align{$atts[1]}\"";
	}
	if (!empty($src))
		return "<img src=\"{$src}\" {$align} />";
}
add_shortcode('icon', 'icons_shortcode');

// go to top
function top_shortcode($atts, $content, $code) {
	return "<div class=\"gototop\"><a href=\"#header\">top</a></div>";
}
add_shortcode('top', 'top_shortcode');

// divider
function divider_shortcode($atts, $content, $code) {
	return "<div class=\"hr\"></div>";
}
add_shortcode('divider', 'divider_shortcode');

// headings h1 - h6
function heading_shortcode($atts, $content, $code) {
	extract(shortcode_atts(array(
		'img' => '',
		'icon' => '',
		'top' => '0',
		'right' => '0',
		'bottom' => '0',
		'left' => '0',
	), $atts));
	if (!empty($icon)) {
		$img = "<img src=\"" . get_bloginfo('template_url').'/images/icons/' . strtolower($icon) . '.png' . "\" class=\"alignleft\" />";
	}
	return "<div>{$img}<{$code} style=\"padding:{$top}px {$right}px {$bottom}px {$left}px;\">{$content}</{$code}><span class=\"clear\"></span></div>";
}
add_shortcode('h1', 'heading_shortcode');
add_shortcode('h2', 'heading_shortcode');
add_shortcode('h3', 'heading_shortcode');
add_shortcode('h4', 'heading_shortcode');
add_shortcode('h5', 'heading_shortcode');
add_shortcode('h6', 'heading_shortcode');

// dropcap
function dropcap_shortcode($atts, $content, $code) {
	extract(shortcode_atts(array(
		'type' => 'type1',
	), $atts));
	$content = do_shortcode($content);
	return "<p class=\"dropcap-{$type}\">{$content}</p>";
}
add_shortcode('dropcap', 'dropcap_shortcode');

// highlight
function highlight_shortcode($atts, $content, $code) {
	extract(shortcode_atts(array(
		'type' => 'highlight_01',
	), $atts));
	$content = do_shortcode($content);
	return "<span class=\"{$type}\">{$content}</span>";
}
add_shortcode('highlight', 'highlight_shortcode');

// toggle block
function toggle_shortcode($atts, $content, $code) {
	extract(shortcode_atts(array(
		'title' => '',
	), $atts));
	$content = do_shortcode($content);
	return "<b class=\"trigger\">{$title}</b><div class=\"toggle_container\">{$content}</div>";
}
add_shortcode('toggle', 'toggle_shortcode');

// accordions shortcode
function accordions_shortcode($atts, $content, $code) {
	extract(shortcode_atts(array(
		'align' => '',
	), $atts));
	if (!empty($align)) {
		if ($align == 'left') {
			$align = ' alignleft';
		} elseif ($align == 'right') {
			$align = ' alignright';
		} else {
			$align = '';
		}
	}
	$content = do_shortcode($content);
	return "<div class=\"acc_wrapper{$align}\">{$content}</div>";
}
add_shortcode('accordions', 'accordions_shortcode');

// accordion shortcode
function accordion_shortcode($atts, $content, $code) {
	extract(shortcode_atts(array(
		'title' => '',
	), $atts));
	$content = do_shortcode($content);
	return "<b class=\"acc_trigger\">{$title}</b><div class=\"acc_container\"><div class=\"block\">{$content}</div></div>";
}
add_shortcode('accordion', 'accordion_shortcode');

// tabs shortcode
function tabs_shortcode($atts, $content = null, $code) {
	extract(shortcode_atts(array(
		'style' => false
	), $atts));

	if (!preg_match_all("/(.?)\[(tab)\b(.*?)(?:(\/))?\](?:(.+?)\[\/tab\])?(.?)/s", $content, $matches)) {
		return do_shortcode($content);
	} else {
		global $tabs_counter;

		if (!isset($tabs_counter)) {
			$tabs_counter = 0;
		}
		$tabs_counter++;

		for($i = 0; $i < count($matches[0]); $i++) {
			$matches[3][$i] = shortcode_parse_atts($matches[3][$i]);
		}
		$output = '<ul class="tabs">';

		for($i = 0; $i < count($matches[0]); $i++) {
			$output .= "<li><a href=\"#tab-{$tabs_counter}-{$i}\">" . $matches[3][$i]['title'] . '</a></li>';
		}
		$output .= '</ul>';
		$output .= '<div class="tab_container">';
		for($i = 0; $i < count($matches[0]); $i++) {
			$output .= "<div id=\"tab-{$tabs_counter}-{$i}\" class=\"tab_content\">" . do_shortcode(trim($matches[5][$i])) . '</div>';
		}
		$output .= '</div>';

		return "<div id=\"tabs-{$tabs_counter}\">{$output}</div>";
	}
}
add_shortcode('tabs', 'tabs_shortcode');

// lists
function list_shortcode($atts, $content, $code) {
	extract(shortcode_atts(array(
		'style' => 'ordered',
		'type' => 'type1',
	), $atts));
	$items = explode("\r\n", $content);
	$out = '';
	if (!empty($items)) {
		$out = "<ul class=\"{$style} {$type}\">";
		foreach ($items as $item) {
			if (empty($item))
				continue;
			$out .= "<li>{$item}</li>";
		}
		$out .= "</ul>";
	}
	return $out;
}
add_shortcode('list', 'list_shortcode');

// formatter [raw] (clears wordpress default additional unnecessary tags)
function my_formatter($content) {
		 $new_content = '';
		 $pattern_full = '{(\[raw\].*?\[/raw\])}is';
		 $pattern_contents = '{\[raw\](.*?)\[/raw\]}is';
		 $pieces = preg_split($pattern_full, $content, -1, PREG_SPLIT_DELIM_CAPTURE);

		 foreach ($pieces as $piece) {
					if (preg_match($pattern_contents, $piece, $matches)) {
							  $new_content .= $matches[1];
					} else {
							  $new_content .= wptexturize(wpautop($piece));
					}
		 }

		 return $new_content;
}
remove_filter('the_content', 'wpautop');
remove_filter('the_content', 'wptexturize');
add_filter('the_content', 'my_formatter', 99);
add_filter('widget_text', 'do_shortcode');

// Featured Bottom Line
function carousel_shortcode($atts, $content = null, $code) {
	extract(shortcode_atts(array(
		'amount' => '',
		'tag' => '',
		'orderby' => 'date',
		'order' => 'desc'
		//'display' => '4'
	), $atts));
	$args = array(
		'post_type' => 'any',
		'orderby' => $orderby,
		'order' => $order,
		'tag_slug__in' => $tag
	);
	if (!empty($amount))
		$args['posts_per_page'] = $amount;
	else
		$args['posts_per_page'] = -1;
	$loop = new WP_Query($args);
	ob_start();
?>
<?php if ($loop->have_posts()): ?>
<!-- Start Featured Bottom Line -->
	<script type="text/javascript" src="<?php echo get_bloginfo ( 'template_directory' ) . '/js/jquery.tinycarousel.js'; ?>"></script>
	<script type="text/javascript">
		jQuery(document).ready(function(){
			
			// jQuery text slide up / slide down effect
			jQuery.fn.showFeatureText = function() {
			  return this.each(function(){    
				var box = jQuery(this);
				var text = jQuery('h4',this);    
			
				text.css({ position: 'absolute', bottom: '0px' }).hide();
			
				box.hover(function(){
				  text.slideDown("fast");
				},function(){
				  text.slideUp("fast");
				});
			
			  });
			}
				
			// jQuery text slide up / slide down effect
			jQuery('.tiny-carousel .overview li').showFeatureText();
			
			// jQuery Tinycarousel
			jQuery('.tiny-carousel').tinycarousel({
				start: 1, // where should the carousel start?
				display: 1, // how many blocks do you want to move at 1 time?
				axis: 'x', // vertical or horizontal scroller? ( x || y ).
				controls: true, // show left and right navigation buttons.
				pager: false, // is there a page number navigation present?
				interval: true, // move to another block on intervals.
				intervaltime: 3000, // interval time in milliseconds.
				rewind: false, // If interval is true and rewind is true it will play in reverse if the last slide is reached.
				animation: true, // false is instant, true is animate.
				duration: 1000, // how fast must the animation move in ms?
				callback: null // function that executes after every move
			});
		
		});
	</script>
	<div id="featured_bottom_line">
		<div class="tiny-carousel">
			<a class="buttons prev" href="#">left</a>
			<div class="viewport">
				<ul class="overview">
					<?php while($loop->have_posts()): $loop->the_post(); ?>
					<li><a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('featured', array('class' => false, 'title' => false)); ?></a><h4><b><?php the_title(); ?></b></h4></li>
					<?php endwhile; ?>
				</ul>
			</div>
			<a class="buttons next" href="#">right</a>
		</div>
		<div class="clear"></div>
	</div>
<!-- End Featured Bottom Line -->
<?php endif; ?>
<?php
	$out = ob_get_contents();
	ob_end_clean();

	return $out;
}
add_shortcode('carousel', 'carousel_shortcode');

?>