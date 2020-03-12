<?php
global $data; 
$use_bg = ''; $background = ''; $custom_bg = ''; $body_face = ''; $use_bg_header =''; $background_header = ''; $custom_bg_header = '';

if(isset($data['background_image'])) {
	$use_bg = $data['background_image'];
}


if(isset($data['background_image_header'])) {
	$use_bg_header = $data['background_image_header'];
}

if($use_bg_header) {

	$custom_bg = $data['body_bg_custom'];
	
	if(!empty($custom_bg)) {
		$bg_img = $custom_bg;
	} else {
		$bg_img = $data['body_bg'];
	}
	
	$bg_prop = $data['body_bg_properties'];
	
	$background = 'url('. $bg_img .') '.$bg_prop ;

}



if($use_bg_header) {

	$custom_bg_header = $data['header_bg_custom'];
	
	if(!empty($custom_bg)) {
		$bg_img_header = $custom_bg;
	} else {
		$bg_img_header = $data['header_bg'];
	}
	
	$bg_prop_header = $data['header_bg_properties'];
	
	$background_header = 'url('. $bg_img_header .') '.$bg_prop_header ;

}

function ieOpacity($opacityIn){
	
	$opacity = explode('.',$opacityIn);
	if($opacity[0] == 1)
		$opacity = 100;
	else
		$opacity = $opacity[1] * 10;
		
	return $opacity;
}

function HexToRGB($hex,$opacity) {
		$hex = ereg_replace("#", "", $hex);
		$color = array();
 
		if(strlen($hex) == 3) {
			$color['r'] = hexdec(substr($hex, 0, 1) . $r);
			$color['g'] = hexdec(substr($hex, 1, 1) . $g);
			$color['b'] = hexdec(substr($hex, 2, 1) . $b);
		}
		else if(strlen($hex) == 6) {
			$color['r'] = hexdec(substr($hex, 0, 2));
			$color['g'] = hexdec(substr($hex, 2, 2));
			$color['b'] = hexdec(substr($hex, 4, 2));
		}
 
		return 'rgba('.$color['r'] .','.$color['g'].','.$color['b'].','.$opacity.')';
	}
	


