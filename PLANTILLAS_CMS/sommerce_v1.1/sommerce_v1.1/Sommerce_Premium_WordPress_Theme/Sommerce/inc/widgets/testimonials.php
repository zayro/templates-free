<?php

class testimonials extends WP_Widget 
{
    function testimonials() 
    {
		$widget_ops = array( 
            'classname' => 'testimonial-widget', 
            'description' => __('Add a slider testimonial on your widget which link a category to show the contents.', 'yiw') 
        );

		$control_ops = array( 'id_base' => 'testimonial-widget' );

		$this->WP_Widget( 'testimonial-widget', 'Testimonial Widget', $widget_ops, $control_ops );
	}
	
	function widget( $args, $instance ) 
    {
        extract( $args );

		/* User-selected settings. */                  
		if( !isset( $instance['title'] ) )
		    $instance['title'] = '';
		    
		$title = apply_filters('widget_title', $instance['title'] );

		$test_fx = isset( $instance['test_fx']) ? $instance['test_fx'] : 'fade';
		$test_easing_fx = isset( $instance['test_easing_fx']) ? $instance['test_easing_fx'] : false;
		$test_timeout_fx = isset( $instance['test_timeout_fx']) ? $instance['test_timeout_fx'] : 5000;
		$test_speed_fx = isset( $instance['test_speed_fx']) ? $instance['test_speed_fx'] : 500;
		$test_n_items = isset( $instance['test_n_items']) ? $instance['test_n_items'] : 5;
		$size = 32;

        global $more, $post;
        $more = 0;

        $test_posts = new WP_Query("post_type=bl_testimonials&posts_per_page=$test_n_items");

        if( $test_posts->have_posts() )
        {
		    echo $before_widget;

		    if ( $title ) echo $before_title . $title . $after_title;

			echo '<div class="testimonial-text">';
	            echo '<ul>';
			    while( $test_posts->have_posts() )
			    {
	                $test_posts->the_post();
	                
	                echo '<li>';
	                    echo '<blockquote>';
						the_content();     
                        the_title( '<a class="name-testimonial" href="' . get_permalink( get_the_ID() ) . '">[', ' ]</a>' );        
	                    echo '</blockquote>';   
	                echo '</li>';
	            }
	            echo '</ul>';
	            
	            echo '<div class="pagination p-testimonial"></div>';
	        echo '</div>';                        
	        
	        $easing_attr = '';
	        if( $test_easing_fx ) $easing_attr = "easing: '$test_easing_fx',";
            
            $script = "<script type=\"text/javascript\">
                jQuery(document).ready(function($){
                    $('.testimonial-widget ul').cycle({
                        fx:'$test_fx',
                        $easing_attr
                        timeout:$test_timeout_fx,
                        speed:$test_speed_fx, 
                	    pager:'.p-testimonial'
                    });
                });
            </script>";
            
            echo $script;

		    echo $after_widget;
		
		}                        
        
        wp_reset_query();
	}

    function update( $new_instance, $old_instance ) 
    {
		$instance = $old_instance;

		$instance['title'] = strip_tags( $new_instance['title'] );

		$instance['test_n_items'] = $new_instance['test_n_items'];

		$instance['test_fx'] = $new_instance['test_fx'];

		$instance['test_easing_x'] = $new_instance['test_easing_fx'];

		$instance['test_timeout_fx'] = $new_instance['test_timeout_fx'];

		$instance['test_speed_fx'] = $new_instance['test_speed_fx'];

		return $instance;
	}

    function form( $instance ) 
    {
        global $icons_name, $yiw_fxs, $yiw_easings;
        
        
		/* Impostazioni di default del widget */
		$defaults = array( 
            'title' => 'Testimonials', 
            'test_n_items' => 5,
            'test_fx' => 'scrollLeft', 
            'test_easing_fx' => FALSE, 
            'test_timeout_fx' => 8000,  
            'test_speed_fx' => 300  
        );
        
        $yiw_categories = get_categories('hide_empty=1&orderby=name');
        $wp_cats = array();
        
        foreach ($yiw_categories as $category_list ) 
        {
            $wp_cats[$category_list->category_nicename] = $category_list->cat_name;
        }
        
		$instance = wp_parse_args( (array) $instance, $defaults ); ?>
		
		<p>
			<label for="<?php echo $this->get_field_id( 'title' ); ?>">Title:
			     <input type="text" id="<?php echo $this->get_field_id( 'title' ); ?>" name="<?php echo $this->get_field_name( 'title' ); ?>" value="<?php echo $instance['title']; ?>" class="widefat" />
		    </label>
        </p>                
		
		<p>
			<label for="<?php echo $this->get_field_id( 'test_n_items' ); ?>">Items:
			     <select id="<?php echo $this->get_field_id( 'test_n_items' ); ?>" name="<?php echo $this->get_field_name( 'test_n_items' ); ?>">
                    <?php 
                    for($i=1;$i<=20;$i++)
                    {
                        $select = '';
                        if($instance['test_n_items'] == $i) $select = ' selected="selected"';
                        echo "<option value=\"$i\"$select>$i</option>\n";
                    }
                    ?>
			     </select>
		    </label>
        </p>               
		
		<p>
			<label for="<?php echo $this->get_field_id( 'test_fx' ); ?>">Effect Slider:
			     <select id="<?php echo $this->get_field_id( 'test_fx' ); ?>" name="<?php echo $this->get_field_name( 'test_fx' ); ?>">
                    <?php
                    foreach($yiw_fxs as $fx)
                    {
                        $select = '';
                        if($instance['test_fx'] == $fx) $select = ' selected="selected"';
                        echo "<option value=\"$fx\"$select>$fx</option>\n";
                    }
                    ?>
			     </select>
		    </label>
        </p>            
		
		<p>
			<label for="<?php echo $this->get_field_id( 'test_easing_fx' ); ?>">Easing effect:
			     <select id="<?php echo $this->get_field_id( 'test_easing_fx' ); ?>" name="<?php echo $this->get_field_name( 'test_easing_fx' ); ?>">
                    <?php
                    foreach($yiw_easings as $easing)
                    {
                        $select = '';
                        if($instance['test_easing_fx'] == $easing) $select = ' selected="selected"';
                        echo "<option value=\"$easing\"$select>$easing</option>\n";
                    }
                    ?>
			     </select>
		    </label>
        </p>        
		
		<p>
			<label for="<?php echo $this->get_field_id( 'test_timeout_fx' ); ?>">Timeout effect (ms):
			     <input type="text" id="<?php echo $this->get_field_id( 'test_timeout_fx' ); ?>" name="<?php echo $this->get_field_name( 'test_timeout_fx' ); ?>" value="<?php echo $instance['test_timeout_fx']; ?>" size="4" />
		    </label>
        </p>          
		
		<p>
			<label for="<?php echo $this->get_field_id( 'test_speed_fx' ); ?>">Speed Animation (ms):
			     <input type="text" id="<?php echo $this->get_field_id( 'test_speed_fx' ); ?>" name="<?php echo $this->get_field_name( 'test_speed_fx' ); ?>" value="<?php echo $instance['test_speed_fx']; ?>" size="4" />
		    </label>
        </p>
    <?php
    }
}

?>
