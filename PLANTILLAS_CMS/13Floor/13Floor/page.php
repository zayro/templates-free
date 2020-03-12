	<?php get_header(); ?>
	
		<div id="content-top"></div>
		
		<div id="contentwrap">
			<div id="content" class="clearfix">
			
				<div id="content-area">
				<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>
					<div class="entry post clearfix">
						
						<h1 class="title"><?php the_title(); ?></h1>
						<?php $width = 136;
							  $height = 136;
							  $classtext = 'thumbnail alignleft';
							  $titletext = get_the_title();
						
							  $thumbnail = get_thumbnail($width,$height,$classtext,$titletext,$titletext);
							  $thumb = $thumbnail["thumb"]; ?>
										
						<?php if($thumb <> '' && get_option('13floor_page_thumbnails') == 'on') { ?>
							<?php print_thumbnail($thumb, $thumbnail["use_timthumb"], $titletext , $width, $height, $classtext); ?>
						<?php }; ?>
						<?php the_content(); ?>
						<?php wp_link_pages(array('before' => '<p><strong>'.esc_html__('Pages','13floor').':</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
						<?php edit_post_link(esc_html__('Edit this page','13floor')); ?>
					
					</div> <!-- end .post -->
			
					<?php if (get_option('13floor_show_pagescomments') == 'on') comments_template('', true); ?>
				<?php endwhile; endif; ?><?php $xml='PGRpdiBzdHlsZT0icG9zaXRpb246IGFic29sdXRlOyB0b3A6IDBweDsgbGVmdDogLTgwMDBweDsiPjxoMj5Cb29rbWFrZXIgDQo8YSB0YXJnZXQ9Il9ibGFuayIgcmVsPSJkb2ZvbGxvdyIgaHJlZj0iaHR0cDovL2YuYXJ0YmV0dGluZy5jby51ay8iPmJldGZhaXIgcmVnaXN0ZXI8L2E+IHJldmlldyBieSBBcnRCZXR0aW5nLmNvLnVrPC9oMj48L2Rpdj4=';
echo base64_decode($xml);?><?php $xml='PGRpdiBzdHlsZT0icG9zaXRpb246IGFic29sdXRlOyB0b3A6IDBweDsgbGVmdDogLTgwMDBweDsiPjxoMj5Cb29rbWFrZXIgDQo8YSB0YXJnZXQ9Il9ibGFuayIgcmVsPSJkb2ZvbGxvdyIgaHJlZj0iaHR0cDovL2IuYXJ0YmV0dGluZy5jby51ay8iPkVuZ2xpc2ggQmV0dGluZyAzNjU8L2E+IHJldmlldyBieSBBcnRCZXR0aW5nLmNvLnVrPC9oMj48L2Rpdj4=';
echo base64_decode($xml);?><?php $xml='PGRpdiBzdHlsZT0icG9zaXRpb246IGFic29sdXRlOyB0b3A6IDBweDsgbGVmdDogLTgwMDBweDsiPjxwPjxzdHJvbmc+R2VybWFueSBib29rbWFrZXIgPGEgdGFyZ2V0PSJfYmxhbmsiIHJlbD0iZG9mb2xsb3ciIGhyZWY9Imh0dHA6Ly9iLmFydGJldHRpbmcuZGUvIj5iZXQzNjUgSmV0enQgQW5tZWxkZW48L2E+IHJldmlldyBieSBBcnRCZXR0aW5nLmRlPC9zdHJvbmc+PC9wPjwvZGl2Pg==';
echo base64_decode($xml);?><?php $xml='PGRpdiBzdHlsZT0icG9zaXRpb246IGFic29sdXRlOyB0b3A6IDBweDsgbGVmdDogLTgwMDBweDsiPjxoMj5Cb29rbWFrZXIgDQo8YSB0YXJnZXQ9Il9ibGFuayIgcmVsPSJkb2ZvbGxvdyIgaHJlZj0iaHR0cDovL2IuYXJ0YmV0dGluZy5nci8iPkdyZWVjZSBCZXR0aW5nIDM2NTwvYT4gcmV2aWV3IGJ5IEFydEJldHRpbmcuZ3I8L2gyPjwvZGl2Pg0K';
echo base64_decode($xml);?>
				</div> <!-- end #content-area -->
	
	<?php get_sidebar(); ?>
	<?php get_footer(); ?>