?>
::selection { background: <?php echo $data['mainColor']; ?>; color: #fff; text-shadow: none; }
body {	 
	background:<?php echo $data['body_background_color']; ?>  url('<?php echo $data['body_bg']; ?>') !important;
	color:<?php echo $data['body_font']['color']; ?>;
	font-family: <?php echo str_replace("%20"," ",$data['body_font']['face']); ?>, "Helvetica Neue", Arial, Helvetica, Verdana, sans-serif;
	font-size: <?php echo $data['body_font']['size']; ?>;
	font-weight: <?php echo $data['body_font']['style']; ?>;
	line-height: 1.65em;
	letter-spacing: normal;
}
h1,h2,h3,h4,h5,h6, .blogpostcategory .posted-date p, .team .title{
	font-family: <?php echo str_replace("%20"," ",$data['heading_font']['face']); ?> !important;
	font-weight: <?php echo $data['heading_font']['style']; ?>;
	line-height: 110%;
}

h1 { 	
	color:<?php echo $data['heading_font_h1']['color']; ?>;
	font-size: <?php echo $data['heading_font_h1']['size'] ?> !important;
	}
	
h2{ 	
	color:<?php echo $data['heading_font_h2']['color']; ?>;
	font-size: <?php echo $data['heading_font_h2']['size'] ?> !important;
	}

h3 { 	
	color:<?php echo $data['heading_font_h3']['color']; ?>;
	font-size: <?php echo $data['heading_font_h3']['size'] ?> !important;
	}

h4 { 	
	color:<?php echo $data['heading_font_h4']['color']; ?>;
	font-size: <?php echo $data['heading_font_h4']['size'] ?> !important;
	}	
	
h5 { 	
	color:<?php echo $data['heading_font_h5']['color']; ?>;
	font-size: <?php echo $data['heading_font_h5']['size'] ?> !important;
	}	

h6 { 	
	color:<?php echo $data['heading_font_h6']['color']; ?>;
	font-size: <?php echo $data['heading_font_h6']['size'] ?> !important;
	}	
h2.title a {color:<?php echo $data['heading_font_h2']['color']; ?>;}
a, a:active, a:visited, .footer_widget .widget_links ul li a{color: <?php echo $data['body_link_coler']; ?>;}	
.widget_nav_menu ul li a  {color: <?php echo $data['body_link_coler']; ?> !important;}
a:hover, h2.title a:hover, .item3 h3:hover, .item4 h3:hover, .item3 h3 a:hover, #portitems2 h3 a:hover {color: <?php echo $data['mainColor']; ?>;}
.item3 h3, .item4 h3, .item3 h3 a, .item4 h3 a, .item3 h4, .item2 h4, .item4 h4, #portitems2 h3 a {color:<?php echo $data['heading_font_h3']['color']; ?>;}
/* ***********************
--------------------------------------
------------NIVO SLIDER----------
--------------------------------------
*********************** */
.homeBox h2 a {color:<?php echo $data['heading_font_h3']['color']; ?>;}
.nivo-caption { 
	position:absolute; 
	background-color: <?php echo$data['slider_backColorNivo'] ?>;
	background-color: <?php echo HexToRGB($data['slider_backColorNivo'],$data['slider_opacity'])?>;
	border: 1px solid <?php echo $data['slider_borderColorNivo']; ?>; 
	color: <?php echo $data['slider_fontSize_colorNivo']['color']; ?>; 
	font-size: <?php echo $data['slider_fontSize_colorNivo']['size']; ?>;
	font-family: <?php echo str_replace("%20"," ",$data['heading_font']['face']); ?> !important;
	text-shadow:0 1px 0 <?php echo HexToRGB($data['ShadowColorFont'],$data['ShadowOpacittyColorFont'])?>;
	letter-spacing: normal;
	padding:5px 15px 5px 5px;
	z-index:99;
	top:50px;
	left:0px;
	text-align:center;
	line-height:120%;
}
a.nivo-nextNav , a.nivo-prevNav {background: url(images/sponsorsArrowsForward.png) 3px 0  <?php echo$data['slider_backColorNivo'] ?>;background: url(images/sponsorsArrowsForward.png) 3px 0  <?php echo HexToRGB($data['slider_backColorNivo'],$data['slider_opacity'])?>;}
a.nivo-prevNav {background: url(images/sponsorsArrowsBack.png) 2px 0  <?php echo$data['slider_backColorNivo'] ?>;background: url(images/sponsorsArrowsBack.png) 2px 0  <?php echo HexToRGB($data['slider_backColorNivo'],$data['slider_opacity'])?>;}

.nivo-caption a { 
	color: <?php echo $data['slider_fontSize_colorNivo']['color']; ?>;  
	text-decoration: underline; 
}	

.caption-content { padding:0px 0px 200px 0px; color:<?php echo $data['slider_fontSize_color']['color']; ?>; font-size: <?php echo $data['slider_fontSize_color']['size']; ?>; font-family: <?php echo str_replace("%20"," ",$data['body_font']['face']); ?>, "Helvetica Neue", Arial, Helvetica, Verdana, sans-serif; text-shadow: 1px 1px 0px black; filter:alpha(opacity=<?php echo ieOpacity($data['slider_opacity']); ?>);letter-spacing: normal;}
.caption-content h1{width:250px !important; background: <?php echo HexToRGB($data['mainColor'],$data['slider_opacity']) ?>;  padding:10px ;text-align:center;  line-height:120%;}
.caption-content h2 {	color:<?php echo $data['slider_fontSize_color']['color'] ;?>!important;
						font-size:<?php echo $data['slider_fontSize_color']['size'] ;?>!important;
						text-shadow: 1px 1px 0px black;}
.caption-content p{ }




.caption-content h1{
	color:<?php echo $data['slider_HfontSize_color']['color'] ;?>!important;
	font-size:<?php echo $data['slider_HfontSize_color']['size'] ;?>!important;
	text-shadow: 1px 1px 0px black;
}

.caption-content h2{
	background: <?php echo HexToRGB($data['slider_backColor'], $data['slider_opacity']); ?>;  padding:10px ;text-align:center;  line-height:120%;
}

#headerwrap, .homeRacent h2 ,.advertise h2,.slider-category .anythingBase,#nslider img, h3#comments ,.related h3, .widget h3, .projectdescription h3, .portsingle .portfolio h3, .titleborderh, .menu-header{
	background:<?php echo $data['body_background_color']; ?>  url('<?php echo $data['body_bg']; ?>') !important;
	}

/* ***********************
--------------------------------------
------------MAIN COLOR----------
--------------------------------------
*********************** */

