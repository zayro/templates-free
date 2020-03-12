<?php

//FLICKR FEED
class crum_flickr extends WP_Widget {
	function crum_flickr() {
		/* Widget settings. */
		$widget_ops = array( 'classname' => 'Theme: Flickr Feed', 'description' => __( 'Displays your Flickr feed','theory') );
		/* Widget control settings. */
		$control_ops = array( 'width' => 200, 'height' => 350, 'id_base' => 'crum_flickr' );
		/* Create the widget. */
		$this->WP_Widget( 'crum_flickr', 'Theme: Flickr Feed', $widget_ops, $control_ops );
	}
	function widget( $args, $instance ) {


		extract( $args );

		/* User-selected settings. */
	 $title = $instance['title'] ;
    
     $id = $instance['id'];
	 $num = $instance['num'];

        wp_register_script('flikr_feed', get_template_directory_uri() . '/assets/js/jflickrfeed.min.js', false, null, true);
        wp_enqueue_script('flikr_feed');


  /* Before widget (defined by themes). */
		echo $before_widget;
        echo '<div id="flickr" class="flikr clearfix" >';
		/* Title of widget (before and after defined by themes). */
	  if ( $title ) {
        	 echo $before_title;
                echo $title;
             echo $after_title;
        }

		/* Display Latest Tweets */
		if ( $num ) { ?>
          <ul class='row'>

          </ul>
          </div>
        <script type="text/javascript">
            <!--
            jQuery(document).ready(function() {
                jQuery('#flickr .row').jflickrfeed({
                    limit: <?php echo $num; ?>,
                    qstrings: {
                        id: '<?php echo $id; ?>'
                    },
                    itemTemplate: '<li class="span2">' +
                            '<a rel="colorbox" class="zoom" href="{{image}}" title="{{title}}">' +
                            '<img src="{{image_q}}" class=" round" /></a>' +
                            '</li>'
                }, function(data) {
                    <?php if($crum_colorbox) { ?>
                        //jQuery('#flickr a').colorbox();
                        <?php } ?>
                });
            });
            // -->
        </script>

                             
		<?php }

		/* After widget (defined by themes). */
		echo $after_widget;
	}
	function update( $new_instance, $old_instance ) {
		$instance = $old_instance;

		/* Strip tags (if needed) and update the widget settings. */
		$instance['title'] = $new_instance['title'];

		$instance['num'] = strip_tags( $new_instance['num'] );
		$instance['id'] = strip_tags( $new_instance['id'] );

		return $instance;
	}
	function form( $instance ) {

		/* Set up some default widget settings. */
		$defaults = array( 'title' => 'Flickr Photos',  'id'=>'31472375@N06', 'num' => '6' );
		$instance = wp_parse_args( (array) $instance, $defaults ); ?>

   
    <p>
			<label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e( 'Title:','theory'); ?></label>
			<input id="<?php echo $this->get_field_id( 'title' ); ?>" name="<?php echo $this->get_field_name( 'title' ); ?>" value="<?php echo $instance['title']; ?>" style="width:160px" />
		</p>

     <p>
			<label for="<?php echo $this->get_field_id( 'id' ); ?>"><?php _e( 'ID:','theory'); ?></label>
			<input id="<?php echo $this->get_field_id( 'id' ); ?>" name="<?php echo $this->get_field_name( 'id' ); ?>" value="<?php echo $instance['id']; ?>" style="width:160px" />
		</p>
    
		<p>
			<label for="<?php echo $this->get_field_id( 'num' ); ?>"><?php _e( 'Number of photos:','theory'); ?></label>
			<input id="<?php echo $this->get_field_id( 'num' ); ?>" name="<?php echo $this->get_field_name( 'num' ); ?>" value="<?php echo $instance['num']; ?>" style="width:40px" />
		</p>

        <?php
	}
}
?>