<?php
//Function parses header styles


//Hx styling
for ($i = 1; $i <= 6; $i++) {
    ?>
h<?php echo $i; ?> {
<?php
    $font = parse_typo($data['h' . $i . '_typo'], $data['h' . $i . '_color']);
    ?>
<?php if($font['size'] != '.'){ ?>
    font-size:<?php echo $font['size']; ?>!important;
<?php } ?>
<?php if($font['family'] != '.'){ ?>
    font-family:<?php echo $font['family']; ?>!important;
<?php } ?>
<?php if($font['style'] != '.'){ ?>
    font-style:<?php echo $font['style']; ?>!important;
<?php } ?>
<?php if($font['weight'] != '.'){ ?>
    font-weight:<?php echo $font['weight']; ?>!important;
<?php } ?>
<?php if($font['color']){ ?>
    color: <?php echo $font['color']; ?>!important;
<?php } ?>
}
<?php } ?>


<?php
//Links styling

/*
if ($data['links_color'] != '') {
    echo 'a {color:' . $data['links_color'] . ';}';
} ?>

<?php if ($data['links_color_hover'] != '') {
    echo 'a:hover {color:' . $data['links_color_hover'] . ';}';
} ?>

<?php
if($data["site_boxed"])
    echo "body{\n\tpadding-top:20px;\n}\n";   */
?>

body{
   color:<?php echo $data['body_font_color'] ?>
<?php
if($data['body_font_size'] != '.'){ ?>
   font-size:<?php echo $data['body_font_size']."px" ?>
<?php
    }
?>
}

a {
    color:<?php echo $data['main_link_color'] ?>;
}

a:hover {
    color:<?php echo $data['main_link_color_hover'] ?>;
}

body {
<?php
//Links styling
    if ($data['body_bg_color'] != '')
        echo "\tbackground-color:" . $data['body_bg_color']."!important;\n";
    if ($data['body_font_color'] != '')
        echo "\tcolor:" . $data['body_font_color']."!important;\n";
    if ($data['body_bg_image'] != '')
        echo "\tbackground-image:url(".$data['body_bg_image'].")!important;\n";
    if ($data['body_custom_repeat'] != '')
        echo "\tbackground-repeat:".$data['body_custom_repeat']."!important;\n";
    if ($data['body_bg_fixed'])
        echo "\tbackground-attachment:fixed!important;\n"; ?>
}
#body-wrapper{
    <?php
if( $data['site_boxed'] ) {
    echo "\tmargin:0 auto;\n";
    echo "\tmax-width:1240px;\n";
    echo "\tpadding: 10px 20px;\n";
    echo "\t-webkit-box-shadow: 0px 0px 6px 0px rgba(0, 0, 0, 0.2);
box-shadow: 0px 0px 6px 0px rgba(0, 0, 0, 0.2);\n";

    if ($data['body_wrapper_bg_color'] != '')
        echo "\tbackground-color:" . $data['body_wrapper_bg_color']."!important;\n";
    if ($data['body_wrapper_bg_image'] != '')
        echo "\tbackground-image:url(".$data['body_wrapper_bg_image'].")!important;\n";
    if ($data['body_wrapper_custom_repeat'] != '')
        echo "\tbackground-repeat:".$data['body_wrapper_custom_repeat']."!important;\n";
}
?>
}

#darkf {
<?php
//Links styling
if ($data['footer_bg_color'] != '')
    echo "\tbackground-color:" . $data['footer_bg_color']."!important;\n";
if ($data['footer_font_color'] != '')
    echo "\tcolor:" . $data['footer_font_color']."!important;\n";
if ($data['footer_bg_image'] != '')
    echo "\tbackground-image:url(".$data['footer_bg_image'].")!important;\n";
if ($data['footer_custom_repeat'] != '')
    echo "\tbackground-repeat:".$data['footer_custom_repeat']."!important;\n";

?>
}

.scroll-box .item.even .description{<?php
if ($data['even_slider_elements_bgcolor'] != '')
    echo "\tbackground-color:" . $data['even_slider_elements_bgcolor'].";\n";
if ($data['even_slider_elements_textcolor'] != '')
    echo "\tcolor:" . $data['even_slider_elements_textcolor'].";\n";
?>
}

.scroll-box .item.even .description time{ <?php
if ($data['even_slider_elements_datecolor'] != '')
    echo "\tcolor:" . $data['even_slider_elements_datecolor'].";\n";
?>
}

.scroll-box .item.odd .description{<?php
if ($data['odd_slider_elements_bgcolor'] != '')
    echo "\tbackground-color:" . $data['odd_slider_elements_bgcolor'].";\n";
if ($data['odd_slider_elements_textcolor'] != '')
    echo "\tcolor:" . $data['odd_slider_elements_textcolor'].";\n";
?>
}

.scroll-box .item.odd .description time{ <?php
if ($data['odd_slider_elements_datecolor'] != '')
    echo "\tcolor:" . $data['odd_slider_elements_datecolor'].";\n";
?>
}

<?php
//Custom css
    echo str_replace("&gt;", ">", $data['custom_css']);
?>

<?php
    $blocks = (array)json_decode(str_replace( "+", "\"", $data["block_manager"]));
    foreach($blocks as $block){
        //var_dump((array)$block);
        $block = (array)$block;
        echo "#".$block['id']."{\n";
        echo "\tbackground-color:".$block['color'].";\n";
        echo "\tbackground-image:url(".str_replace('">',"",str_replace('<img src="',"",$block['bgimage'])).");\n";
        echo "}\n";
    }
?>
<?php
global $NHP_Options;
if ($NHP_Options->get("main_menu_position")=='right'){
    echo'#topmenu .tiled-menu{float:right}';
}

?>



