<?php global $formatimg, $format, $data, $customlink;?>
<footer>	
	<?php
    if(isset($data['post_comment'])&&$data['post_comment']&&$customlink['enable']=="") {
        if (comments_open ()) {
			if (isset($data['facebook_comment']) && $data['facebook_comment']) {
				echo '<fb:comments-count href="'.get_permalink().'"></fb:comments-count>';
			}
			else {
				$comment_count = get_comments_number('0', '1', '%');
				if ($comment_count == 0) {
					$comment_trans = __('No comment', 'themeton');
				} elseif ($comment_count == 1) {
					$comment_trans = __('1 comment', 'themeton');
				} else {
					$comment_trans = $comment_count . ' ' . __('comments', 'themeton');
				} ?>
				<a href="<?php comments_link(); ?>" data-count="<?php echo $comment_count; ?>" title="<?php echo $comment_trans; ?>" class="footer-meta meta-comment"><?php echo $comment_trans; ?></a><?php
			}
		} 
    }    
    $lk = get_post_meta($post->ID, 'post_liked', true);
    $lk = ($lk == '')?'0':$lk;
    if (!isset($_COOKIE['liked-' . $post->ID])) { ?>
        <a  href="<?php echo home_url(); ?>/?like_it=<?php print $post->ID ?>" data-count="<?php echo $lk; ?>" class="footer-meta-like meta-like"><?php
    } else {
        print '<a data-count="'.$lk.'" class="footer-meta-like meta-like liked">';
    }
    $lk = get_post_meta($post->ID, 'post_liked', true);
    $lk = ($lk == '')?'0':$lk; 
    echo $lk." like";
    if(intval($lk)>1){echo 's';}
    ?></a>
	<a class="read-more<?php echo $customlink['klass'];?>" href="<?php echo $customlink['url'];?>"<?php echo $customlink['target'];?>><?php _e('More', 'themeton');?></a>
</footer>