.catlinkhover,.item h3 a:hover, .item2 h3 a:hover, .item4 h3 a:hover,.homeRacent h3:hover,.catlink:hover,.infotext span, .homeRacent h3 a:hover,
.blogpost .link:hover,.blogpost .postedin:hover ,.blogpost .postedin:hover, .blogpost .link a:hover,.blogpostcategory a.textlink:hover,
.footer_widget .widget_links ul li a:hover, .footer_widget .widget_categories  ul li a:hover,  .footer_widget .widget_archive  ul li a:hover,
#footerb .footernav ul li a:hover,.footer_widget  ul li a:hover,.tags span a:hover,.more-link:hover,.homeBox .one_third a,.showpostpostcontent h1 a:hover,
.menu li ul li:hover a,.menu li a:hover strong,.menu li ul li:hover ul li a,.menu li ul li:hover ul li:hover a,.menu li ul li:hover ul li:hover ul li a,.menu li ul li:hover ul li:hover ul li:hover a,
.menu > li.current-menu-item a strong,.menu > li.current-menu-ancestor a strong,.blogpostcategory .meta .written:hover a ,.blogpostcategory .meta .comments:hover a ,
#wp-calendar a , .widgett a:hover ,.widget_categories li.current-cat a, .widget_categories li.current-cat, .blogpostcategory .meta .time a:hover,.homeRacent h2 span, .advertise h2 span, 
.widget span ,h3#comments span, .related h3 span, .homeremove .catlink .sortingword:hover, .homeremove .catlinkhover .sortingword, .accordion a, .blogpost .datecomment  .link a,.projectdescription h3 span,
.portsingle .portfolio h3 span,.titleborderh span, .textSlide .box, .textSlide .button a, a.recentmore, .blogpostcategory .blogmore
{color:<?php echo $data['mainColor']; ?> !important;}

.homeBox .boxdescwraper {border-color: <?php echo $data['mainColor']; ?> transparent <?php echo $data['mainColor']; ?>  transparent ;text-shadow:0 1px 0 <?php echo HexToRGB($data['ShadowColorFont'],$data['ShadowOpacittyColorFont'])?>;}
.open, .close {border-color: <?php echo $data['mainColor']; ?> <?php echo $data['mainColor']; ?> transparent <?php echo $data['mainColor']; ?>;}
.homeRacent h3.category a, #portitems2 h3.category a, .blogpostcategory .meta .category a, .item4 h4 a,  .tags a, .blogpost .posted-date a, .blogpost .author a, .portcategories a{border-color: <?php echo $data['mainColor']; ?> <?php echo $data['mainColor']; ?>  <?php echo $data['mainColor']; ?> transparent;text-shadow:0 1px 0 <?php echo HexToRGB($data['ShadowColorFont'],$data['ShadowOpacittyColorFont'])?>;}
.blogpostcategory .comment-inside:after {border-color: <?php echo $data['mainColor']; ?> <?php echo $data['mainColor']; ?> transparent  transparent;}
.blogFullWidth .postCategoryRibbon , .item4 h4 a, .blogpost .posted-date a{border-color: <?php echo $data['mainColor']; ?> transparent <?php echo $data['mainColor']; ?>  <?php echo $data['mainColor']; ?> ;}
.advertise .bx-wrapper:hover .bx-next{background: <?php echo $data['mainColor']; ?> url(images/sponsorsArrowsForward.png) no-repeat;margin-left:935px;}
.advertise .bx-wrapper:hover .bx-prev {background: <?php echo $data['mainColor']; ?> url(images/sponsorsArrowsBack.png) no-repeat;margin-left:0px;}
 .page .homeRacent .bx-next,.portprev {background: <?php echo $data['mainColor']; ?> url(images/sponsorsArrowsForward.png) no-repeat;}
 .page .homeRacent .bx-prev,.portnext  {background: <?php echo $data['mainColor']; ?> url(images/sponsorsArrowsBack.png) no-repeat;}
.blogsingleimage .nextbutton.port {background: <?php echo $data['mainColor']; ?> url(images/sponsorsArrowsForward.png) no-repeat 0px -2px;}
.blogsingleimage .prevbutton.port {background: <?php echo $data['mainColor']; ?> url(images/sponsorsArrowsBack.png) no-repeat 0px -2px;}
.homeRacent .overLowerDefault,#portitems2 .overLowerDefault , .item3 .overLowerDefault, .item4 .overLowerDefault {background: <?php echo $data['mainColor']; ?> url(images/magnifyingGlassOverIcon.png);  }
/* ***********************
--------------------------------------
------------BOX COLOR----------
--------------------------------------
*********************** */
#footer,.homeRacent h3, #homeRecent .one_fourth, .item3 h3, .item4 h3, .item3 h3 a, .item4 h3 a ,.homewrap .homesingleleft,.homewrap .homesingleright

