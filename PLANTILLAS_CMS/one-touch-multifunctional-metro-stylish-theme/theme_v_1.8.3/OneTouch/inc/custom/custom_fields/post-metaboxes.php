<?php

require_once ("common.php");

// Add the Meta Box
function post_custom_fields() {
    add_meta_box(
        'post_custom_fields', // $id
        'Display Posts Options', // $title
        'show_post_custom_fields', // $callback
        'post', // $page
        'normal', // $context
        'high'); // $priority
}
add_action('add_meta_boxes', 'post_custom_fields');

// Field Array
$prefix = 'post_custom_';
$post_meta_custom_fields = array(
    array(
        'label' => 'Not display on slider',
        'desc'	=> 'If is checked, this post is excluding from slider',
        'id'	=> 'display_post_in_slider',
        'type'	=> 'checkbox'
    ),
    array(
        'label' =>  'Display full width post, on single post page.',
        'desc'	=> 'If is checked, post will be displayed on the full width of single page. All sidebars will be hidden',
        'id'	=> 'full_width_post',
        'type'	=> 'checkbox'
    ),
    array (
        'label' => 'Post description display',
        'desc'	=> 'How is displayed post in recent posts on main page',
        'id'	=> 'post_description_display',
        'type'	=> 'radio',
        'options' => array (
            'one' => array (
                'label' => 'Display short description',
                'value'	=> 'show'
            ),
            'two' => array (
                'label' => 'Hide description',
                'value'	=> 'hide'
            ),
        )
    )
);

function show_post_custom_fields() {
    global $post_meta_custom_fields, $post;

    CF_print_metabox( $post_meta_custom_fields, $post, basename(__FILE__) );
}

// Save the Data
function save_post_custom_meta($post_id) {
    global $post_meta_custom_fields;
    CF_save_metabox($post_meta_custom_fields, $post_id, basename(__FILE__));
}
add_action('save_post', 'save_post_custom_meta');