		<?php        
			if ( ! yiw_can_show_slider() )
				return;
			
			$slider = yiw_slider_type();
			if ( $slider != 'none' )
			     get_template_part( 'slider', $slider ); 
		?>       