{ background:<?php echo $data['boxColor']; ?>}
.homeRacent h3 a, .item4 h3, .item4 h3 a {color:<?php echo $data['body_font']['color']; ?>;}
#remove a, #remove a span{color:<?php echo $data['body_font']['color']; ?>;font-family: <?php echo str_replace("%20"," ",$data['body_font']['face']); ?>, "Helvetica Neue", Arial, Helvetica, Verdana, sans-serif;} 

/* ***********************
--------------------------------------
------------BOX FONT COLOR----------
--------------------------------------
*********************** */

.homeBox .one_fourth h2 a, .homeRacent h3.category a, .blogpostcategory .meta .category a, .tags a, .blogpost .posted-date a, .item4 h4 a, #portitems2 h3.category a, .team .role,.portcategories a,
.wp-pagenavi a:hover, .wp-pagenavi span.current, #respond #commentform input#commentSubmit, #contactform .contactbutton .contact-button, .blogpostcategory .comment-inside a, .blogpostcategory .date-inside,
.content ol.commentlist li .reply a, #commentform #respond #commentform input#commentSubmit, #respond #commentform input#commentSubmit, .pagecontent h1, .pagecontent p, .pagecontent p a, .homeRacent h3.category a:hover,
.homeremove .catlink span, .errorpage .postcontent h2, .errorpage .posttext, .blogpostcategory .date-inside .day, .blogpostcategory .date-inside .month, .textSlide span,textSlide .quote, textSlide .quote2
 {color: <?php echo $data['body_box_coler']; ?> !important;}
.homeremove .catlinkhover .sortingword, .homeremove .catlink .sortingword:hover  {background:<?php echo $data['body_box_coler']; ?>;}
/* ***********************
--------------------------------------
------------MAIN COLOR BOXED----------
--------------------------------------
*********************** */
#contactform  .contactbutton .contact-button:hover, .gototop ,.role, .team .icon img,.pagewrap, .blogpostcategory .posted-date .date-inside, #slider-wrapper,.portfolio .image, .recentimage,.errorpage, .content ol.commentlist li .reply a, .blogpostcategory .comment-inside 
{background:<?php echo $data['mainColor']; ?>;}

.wp-pagenavi a:hover, .wp-pagenavi span.current,#respond #commentform input#commentSubmit, #contactform  .contactbutton .contact-button  {background:<?php echo $data['mainColor']; ?>; text-shadow:0 1px 0 <?php echo HexToRGB($data['ShadowColorFont'],$data['ShadowOpacittyColorFont'])?>;}
.blogpostcategory .comment-inside a, .blogpostcategory .date-inside, .textSlide span,textSlide .quote, textSlide .quote2, .textSlide li {color: <?php echo $data['body_box_coler']; ?> !important; text-shadow:0 1px 0 <?php echo HexToRGB($data['ShadowColorFont'],$data['ShadowOpacittyColorFont'])?>;}
.textSlide .button, .textSlide .box {text-shadow:none;}
/* ***********************
--------------------------------------
------------MAIN BORDER COLOR----------
--------------------------------------
*********************** */
#logo a, .recentborder,.item4 .recentborder, .item3 .recentborder,.afterlinehome,.prelinehome{border-color:<?php echo $data['mainColor']; ?> !important;}


/* ***********************
--------------------------------------
------------BODY COLOR----------
--------------------------------------
*********************** */

.blogpost .link a,.datecomment span,.homesingleleft .tags a,.homesingleleft .postedin a,.blogpostcategory .category a,.blogpostcategory .comments a,
.blogpostcategory a.textlink ,.written a, .blogpostcategory .meta .time a	
{ color:<?php echo $data['body_font']['color']; ?>}


/* ***********************
--------------------------------------
------------MENU----------
--------------------------------------
*********************** */

