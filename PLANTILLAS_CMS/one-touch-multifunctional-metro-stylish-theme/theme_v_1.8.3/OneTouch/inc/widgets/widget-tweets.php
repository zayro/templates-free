<?php

function cruminaErrorHandler($errno, $errstr, $errfile, $errline)
{
    if (E_RECOVERABLE_ERROR === $errno) {
        throw new ErrorException($errstr, $errno, 0, $errfile, $errline);
    }
    return false;
}

set_error_handler('cruminaErrorHandler');

//LATEST TWEETS
class crum_latest_tweets extends WP_Widget
{
    function crum_latest_tweets()
    {
        /* Widget settings. */
        $widget_ops = array('classname' => 'twitter-widget', 'description' => __('Displays your latest Tweets', 'theory'));
        /* Widget control settings. */
        $control_ops = array('width' => 200, 'height' => 350, 'id_base' => 'crum_latest_tweets');
        /* Create the widget. */
        $this->WP_Widget('crum_latest_tweets', 'Theme: Latest Tweets', $widget_ops, $control_ops);
    }

    function widget($args, $instance)
    {
        extract($args);
        include_once(ABSPATH . WPINC . '/feed.php');
        $title = $instance['title'];
        $subtitle = $instance['subtitle'];
        $num = $instance['num'];
        $username = $instance['username'];
        $refresh = $instance['refresh'];

        if ($username == "") $username = "Crumina";
        echo $before_widget;

        if ( $subtitle ) {
            echo '<div class="subtitle">';
            echo $subtitle;
            echo '</div>';
        }
        if ($title) {
            echo $before_title;
            echo $title;
            echo $after_title;
        }

        if( $this->is_cache_expired($refresh, $num) ){

            $screen_url = 'http://api.twitter.com/1/statuses/user_timeline.json?&screen_name=' . $username . '&count=' . $num;

            $user_timeline = wp_remote_get( $screen_url );

            if ( !($user_timeline instanceof WP_Error) ){
                $user_timeline = json_decode( $user_timeline["body"] );
                $this->cache_tweets( $user_timeline );
            } else {
                $user_timeline = $this->get_tweets_from_cache();
            }
        } else {
            $user_timeline = $this->get_tweets_from_cache();
        }

        $this->print_tweets($user_timeline);

        echo $after_widget;
    }

    function get_tweets_from_cache(){
        $user_timeline = get_option("crumina_twitter_cache");
        unset( $user_timeline['time'] );
        return $user_timeline;
    }

    function is_cache_expired( $refresh, $num ){
        $options = get_option("crumina_twitter_cache");
        if( !isset($options['time']) || ( (time() - $options['time']) > (int)$refresh ) || ($num != (count($options) - 1)) ){
            return true;
        } else {
            return false;
        }

    }

    function cache_tweets( $user_timeline ) {
        $user_timeline['time'] = time();
        update_option( "crumina_twitter_cache", $user_timeline );
    }

    function print_tweets($user_timeline){
        foreach( $user_timeline as $tweet ){
            echo "<div class='tweet'>";
            $post = $tweet->text;
            $post = preg_replace("#http://[^<\s\n]+#", "<a href='\\0' target='_blank'>\\0</a>", $post);
            $post = preg_replace("/#\\w+/", "<a href='https://twitter.com/search?q=\\0&src=hash' target='_blank'>\\0</a>", $post);
            $post = str_replace("/search?q=#", "/search?q=%23", $post);
            $post = '<a href="https://twitter.com/'.$tweet->user->screen_name.'">'.$tweet->user->name.': </a>'.$post ;
            echo $post . "<br/>";
            echo "<div class='time'>" . human_time_diff(get_the_time(strtotime($tweet->created_at)), current_time('timestamp')) . ' ago</div>';
            echo '</div>';
        }
    }

    function update($new_instance, $old_instance)
    {
        $instance = $old_instance;

        /* Strip tags (if needed) and update the widget settings. */
        $instance['title'] = $new_instance['title'];
        $instance['subtitle'] = strip_tags( $new_instance['subtitle'] );
        $instance['num'] = strip_tags($new_instance['num']);
        $instance['username'] = strip_tags($new_instance['username']);
        $instance['refresh'] = strip_tags($new_instance['refresh']);

        return $instance;
    }

    function form($instance)
    {

        /* Set up some default widget settings. */
        $defaults = array('title' => 'Latest Tweets', 'subtitle' => '', 'num' => '1', 'username' => 'Crumina', 'refresh' => '60');
        $instance = wp_parse_args((array)$instance, $defaults); ?>

    <p>
      <label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e( 'Title:','theory'); ?></label>
      <input class="widefat" id="<?php echo $this->get_field_id( 'title' ); ?>" name="<?php echo $this->get_field_name( 'title' ); ?>" value="<?php echo $instance['title']; ?>" style="width:160px" />
    </p>
    <p>
      <label for="<?php echo $this->get_field_id( 'subtitle' ); ?>"><?php _e( 'Subtitle:','theory'); ?></label>
      <input class="widefat" id="<?php echo $this->get_field_id( 'subtitle' ); ?>" name="<?php echo $this->get_field_name( 'subtitle' ); ?>" value="<?php echo $instance['subtitle']; ?>" style="width:160px" />
    </p>


    <p>
      <label for="<?php echo $this->get_field_id('username'); ?>"><?php _e('Username:', 'theory'); ?></label>
      <input class="widefat" id="<?php echo $this->get_field_id('username'); ?>" name="<?php echo $this->get_field_name('username'); ?>" value="<?php echo $instance['username']; ?>" style="width:130px"/>
    </p>

    <p>
      <label for="<?php echo $this->get_field_id('num'); ?>"><?php _e('Number of Tweets:', 'theory'); ?></label>
      <input class="widefat" id="<?php echo $this->get_field_id('num'); ?>" name="<?php echo $this->get_field_name('num'); ?>" value="<?php echo $instance['num']; ?>" style="width:40px"/>
    </p>

    <p>
      <label for="<?php echo $this->get_field_id('refresh'); ?>"><?php _e('Cache refresh every', 'theory'); ?></label>
      <input class="widefat" id="<?php echo $this->get_field_id('refresh'); ?>" name="<?php echo $this->get_field_name('refresh'); ?>" value="<?php echo $instance['refresh']; ?>" style="width:40px"/>
        <?php _e('seconds', 'theory'); ?>
    </p>
    <?php
    }
}