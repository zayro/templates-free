/*----------------------  Body --------------------------*/
body {
<?php if(isset($data['general_font'])) {
    echo "color: ".$data['general_font']['color'].";\n";
    echo "font: ".$data['general_font']['style']." ".$data['general_font']['size']."/".$data['general_font']['height']." ".$data['general_font']['face'].";\n";        
    }
    if($data['custom_bg_enable']) {
        echo "background: ".$data['bg_options']['color']." url(".($data['custom_bg']!='' ? $data['custom_bg'] : "").") ".$data['bg_options']['repeat']." ".$data['bg_options']['attachment']." ".$data['bg_options']['position'].";\n";
    } else { if(!strpos($data['bg_pattern'],"/no.png")) {
        echo "background: ".$data['bg_color']." url(".$data['bg_pattern'].") repeat 0 0;\n";
        } 
    } ?>
}
<?php if(isset($data['menu_font'])) {
    echo "#menu > li > a, #menu ul.children li a {\n";
    echo "font: ".$data['menu_font']['style']." ".$data['menu_font']['size']."/".$data['menu_font']['height']." ".$data['general_font']['face'].";\n";
    echo "}\n";
}
?>
<?php
if($data['blog_title']) {
    echo ".entry-title a, h2.entry-title, h2.item-title {\n";
    echo "font: ".$data['blog_title']['style']." ".$data['blog_title']['size']."/".$data['blog_title']['height']." ".$data['general_font']['face'].";\n";
    echo "}\n";
}
if($data['single_title']) {
    echo "h1.title {\n";
    echo "font: ".$data['single_title']['style']." ".$data['single_title']['size']."/".$data['single_title']['height']." ".$data['general_font']['face'].";\n";	
    echo "}\n";
}
if($data['sidebar_title']) {
    echo "h3.widget-title {\n";
    echo "font: ".$data['sidebar_title']['style']." ".$data['sidebar_title']['size']."/".$data['sidebar_title']['height']." ".$data['general_font']['face'].";\n";
    echo "}\n";
}
echo $data['custom_css'];