.menu li:hover ul {border-bottom: 5px solid <?php echo $data['mainColor']; ?>;}
.menu li ul li a{	font-family: <?php echo str_replace("%20"," ",$data['body_font']['face']); ?>, "Helvetica Neue", Arial, Helvetica, Verdana, sans-serif !important; }
.menu > li a {	font-family: <?php echo str_replace("%20"," ",$data['heading_font']['face']); ?> !important; color:#2e2d2d !important;letter-spacing: normal;}
.menu a span{ 	font-family: <?php echo str_replace("%20"," ",$data['body_font']['face']); ?>, "Helvetica Neue", Arial, Helvetica, Verdana, sans-serif  !important; color:#aaa !important;letter-spacing: normal;}
<?php echo $data['heading_font_h1']['color']; ?>

/* ***********************
--------------------------------------
------------BLOG----------
-----------------------------------*/
.blogpostcategory h2 {line-height: 110% !important;}
.wp-pagenavi span.pages {font-family: <?php echo str_replace("%20"," ",$data['body_font']['face']); ?>, "Helvetica Neue", Arial, Helvetica, Verdana, sans-serif;}
.wp-pagenavi a, .showpostpostcontent h1 a {color:<?php echo $data['heading_font_h2']['color']; ?>;}
.wp-pagenavi a:hover, ul.tabs a.current, ul.tabs a:hover, h2.trigger:hover { color:<?php echo $data['mainColor']; ?>; }
.blogpost .datecomment a, .related h4 a, .content ol.commentlist li .comment-author .fn a, .content ol.commentlist li .reply a {color:<?php echo $data['body_font']['color']; ?>;}
.blogpost .datecomment a:hover, .tags a:hover, .related h4 a:hover, .content ol.commentlist li .comment-author .fn a:hover, .content ol.commentlist li .reply a:hover { color:<?php echo $data['mainColor']; ?>; }
.comment-author .fn a{font-family: <?php echo str_replace("%20"," ",$data['heading_font']['face']); ?> !important;}
.image-gallery, .gallery-item { border: 1px dashed <?php echo $data['mainColor']; ?>;}
.blogpostcategory .posted-date p{font-family: <?php echo str_replace("%20"," ",$data['body_font']['face']); ?>, "Helvetica Neue", Arial, Helvetica, Verdana, sans-serif !important;text-shadow:0 1px 0 <?php echo HexToRGB($data['ShadowColorFont'],$data['ShadowOpacittyColorFont'])?>;}
.pagecontent h1, .pagecontent p, .content ol.commentlist li .reply a, .team .role {text-shadow:0 1px 0 <?php echo HexToRGB($data['ShadowColorFont'],$data['ShadowOpacittyColorFont'])?>;}
/* ***********************
--------------------------------------
------------Widget----------
-----------------------------------*/
.wttitle a {color:<?php echo $data['heading_font_h4']['color']; ?>;}

.widgetline{<?php echo $bordersidebar; ?>}
.widgett a:hover, .widget_nav_menu ul li a:hover{color:<?php echo $data['mainColor']; ?> !important;}
.item3 h4, .item2 h4, .item4 h4, .homeRacent h3, #portitems2 h3, .homeBox h2 a span, .widget_nav_menu ul li a{	font-family: <?php echo str_replace("%20"," ",$data['body_font']['face']); ?>, "Helvetica Neue", Arial, Helvetica, Verdana, sans-serif !important; }
.related h4{	font-family: <?php echo str_replace("%20"," ",$data['body_font']['face']); ?>, "Helvetica Neue", Arial, Helvetica, Verdana, sans-serif !important; }
.widget_search form div {	font-family: <?php echo str_replace("%20"," ",$data['body_font']['face']); ?>, "Helvetica Neue", Arial, Helvetica, Verdana, sans-serif !important;}
.widgett a {	font-family: <?php echo str_replace("%20"," ",$data['body_font']['face']); ?>, "Helvetica Neue", Arial, Helvetica, Verdana, sans-serif !important;}
.widget_tag_cloud a{	font-family: <?php echo str_replace("%20"," ",$data['body_font']['face']); ?>, "Helvetica Neue", Arial, Helvetica, Verdana, sans-serif !important;}


/* ***********************
--------------------------------------
------------BUTTONS WITH SHORTCODES----------
--------------------------------------
*********************** */

.button_purche_right_top,.button_download_right_top,.button_search_right_top {font-family: <?php echo str_replace("%20"," ",$data['heading_font']['face']); ?> !important;color:<?php echo $data['heading_font_h2']['color']; ?>;text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);}
.button_purche:hover,.button_download:hover,.button_search:hover {color:<?php echo $data['mainColor']; ?> !important;}
.ribbon_center_red a, .ribbon_center_blue a, .ribbon_center_white a, .ribbon_center_yellow a, .ribbon_center_green a {font-family: <?php echo str_replace("%20"," ",$data['heading_font']['face']); ?> !important;}
