<?php global $blogConf, $data;

if((is_single() && $data['post_author']) || (is_page() && $data['page_author']))
	if(!$blogConf['hide_author']){ ?>
		<div class="item-author clearfix">
			<?php $author_email =  get_the_author_meta('email'); echo get_avatar( $author_email, $size = '70'); ?>
			<h3><span><?php _e("Author: ", "themeton");?></span><?php if(is_author()) the_author(); else the_author_posts_link(); ?></h3>
			<p><?php
				$description = get_the_author_meta('description');
				if ($description != '') echo $description;
				else _e('The author didnt add any Information to his profile yet', 'themeton'); ?>
			</p>
		</div><?php 
	} ?>