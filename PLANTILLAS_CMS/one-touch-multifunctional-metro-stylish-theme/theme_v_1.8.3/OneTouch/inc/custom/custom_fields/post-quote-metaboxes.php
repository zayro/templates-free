<?php

require_once ("common.php");

// Add the Meta Box
function post_quote_custom_fields() {
    add_meta_box(
        'post_quote_custom_fields', // $id
        'Post Format quote fields', // $title
        'show_post_quote_custom_fields', // $callback
        'post', // $page
        'normal', // $context
        'high'); // $priority
}
add_action('add_meta_boxes', 'post_quote_custom_fields');

// Field Array
$prefix = 'post_custom_';
$post_quote_meta_custom_fields = array(
    array(
        'label' => 'Quote author',
        'desc'	=> '',
        'id'	=> 'quote_author',
        'type'	=> 'text'
    ),
);

function show_post_quote_custom_fields() {
    global $post_quote_meta_custom_fields, $post;
    CF_print_metabox( $post_quote_meta_custom_fields, $post, basename(__FILE__) );
}

// Save the Data
function save_post_quote_custom_meta($post_id) {
    global $post_quote_meta_custom_fields;
    CF_save_metabox($post_quote_meta_custom_fields, $post_id, basename(__FILE__));
}
add_action('save_post', 'save_post_quote_custom_meta');