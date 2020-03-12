				<?php  
					$current_user = wp_get_current_user();
					
					if ( ! yiw_get_option( 'show_linksbar' ) )
						return;
				?>
				<ul id="linksbar" class="group">
		            
		            <?php if ( yiw_get_option( 'show_linksbar_cart' ) ) : ?>
		        	<li class="icon cart">
						<?php yiw_minicart(); ?>
					</li>         
		        	<?php endif; ?>
		            
		            <?php if ( yiw_get_option( 'show_linksbar_signin' ) && ! $current_user->ID ) : ?>
		        	<li class="icon pencil">
						<a href="<?php echo home_url() ?>/wp-login.php?action=register"><?php _e('Sign in', 'yiw') ?></a> | 
					</li>         
		        	<?php endif; ?>
		            
		            <?php if ( yiw_get_option( 'show_linksbar_login' ) ) : ?>
		        	<li class="icon lock">
		        		<?php if ( $current_user->ID != 0 ) : ?>                       
						<a href="<?php echo wp_logout_url( yiw_curPageURL() ); ?>"><?php _e('Logout', 'yiw') ?></a> |
						<?php else : ?>      
						<a href="<?php echo wp_login_url( yiw_curPageURL() ); ?>"><?php _e('Login', 'yiw') ?></a> |  
						<?php endif; ?>
					</li>         
		        	<?php endif; ?>   
		        	
		        	<?php 
						$args = array(
							'container' => 'none', 
							'fallback_cb' => 'wp_page_menu', 
							'items_wrap' => '%3$s',
							'after' => ' | ',
	        				'depth' => 1, 
							'theme_location' => 'linksbar',
							'fallback_cb' => ''
						);
						
						wp_nav_menu( $args );
					?>
		        
		        </ul>