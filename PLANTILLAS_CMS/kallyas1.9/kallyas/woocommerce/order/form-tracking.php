<?php
/**
 * Order tracking form
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     1.6.4
 */

global $woocommerce, $post;
?>

<form action="<?php echo esc_url( get_permalink($post->ID) ); ?>" method="post" class="track_order">

	<p><?php _e('To track your order please enter your Order ID in the box below and press return. This was given to you on your receipt and in the confirmation email you should have received.', THEMENAME); ?></p>

	<p class="form-row form-row-first"><label for="orderid"><?php _e('Order ID', THEMENAME); ?></label> <input class="input-text" type="text" name="orderid" id="orderid" placeholder="<?php _e('Found in your order confirmation email.', THEMENAME); ?>" /></p>
	<p class="form-row form-row-last"><label for="order_email"><?php _e('Billing Email', THEMENAME); ?></label> <input class="input-text" type="text" name="order_email" id="order_email" placeholder="<?php _e('Email you used during checkout.', THEMENAME); ?>" /></p>
	<div class="clear"></div>

	<p class="form-row"><input type="submit" class="btn" name="track" value="<?php _e('Track"', THEMENAME); ?>" /></p>
	<?php $woocommerce->nonce_field('order_tracking') ?>

</form>