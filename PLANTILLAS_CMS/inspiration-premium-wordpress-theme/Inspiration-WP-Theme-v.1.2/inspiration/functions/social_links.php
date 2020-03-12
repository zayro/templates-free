<?php
global $_theme_social_links;
$_theme_social_links = array(
	'facebook' => __('facebook', TEMPLATENAME),
	'myspace' => __('myspace', TEMPLATENAME),
	'rss' => __('rss', TEMPLATENAME),
	'twitter' => __('twitter', TEMPLATENAME),
	'google-plus' => __('google plus', TEMPLATENAME),
);

function get_social_links() {
?>
		<!-- Start Social Icons -->
		<div class="social">
			<?php
			global $_theme_social_links;
			foreach ($_theme_social_links as $key => $title):
				$link = get_option($key.'_social_link');
				if (!empty($link)):
			?>
			<a href="<?php echo $link; ?>" title="<?php echo ucfirst($title); ?>"><img src="<?php echo get_bloginfo('template_url')."/images/social/{$key}.png"; ?>" width="42" height="42" alt="<?php echo ucfirst($title); ?>" /></a>
			<?php
				endif;
			endforeach;
			?>
		</div>
		<!-- End Social Icons -->
<?php
}
?>
