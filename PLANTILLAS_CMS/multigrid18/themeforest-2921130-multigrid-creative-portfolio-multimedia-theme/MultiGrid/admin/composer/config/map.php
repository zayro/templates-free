<?php
/**
 * WPBakery Visual Composer Shortcodes settings
 *
 * @package VPBakeryVisualComposer
 *
 */
WPBMap::map( 'vc_column_text', array(
    "name"		=> __("Text block", "js_composer"),
    "base"		=> "vc_column_text",
    "class"		=> "",
    "icon"      => "icon-wpb-layer-shape-text",
    "wrapper_class" => "clearfix",
    "controls"	=> "full",
    "params"	=> array(
        array(
            "type" => "textarea_html",
            "holder" => "div",
            "class" => "",
            "heading" => __("Text", "js_composer"),
            "param_name" => "content",
            "value" => __("<p>I am text block. Click edit button to change this text.</p>", "js_composer"),
            "description" => __("Enter your content.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    )
) );



/* Latest tweets
---------------------------------------------------------- */
WPBMap::map( 'vc_twitter', array(
    "name"		=> __("Twitter widget", "js_composer"),
    "base"		=> "vc_twitter",
    "class"		=> "wpb_vc_twitter_widget",
	"icon"		=> 'icon-wpb-balloon-twitter-left',
    "params"	=> array(
        array(
            "type" => "textfield",
            "heading" => __("Widget title", "js_composer"),
            "param_name" => "title",
            "value" => "",
            "description" => __("What text use as widget title. Leave blank if no title is needed.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Twitter name", "js_composer"),
            "param_name" => "twitter_name",
            "value" => "",
            "description" => __("Type in twitter profile name from which load tweets.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Tweets count", "js_composer"),
            "param_name" => "tweets_count",
            "value" => array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15),
            "description" => __("How many recent tweets to load.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    )
) );

/* Separator (Divider)
---------------------------------------------------------- */
WPBMap::map( 'vc_separator',  array(
    "name"		=> __("Separator (Divider)", "js_composer"),
    "base"		=> "vc_separator",
    "class"		=> "wpb_vc_separator wpb_controls_top_right",
	'icon'		=> 'icon-wpb-ui-separator',
    "controls"	=> 'popup_delete'
) );

/* Textual block
---------------------------------------------------------- */
WPBMap::map( 'vc_text_separator', array(
    "name"		=> __("Separator (Divider) with text", "js_composer"),
    "base"		=> "vc_text_separator",
    "class"		=> "wpb_controls_top_right",
    "controls"	=> "edit_popup_delete",
	"icon"		=> "icon-wpb-ui-separator-label",
    "params"	=> array(
        array(
            "type" => "textfield",
            "heading" => __("Title", "js_composer"),
            "param_name" => "title",
            "holder" => "div",
            "value" => __("Title", "js_composer"),
            "description" => __("Separator title.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Title position", "js_composer"),
            "param_name" => "title_align",
            "value" => array(__('Align center', "js_composer") => "separator_align_center", __('Align left', "js_composer") => "separator_align_left", __('Align right', "js_composer") => "separator_align_right"),
            "description" => __("Select title location.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    ),
    "js_callback" => array("init" => "wpbTextSeparatorInitCallBack")
) );

/* Message box
---------------------------------------------------------- */
WPBMap::map( 'vc_message', array(
    "name"		=> __("Message box", "js_composer"),
    "base"		=> "vc_message",
    "class"		=> "wpb_vc_messagebox wpb_controls_top_right",
	"icon"		=> "icon-wpb-information-white",
    "wrapper_class" => "alert",
    "controls"	=> "edit_popup_delete",
    "params"	=> array(
        array(
            "type" => "dropdown",
            "heading" => __("Message box type", "js_composer"),
            "param_name" => "color",
            "value" => array(__('Informational', "js_composer") => "alert-info", __('Warning', "js_composer") => "alert-block", __('Success', "js_composer") => "alert-success", __('Error', "js_composer") => "alert-error"),
            "description" => __("Select message type.", "js_composer")
        ),
        array(
            "type" => "textarea_html",
            "holder" => "div",
            "class" => "messagebox_text",
            "heading" => __("Message text", "js_composer"),
            "param_name" => "content",
            "value" => __("<p>I am message box. Click edit button to change this text.</p>", "js_composer"),
            "description" => __("Message text.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    ),
    "js_callback" => array("init" => "wpbMessageInitCallBack")
) );

/* Facebook like button
---------------------------------------------------------- */
WPBMap::map( 'vc_facebook', array(
    "name"		=> __("Facebook like", "js_composer"),
    "base"		=> "vc_facebook",
    "class"		=> "wpb_vc_facebooklike wpb_controls_top_right",
	"icon"		=> "icon-wpb-balloon-facebook-left",
    "controls"	=> "edit_popup_delete",
    "params"	=> array(
        array(
            "type" => "dropdown",
            "heading" => __("Button type", "js_composer"),
            "param_name" => "type",
            "value" => array(__("Standard", "js_composer") => "standard", __("Button count", "js_composer") => "button_count", __("Box count", "js_composer") => "box_count"),
            "description" => __("Select button type.", "js_composer")
        )
    )
) );

/* Tweetmeme button
---------------------------------------------------------- */
WPBMap::map( 'vc_tweetmeme', array(
    "name"		=> __("Tweetmeme button", "js_composer"),
    "base"		=> "vc_tweetmeme",
    "class"		=> "wpb_controls_top_right",
	"icon"		=> "icon-wpb-balloon-twitter-left",
    "controls"	=> "edit_popup_delete",
    "params"	=> array(
        array(
            "type" => "dropdown",
            "heading" => __("Button type", "js_composer"),
            "param_name" => "type",
            "value" => array(__("Horizontal", "js_composer") => "horizontal", __("Vertical", "js_composer") => "vertical", __("None", "js_composer") => "none"),
            "description" => __("Select button type.", "js_composer")
        )
    )
) );

/* Google+ button
---------------------------------------------------------- */
WPBMap::map( 'vc_googleplus', array(
    "name"		=> __("Google+ button", "js_composer"),
    "base"		=> "vc_googleplus",
    "class"		=> "wpb_vc_googleplus wpb_controls_top_right",
	"icon"		=> "icon-wpb-application-plus",
    "controls"	=> "edit_popup_delete",
    "params"	=> array(
        array(
            "type" => "dropdown",
            "heading" => __("Button size", "js_composer"),
            "param_name" => "type",
            "value" => array(__("Standard", "js_composer") => "", __("Small", "js_composer") => "small", __("Medium", "js_composer") => "medium", __("Tall", "js_composer") => "tall"),
            "description" => __("Select button type.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Annotation", "js_composer"),
            "param_name" => "annotation",
            "value" => array(__("Inline", "js_composer") => "inline", __("Bubble", "js_composer") => "", __("None", "js_composer") => "none"),
            "description" => __("Select annotation type.", "js_composer")
        )
    )
) );

/* Google+ button
---------------------------------------------------------- */
WPBMap::map( 'vc_pinterest', array(
    "name"		=> __("Pinterest button", "js_composer"),
    "base"		=> "vc_pinterest",
    "class"		=> "wpb_vc_pinterest wpb_controls_top_right",
	"icon"		=> "icon-wpb-pinterest",
    "controls"	=> "edit_popup_delete",
    "params"	=> array(
        array(
            "type" => "dropdown",
            "heading" => __("Button layout", "js_composer"),
            "param_name" => "type",
            "value" => array(__("Horizontal", "js_composer") => "", __("Vertical", "js_composer") => "vertical", __("No count", "js_composer") => "none"),
            "description" => __("Select button type.", "js_composer")
        )
    )
) );

/* Toggle (FAQ)
---------------------------------------------------------- */
WPBMap::map( 'vc_toggle', array(
    "name"		=> __("FAQ (Toggle)", "js_composer"),
    "base"		=> "vc_toggle",
    "controls"	=> "edit_popup_delete",
    "class"		=> "wpb_vc_faq wpb_controls_top_right",
	"icon"		=> "icon-wpb-toggle-small-expand",
    "params"	=> array(
        array(
            "type" => "textfield",
            "holder" => "h4",
            "class" => "toggle_title",
            "heading" => __("Toggle title", "js_composer"),
            "param_name" => "title",
            "value" => __("Toggle title", "js_composer"),
            "description" => __("Toggle block title.", "js_composer")
        ),
        array(
            "type" => "textarea_html",
            "holder" => "div",
            "class" => "toggle_content",
            "heading" => __("Toggle content", "js_composer"),
            "param_name" => "content",
            "value" => __("<p>Toggle content goes here, click edit button.</p>", "js_composer"),
            "description" => __("Toggle block content.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Default state", "js_composer"),
            "param_name" => "open",
            "value" => array(__("Closed", "js_composer") => "false", __("Open", "js_composer") => "true"),
            "description" => __("Select this if you want toggle to be open by default.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    )
) );

/* Single image */
WPBMap::map( 'vc_single_image', array(
	"name"		=> __("Single image", "js_composer"),
	"base"		=> "vc_single_image",
	"class"		=> "wpb_vc_single_image_widget",
	"icon"		=> "icon-wpb-single-image",
    "params"	=> array(
		array(
			"type" => "attach_image",
			"heading" => __("Image", "js_composer"),
			"param_name" => "image",
			"value" => "",

			"description" => ""
		),
        array(
            "type" => "textfield",
            "heading" => __("Image size", "js_composer"),
            "param_name" => "img_size",
            "value" => "",
            "description" => __("Enter image size. Example: thumbnail, medium, large, full or other sizes defined by current theme. Alternatively enter image size in pixels: 200x100 (Width x Height). Leave empty to use 'thumbnail' size.", "js_composer")
        )
    )
));

/* Gallery/Slideshow
---------------------------------------------------------- */
//WPBMap::map( 'vc_gallery', array(
//    "name"		=> __("Image gallery", "js_composer"),
//    "base"		=> "vc_gallery",
//    "class"		=> "wpb_vc_gallery_widget",
//	"icon"		=> "icon-wpb-images-stack",
//    "params"	=> array(
//        array(
//            "type" => "textfield",
//            "heading" => __("Widget title", "js_composer"),
//            "param_name" => "title",
//            "value" => "",
//            "description" => __("What text use as widget title. Leave blank if no title is needed.", "js_composer")
//        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("Gallery type", "js_composer"),
//            "param_name" => "type",
//            "value" => array(__("Flex slider fade", "js_composer") => "flexslider_fade", __("Flex slider slide", "js_composer") => "flexslider_slide", __("Nivo slider", "js_composer") => "nivo", __("Image grid", "js_composer") => "image_grid"),
//            "description" => __("Select gallery type. Note: Nivo slider is not fully responsive.", "js_composer")
//        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("Auto rotate slides", "js_composer"),
//            "param_name" => "interval",
//            "value" => array(3, 5, 10, 15, 0),
//            "description" => __("Auto rotate slides each X seconds. Select 0 to disable.", "js_composer")
//        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("On click", "js_composer"),
//            "param_name" => "onclick",
//            "value" => array(__("Open prettyPhoto", "js_composer") => "link_image", __("Do nothing", "js_composer") => "link_no", __("Open custom link", "js_composer") => "custom_link"),
//            "description" => __("What to do when slide is clicked?.", "js_composer")
//        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Image size", "js_composer"),
//            "param_name" => "img_size",
//            "value" => "",
//            "description" => __("Enter image size. Example: thumbnail, medium, large, full or other sizes defined by current theme. Alternatively enter image size in pixels: 200x100 (Width x Height). Leave empty to use 'thumbnail' size.", "js_composer")
//        ),
//        array(
//            "type" => "attach_images",
//            "heading" => __("Images", "js_composer"),
//            "param_name" => "images",
//            "value" => "",
//            "description" => ""
//        ),
//        array(
//            "type" => "exploded_textarea",
//            "heading" => __("Custom links", "js_composer"),
//            "param_name" => "custom_links",
//            "description" => __('Select "Open custom link" in "On click" parameter and then enter links for each slide here. Divide links with linebreaks (Enter).', 'js_composer')
//        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Extra class name", "js_composer"),
//            "param_name" => "el_class",
//            "value" => "",
//            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
//        )
//    )
//) );


/* Tabs
   This one is an advanced example. It has javascript
   callbacks in it. So basically in your theme you can do
   whatever you want. More detailed documentation located
   in the advanced documentation folder.
---------------------------------------------------------- */
WPBMap::map( 'vc_tabs', array(
    "name"		=> __("Tabs", "js_composer"),
    "base"		=> "vc_tabs",
    "controls"	=> "full",
    "class"		=> "wpb_tabs not_dropable_in_third_level not-column-inherit",
	"icon"		=> "icon-wpb-ui-tab-content",
    "params"	=> array(
        array(
            "type" => "textfield",
            "heading" => __("Widget title", "js_composer"),
            "param_name" => "title",
            "value" => "",
            "description" => __("What text use as widget title. Leave blank if no title is needed.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Auto rotate slides", "js_composer"),
            "param_name" => "interval",
            "value" => array(0, 3, 5, 10, 15),
            "description" => __("Auto rotate slides each X seconds. Select 0 to disable.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    ),
    "custom_markup" => '
	<div class="tab_controls">
		<button class="add_tab">'.__("Add tab", "js_composer").'</button>
		<button class="edit_tab">'.__("Edit current tab title", "js_composer").'</button>
		<button class="delete_tab">'.__("Delete current tab", "js_composer").'</button>
	</div>

	<div class="wpb_tabs_holder">
		%content%
	</div>',
    'default_content' => '
	<ul>
		<li><a href="#tab-1"><span>'.__('Tab 1', 'js_composer').'</span></a></li>
		<li><a href="#tab-2"><span>'.__('Tab 2', 'js_composer').'</span></a></li>
	</ul>

	<div id="tab-1" class="row-fluid wpb_column_container wpb_sortable_container not-column-inherit">
		[vc_column_text width="1/1"] '.__('I am text block. Click edit button to change this text.', 'js_composer').' [/vc_column_text]
	</div>

	<div id="tab-2" class="row-fluid wpb_column_container wpb_sortable_container not-column-inherit">
		[vc_column_text width="1/1"] '.__('I am text block. Click edit button to change this text.', 'js_composer').' [/vc_column_text]
	</div>',
    "js_callback" => array("init" => "wpbTabsInitCallBack", "shortcode" => "wpbTabsGenerateShortcodeCallBack")
    //"js_callback" => array("init" => "wpbTabsInitCallBack", "edit" => "wpbTabsEditCallBack", "save" => "wpbTabsSaveCallBack", "shortcode" => "wpbTabsGenerateShortcodeCallBack")
) );

/* Tour section
---------------------------------------------------------- */
WPBMap::map( 'vc_tour', array(
    "name"		=> __("Tour section", "js_composer"),
    "base"		=> "vc_tour",
    "controls"	=> "full",
    "class"		=> "wpb_tour not_dropable_in_third_level not-column-inherit",
	"icon"		=> "icon-wpb-ui-tab-content-vertical",
    "wrapper_class" => "clearfix",
    "params"	=> array(
        array(
            "type" => "textfield",
            "heading" => __("Widget title", "js_composer"),
            "param_name" => "title",
            "value" => "",
            "description" => __("What text use as widget title. Leave blank if no title is needed.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Auto rotate slides", "js_composer"),
            "param_name" => "interval",
            "value" => array(0, 3, 5, 10, 15),
            "description" => __("Auto rotate slides each X seconds. Select 0 to disable.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    ),
    "custom_markup" => '
	<div class="tab_controls">
		<button class="add_tab">'.__("Add slide", "js_composer").'</button>
		<button class="edit_tab">'.__("Edit current slide title", "js_composer").'</button>
		<button class="delete_tab">'.__("Delete current slide", "js_composer").'</button>
	</div>

	<div class="wpb_tabs_holder clearfix">
		%content%
	</div>',
    'default_content' => '
	<ul>
		<li><a href="#tab-1"><span>'.__('Slide 1', 'js_composer').'</span></a></li>
		<li><a href="#tab-2"><span>'.__('Slide 2', 'js_composer').'</span></a></li>
	</ul>

	<div id="tab-1" class="row-fluid wpb_column_container wpb_sortable_container not-column-inherit">
		[vc_column_text width="1/1"] '.__('I am text block. Click edit button to change this text.', 'js_composer').' [/vc_column_text]
	</div>

	<div id="tab-2" class="row-fluid wpb_column_container wpb_sortable_container not-column-inherit">
		[vc_column_text width="1/1"] '.__('I am text block. Click edit button to change this text.', 'js_composer').' [/vc_column_text]
	</div>',
    "js_callback" => array("init" => "wpbTabsInitCallBack", "shortcode" => "wpbTabsGenerateShortcodeCallBack")
) );

/* Tour section
---------------------------------------------------------- */
WPBMap::map( 'vc_accordion', array(
    "name"		=> __("Accordion section", "js_composer"),
    "base"		=> "vc_accordion",
    "controls"	=> "full",
    "class"		=> "wpb_accordion not_dropable_in_third_level not-column-inherit",
	"icon"		=> "icon-wpb-ui-accordion",
//	"wrapper_class" => "clearfix",
    "params"	=> array(
        array(
            "type" => "textfield",
            "heading" => __("Widget title", "js_composer"),
            "param_name" => "title",
            "value" => "",
            "description" => __("What text use as widget title. Leave blank if no title is needed.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    ),
    "custom_markup" => '
	<div class="tab_controls">
		<button class="add_tab">'.__("Add section", "js_composer").'</button>
		<button class="edit_tab">'.__("Edit current section title", "js_composer").'</button>
		<button class="delete_tab">'.__("Delete current section", "js_composer").'</button>
	</div>

	<div class="wpb_accordion_holder clearfix">
		%content%
	</div>',
    'default_content' => '
	<div class="group">
		<h3><a href="#">'.__('Section 1', 'js_composer').'</a></h3>
		<div>
			<div class="row-fluid wpb_column_container wpb_sortable_container not-column-inherit">
				[vc_column_text width="1/1"] '.__('I am text block. Click edit button to change this text.', 'js_composer').' [/vc_column_text]
			</div>
		</div>
	</div>
	<div class="group">
		<h3><a href="#">'.__('Section 2', 'js_composer').'</a></h3>
		<div>
			<div class="row-fluid wpb_column_container wpb_sortable_container not-column-inherit">
				[vc_column_text width="1/1"] '.__('I am text block. Click edit button to change this text.', 'js_composer').' [/vc_column_text]
			</div>
		</div>
	</div>',
    "js_callback" => array("init" => "wpbAccordionInitCallBack", "shortcode" => "wpbAccordionGenerateShortcodeCallBack")
) );

/* Teaser grid
---------------------------------------------------------- */
//WPBMap::map( 'vc_teaser_grid', array(
//    "name"		=> __("Teaser (posts) grid", "js_composer"),
//    "base"		=> "vc_teaser_grid",
//    "class"		=> "wpb_vc_teaser_grid_widget",
//	"icon"		=> "icon-wpb-application-icon-large",
//    "params"	=> array(
//        array(
//            "type" => "textfield",
//            "heading" => __("Widget title", "js_composer"),
//            "param_name" => "title",
//            "value" => "",
//            "description" => __("Heading text. Leave it empty if not needed.", "js_composer")
//        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("Columns count", "js_composer"),
//            "param_name" => "grid_columns_count",
//            "value" => array(4, 3, 2, 1),
//            "description" => __("Select columns count.", "js_composer")
//        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Teaser count", "js_composer"),
//            "param_name" => "grid_teasers_count",
//            "value" => "",
//            "description" => __('How many teasers to show? Enter number or "All".', "js_composer")
//        ),
////        array(
////            "type" => "dropdown",
////            "heading" => __("Content", "js_composer"),
////            "param_name" => "grid_content",
////            "value" => array(__("Teaser (Excerpt)", "js_composer") => "teaser", __("Full Content", "js_composer") => "content"),
////            "description" => __("Teaser layout template.", "js_composer")
////        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("Template", "js_composer"),
//            "param_name" => "grid_template",
//            "value" => array(__("Grid", "js_composer") => "grid", __("Carousel", "js_composer") => "carousel", __("Block", "js_composer") => "block"),
//            "description" => __("Teaser layout template.", "js_composer")
//        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("Layout", "js_composer"),
//            "param_name" => "grid_layout",
//            "value" => array(__("Title + Thumbnail + Text", "js_composer") => "title_thumbnail_text", __("Thumbnail + Title + Text", "js_composer") => "thumbnail_title_text", __("Thumbnail + Title + Category", "js_composer") => "thumbnail_title_category", __("Thumbnail + Text", "js_composer") => "thumbnail_text", __("Thumbnail + Title", "js_composer") => "thumbnail_title", __("Thumbnail only", "js_composer") => "thumbnail", __("Title + Text", "js_composer") => "title_text"),
//            "description" => __("Teaser layout in only Grid template.", "js_composer")
//        ),
////        array(
////            "type" => "dropdown",
////            "heading" => __("Link", "js_composer"),
////            "param_name" => "grid_link",
////            "value" => array(__("Link to post", "js_composer") => "link_post", __("Link to bigger image", "js_composer") => "link_image", __("Thumbnail to bigger image, title to post", "js_composer") => "link_image_post", __("No link", "js_composer") => "link_no"),
////            "description" => __("Link type.", "js_composer")
////        ),
////        array(
////            "type" => "textfield",
////            "heading" => __("Thumbnail size", "js_composer"),
////            "param_name" => "grid_thumb_size",
////            "value" => "",
////            "description" => __('Enter thumbnail size. Example: thumbnail, medium, large, full or other sizes defined by current theme. Alternatively enter image size in pixels: 200x100 (Width x Height).', "js_composer")
////        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Thumbnail height", "js_composer"),
//            "param_name" => "grid_thumb_height",
//            "value" => "",
//            "description" => __('Enter thumbnail height in carousel and grid template. Example: 200(pixel).', "js_composer")
//        ),
//        array(
//            "type" => "posttypes",
//            "heading" => __("Post types", "js_composer"),
//            "param_name" => "grid_posttypes",
//            "description" => __("Select post types to populate posts from.", "js_composer")
//        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Post/Page IDs", "js_composer"),
//            "param_name" => "posts_in",
//            "value" => "",
//            "description" => __('Fill this field with page/posts IDs separated by commas (,) to retrieve only them. Use this in conjunction with "Post types" field.', "js_composer")
//        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Exclude Post/Page IDs", "js_composer"),
//            "param_name" => "posts_not_in",
//            "value" => "",
//            "description" => __('Fill this field with page/posts IDs separated by commas (,) to exclude them from query.', "js_composer")
//        ),
//        array(
//            "type" => "exploded_textarea",
//            "heading" => __("Categories", "js_composer"),
//            "param_name" => "grid_categories",
//            "description" => __("If you want to narrow output, enter category names here. Note: Only listed categories will be included. Divide categories with linebreaks (Enter).", "js_composer")
//        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("Order by", "js_composer"),
//            "param_name" => "orderby",
//            "value" => array( "", __("Date", "js_composer") => "date", __("ID", "js_composer") => "ID", __("Author", "js_composer") => "author", __("Title", "js_composer") => "title", __("Modified", "js_composer") => "modified", __("Random", "js_composer") => "rand", __("Comment count", "js_composer") => "comment_count", __("Menu order", "js_composer") => "menu_order" ),
//            "description" => __('Select how to sort retrieved posts. More at <a href="http://codex.wordpress.org/Class_Reference/WP_Query#Order_.26_Orderby_Parameters" target="_blank">WordPress codex page</a>.', 'js_composer')
//        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("Order by", "js_composer"),
//            "param_name" => "order",
//            "value" => array( __("Descending", "js_composer") => "DESC", __("Ascending", "js_composer") => "ASC" ),
//            "description" => __('Designates the ascending or descending order. More at <a href="http://codex.wordpress.org/Class_Reference/WP_Query#Order_.26_Orderby_Parameters" target="_blank">WordPress codex page</a>.', 'js_composer')
//        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Text count", "js_composer"),
//            "param_name" => "text_count",
//            "value" => "150",
//            "description" => __("Enter text count", "js_composer")
//        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Link text", "js_composer"),
//            "param_name" => "link_text",
//            "value" => "View all article",
//            "description" => __('Link text.', "js_composer")
//        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Link url", "js_composer"),
//            "param_name" => "link_url",
//            "value" => "",
//            "description" => __('Link url.', "js_composer")
//        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Extra class name", "js_composer"),
//            "param_name" => "el_class",
//            "value" => "",
//            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
//        )
//    )
//) );

/* Teaser grid
---------------------------------------------------------- */
//WPBMap::map( 'vc_posts_slider', array(
//    "name"		=> __("Posts slider", "js_composer"),
//    "base"		=> "vc_posts_slider",
//    "class"		=> "wpb_vc_posts_slider_widget",
//	"icon"		=> "icon-wpb-slideshow",
//    "params"	=> array(
//        array(
//            "type" => "textfield",
//            "heading" => __("Widget title", "js_composer"),
//            "param_name" => "title",
//            "value" => "",
//            "description" => __("Heading text. Leave it empty if not needed.", "js_composer")
//        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("Slider type", "js_composer"),
//            "param_name" => "type",
//            "value" => array(__("Flex slider fade", "js_composer") => "flexslider_fade", __("Flex slider slide", "js_composer") => "flexslider_slide", __("Nivo slider", "js_composer") => "nivo"),
//            "description" => __("Select slider type. Note: Nivo slider is not fully responsive.", "js_composer")
//        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Slides count", "js_composer"),
//            "param_name" => "count",
//            "value" => "",
//            "description" => __('How many slides to show? Enter number or "All".', "js_composer")
//        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("Auto rotate slides", "js_composer"),
//            "param_name" => "interval",
//            "value" => array(3, 5, 10, 15, 0),
//            "description" => __("Auto rotate slides each X seconds. Select 0 to disable.", "js_composer")
//        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("Description", "js_composer"),
//            "param_name" => "slides_content",
//            "value" => array(__("No description", "js_composer") => "", __("Teaser (Excerpt)", "js_composer") => "teaser" ),
//            "description" => __("Some sliders support description text, what content use for it?", "js_composer")
//        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("Link", "js_composer"),
//            "param_name" => "link",
//            "value" => array(__("Link to post", "js_composer") => "link_post", __("Link to bigger image", "js_composer") => "link_image", __("Open custom link", "js_composer") => "custom_link", __("No link", "js_composer") => "link_no"),
//            "description" => __("Link type.", "js_composer")
//        ),
//        array(
//            "type" => "exploded_textarea",
//            "heading" => __("Custom links", "js_composer"),
//            "param_name" => "custom_links",
//            "description" => __('Select "Open custom link" in "Link" parameter and then enter links for each slide here. Divide links with linebreaks (Enter).', 'js_composer')
//        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Thumbnail size", "js_composer"),
//            "param_name" => "thumb_size",
//            "value" => "",
//            "description" => __('Enter thumbnail size. Example: thumbnail, medium, large, full or other sizes defined by current theme. Alternatively enter image size in pixels: 200x100 (Width x Height).', "js_composer")
//        ),
//        array(
//            "type" => "posttypes",
//            "heading" => __("Post types", "js_composer"),
//            "param_name" => "posttypes",
//            "description" => __("Select post types to populate posts from.", "js_composer")
//        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Post/Page IDs", "js_composer"),
//            "param_name" => "posts_in",
//            "value" => "",
//            "description" => __('Fill this field with page/posts IDs separated by commas (,), to retrieve only them. Use this in conjunction with "Post types" field.', "js_composer")
//        ),
//        array(
//            "type" => "exploded_textarea",
//            "heading" => __("Categories", "js_composer"),
//            "param_name" => "categories",
//            "description" => __("If you want to narrow output, enter category names here. Note: Only listed categories will be included. Divide categories with linebreaks (Enter).", "js_composer")
//        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("Order by", "js_composer"),
//            "param_name" => "orderby",
//            "value" => array( "", __("Date", "js_composer") => "date", __("ID", "js_composer") => "ID", __("Author", "js_composer") => "author", __("Title", "js_composer") => "title", __("Modified", "js_composer") => "modified", __("Random", "js_composer") => "rand", __("Comment count", "js_composer") => "comment_count", __("Menu order", "js_composer") => "menu_order" ),
//            "description" => __('Select how to sort retrieved posts. More at <a href="http://codex.wordpress.org/Class_Reference/WP_Query#Order_.26_Orderby_Parameters" target="_blank">WordPress codex page</a>.', 'js_composer')
//        ),
//        array(
//            "type" => "dropdown",
//            "heading" => __("Order by", "js_composer"),
//            "param_name" => "order",
//            "value" => array( __("Descending", "js_composer") => "DESC", __("Ascending", "js_composer") => "ASC" ),
//            "description" => __('Designates the ascending or descending order. More at <a href="http://codex.wordpress.org/Class_Reference/WP_Query#Order_.26_Orderby_Parameters" target="_blank">WordPress codex page</a>.', 'js_composer')
//        ),
//        array(
//            "type" => "textfield",
//            "heading" => __("Extra class name", "js_composer"),
//            "param_name" => "el_class",
//            "value" => "",
//            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
//        )
//    )
//) );

/* Widgetised sidebar
---------------------------------------------------------- */
WPBMap::map( 'vc_widget_sidebar',  array(
    "name"		=> __("Widgetised Sidebar", "js_composer"),
    "base"		=> "vc_widget_sidebar",
    "controls"	=> "full",
    "class" 	=> "wpb_widget_sidebar_widget",
	"icon"		=> "icon-wpb-layout_sidebar",
    "params"	=> array(
        array(
            "type" => "textfield",
            "heading" => __("Widget title", "js_composer"),
            "param_name" => "title",
            "value" => "",
            "description" => __("What text use as widget title. Leave blank if no title is needed.", "js_composer")
        ),
        array(
            "type" => "widgetised_sidebars",
            "heading" => __("Sidebar", "js_composer"),
            "param_name" => "sidebar_id",
            "value" => "",
            "description" => __("Select which widget area output.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    )
) );


/* Button
---------------------------------------------------------- */
$icons_arr = array(
    __("None", "js_composer") => "none",
    __("Address book icon", "js_composer") => "wpb_address_book",
    __("Alarm clock icon", "js_composer") => "wpb_alarm_clock",
    __("Anchor icon", "js_composer") => "wpb_anchor",
    __("Application Image icon", "js_composer") => "wpb_application_image",
    __("Arrow icon", "js_composer") => "wpb_arrow",
    __("Asterisk icon", "js_composer") => "wpb_asterisk",
    __("Hammer icon", "js_composer") => "wpb_hammer",
    __("Balloon icon", "js_composer") => "wpb_balloon",
    __("Balloon Buzz icon", "js_composer") => "wpb_balloon_buzz",
    __("Balloon Facebook icon", "js_composer") => "wpb_balloon_facebook",
    __("Balloon Twitter icon", "js_composer") => "wpb_balloon_twitter",
    __("Battery icon", "js_composer") => "wpb_battery",
    __("Binocular icon", "js_composer") => "wpb_binocular",
    __("Document Excel icon", "js_composer") => "wpb_document_excel",
    __("Document Image icon", "js_composer") => "wpb_document_image",
    __("Document Music icon", "js_composer") => "wpb_document_music",
    __("Document Office icon", "js_composer") => "wpb_document_office",
    __("Document PDF icon", "js_composer") => "wpb_document_pdf",
    __("Document Powerpoint icon", "js_composer") => "wpb_document_powerpoint",
    __("Document Word icon", "js_composer") => "wpb_document_word",
    __("Bookmark icon", "js_composer") => "wpb_bookmark",
    __("Camcorder icon", "js_composer") => "wpb_camcorder",
    __("Camera icon", "js_composer") => "wpb_camera",
    __("Chart icon", "js_composer") => "wpb_chart",
    __("Chart pie icon", "js_composer") => "wpb_chart_pie",
    __("Clock icon", "js_composer") => "wpb_clock",
    __("Fire icon", "js_composer") => "wpb_fire",
    __("Heart icon", "js_composer") => "wpb_heart",
    __("Mail icon", "js_composer") => "wpb_mail",
    __("Play icon", "js_composer") => "wpb_play",
    __("Shield icon", "js_composer") => "wpb_shield",
    __("Video icon", "js_composer") => "wpb_video"
);

//$colors_arr = array(__("Grey", "js_composer") => "button_grey", __("Yellow", "js_composer") => "button_yellow", __("Green", "js_composer") => "button_green", __("Blue", "js_composer") => "button_blue", __("Red", "js_composer") => "button_red", __("Orange", "js_composer") => "button_orange");
$colors_arr = array(__("Grey", "js_composer") => "btn", __("Blue", "js_composer") => "btn-primary", __("Turquoise", "js_composer") => "btn-info", __("Green", "js_composer") => "btn-success", __("Orange", "js_composer") => "btn-warning", __("Red", "js_composer") => "btn-danger", __("Black", "js_composer") => "btn-inverse");

$size_arr = array(__("Regular size", "js_composer") => "wpb_regularsize", __("Large", "js_composer") => "btn-large", __("Small", "js_composer") => "btn-small", __("Mini", "js_composer") => "btn-mini");

$target_arr = array(__("Same window", "js_composer") => "_self", __("New window", "js_composer") => "_blank");

WPBMap::map( 'vc_button', array(
    "name"		=> __("Button", "js_composer"),
    "base"		=> "vc_button",
    "class"		=> "wpb_vc_button wpb_controls_top_right",
	"icon"		=> "icon-wpb-ui-button",
    "controls"	=> "edit_popup_delete",
    "params"	=> array(
        array(
            "type" => "textfield",
            "heading" => __("Text on the button", "js_composer"),
            "holder" => "button",
            "class" => "btn",
            "param_name" => "title",
            "value" => __("Text on the button", "js_composer"),
            "description" => __("Text on the button.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("URL (Link)", "js_composer"),
            "param_name" => "href",
            "value" => "",
            "description" => __("Button link.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Color", "js_composer"),
            "param_name" => "color",
            "value" => $colors_arr,
            "description" => __("Button color.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Size", "js_composer"),
            "param_name" => "size",
            "value" => $size_arr,
            "description" => __("Button size.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Icon", "js_composer"),
            "param_name" => "icon",
            "value" => $icons_arr
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Target", "js_composer"),
            "param_name" => "target",
            "value" => $target_arr
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    ),
    "js_callback" => array("init" => "wpbButtonInitCallBack", "save" => "wpbButtonSaveCallBack")
    //"js_callback" => array("init" => "wpbCallToActionInitCallBack", "shortcode" => "wpbCallToActionShortcodeCallBack")
) );

WPBMap::map( 'vc_cta_button', array(
    "name"		=> __("Call to action button", "js_composer"),
    "base"		=> "vc_cta_button",
    "class"		=> "button_grey",
	"icon"		=> "icon-wpb-call-to-action",
    "controls"	=> "edit_popup_delete",
    "params"	=> array(
        array(
            "type" => "textfield",
            "heading" => __("Text on the button", "js_composer"),
            "param_name" => "title",
            "value" => __("Text on the button", "js_composer"),
            "description" => __("Text on the button.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("URL (Link)", "js_composer"),
            "param_name" => "href",
            "value" => "",
            "description" => __("Button link.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Color", "js_composer"),
            "param_name" => "color",
            "value" => $colors_arr,
            "description" => __("Button color.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Size", "js_composer"),
            "param_name" => "size",
            "value" => $size_arr,
            "description" => __("Button size.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Icon", "js_composer"),
            "param_name" => "icon",
            "value" => $icons_arr
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Target", "js_composer"),
            "param_name" => "target",
            "value" => $target_arr
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Button position", "js_composer"),
            "param_name" => "position",
            "value" => array(__("Align right", "js_composer") => "cta_align_right", __("Align left", "js_composer") => "cta_align_left", __("Align bottom", "js_composer") => "cta_align_bottom"),
            "description" => __("Select button alignment.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Show button", "js_composer"),
            "param_name" => "show_button",
            "value" => array("show", "hiden"),
            "description" => __("Show button", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Button margin top", "js_composer"),
            "param_name" => "button_margin_top",
            "value" => "",
            "description" => __("Button margin top size. (0 or 15px)", "js_composer")
        ),
        array(
            "type" => "textarea",
            "holder" => "h2",
            "class" => "",
            "heading" => __("Text", "js_composer"),
            "param_name" => "call_text",
            "value" => __("Click edit button to change this text.", "js_composer"),
            "description" => __("Enter your content.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    ),
    "js_callback" => array("init" => "wpbCallToActionInitCallBack", "save" => "wpbCallToActionSaveCallBack")
) );

/* Video element
---------------------------------------------------------- */
WPBMap::map( 'vc_video', array(
    "name"		=> __("Video player", "js_composer"),
    "base"		=> "vc_video",
    "class"		=> "",
	"icon"		=> "icon-wpb-film-youtube",
    "params"	=> array(
        array(
            "type" => "textfield",
            "heading" => __("Widget title", "js_composer"),
            "param_name" => "title",
            "value" => "",
            "description" => __("Heading text. Leave it empty if not needed.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Video link", "js_composer"),
            "param_name" => "link",
            "value" => "",
            "description" => __('Link to the video. More about supported formats at <a href="http://codex.wordpress.org/Embeds#Okay.2C_So_What_Sites_Can_I_Embed_From.3F" target="_blank">WordPress codex page</a>.', "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Video size", "js_composer"),
            "param_name" => "size",
            "value" => "",
            "description" => __('Enter video size in pixels. Example: 200x100 (Width x Height).', "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    )
) );

/* Google maps element
---------------------------------------------------------- */
WPBMap::map( 'vc_gmaps',  array(
    "name"		=> __("Google maps", "js_composer"),
    "base"		=> "vc_gmaps",
    "class"		=> "",
	"icon"		=> "icon-wpb-map-pin",
    "params"	=> array(
        array(
            "type" => "textfield",
            "heading" => __("Widget title", "js_composer"),
            "param_name" => "title",
            "value" => "",
            "description" => __("Heading text. Leave it empty if not needed.", "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Google map link", "js_composer"),
            "param_name" => "link",
            "value" => "",
            "description" => __('Link to your map. Visit <a href="http://maps.google.com" target="_blank">Google maps</a> find your address and then click "Link" button to obtain your map link.', "js_composer")
        ),
        array(
            "type" => "textfield",
            "heading" => __("Map height", "js_composer"),
            "param_name" => "size",
            "value" => "",
            "description" => __('Enter map height in pixels. Example: 200).', "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Map type", "js_composer"),
            "param_name" => "type",
            "value" => array(__("Map", "js_composer") => "m", __("Satellite", "js_composer") => "k", __("Map + Terrain", "js_composer") => "p"),
            "description" => __("Select button alignment.", "js_composer")
        ),
        array(
            "type" => "dropdown",
            "heading" => __("Map Zoom", "js_composer"),
            "param_name" => "zoom",
            "value" => array(__("14 - Default", "js_composer") => 14, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20)
        ),
        array(
            "type" => "textfield",
            "heading" => __("Extra class name", "js_composer"),
            "param_name" => "el_class",
            "value" => "",
            "description" => __("If you wish to style particular content element differently, then use this field to add a class name and then refer to it in your css file.", "js_composer")
        )
    )
) );

WPBMap::map( 'vc_raw_html', array(
	"name"		=> __("Raw html", "js_composer"),
	"base"		=> "vc_raw_html",
	"class"		=> "div",
	"icon"      => "icon-wpb-raw-html",
	"wrapper_class" => "clearfix",
	"controls"	=> "full",
	"params"	=> array(
		array(
			"type" => "textarea_raw_html",
			"holder" => "div",
			"class" => "",
			"heading" => __("Raw HTML", "js_composer"),
			"param_name" => "content",
			"value" => base64_encode("<p>I am raw html block.<br/>Click edit button to change this html</p>"),
			"description" => __("Enter your HTML content.", "js_composer")
		),
	)
) );

WPBMap::map( 'vc_raw_js', array(
	"name"		=> __("Raw js", "js_composer"),
	"base"		=> "vc_raw_js",
	"class"		=> "div",
	"icon"      => "icon-wpb-raw-javascript",
	"wrapper_class" => "clearfix",
	"controls"	=> "full",
	"params"	=> array(
		array(
			"type" => "textarea_raw_html",
			"holder" => "div",
			"class" => "",
			"heading" => __("Raw js", "js_composer"),
			"param_name" => "content",
			"value" => __(base64_encode("alert('Enter your js here!');"), "js_composer"),
			"description" => __("Enter your Js.", "js_composer")
		),
	)
) );

WPBMap::layout(array('id'=>'column_12', 'title'=>'1/2'));
WPBMap::layout(array('id'=>'column_12-12', 'title'=>'1/2 + 1/2'));
WPBMap::layout(array('id'=>'column_13', 'title'=>'1/3'));
WPBMap::layout(array('id'=>'column_13-13-13', 'title'=>'1/3 + 1/3 + 1/3'));
WPBMap::layout(array('id'=>'column_13-23', 'title'=>'1/3 + 2/3'));
WPBMap::layout(array('id'=>'column_14', 'title'=>'1/4'));
WPBMap::layout(array('id'=>'column_14-14-14-14', 'title'=>'1/4 + 1/4 + 1/4 + 1/4'));
WPBMap::layout(array('id'=>'column_16', 'title'=>'1/6'));
WPBMap::layout(array('id'=>'column_11', 'title'=>'1/1'));