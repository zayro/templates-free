<?php
/*
	SHORTCODES
*/


/*
	960 Grid System Shortcodes
	
	[grid_960 type="1"]  - column width: 40px;
	[grid_960 type="2"]  - column width: 100px;
	[grid_960 type="3"]  - column width: 160px;
	[grid_960 type="4"]  - column width: 220px;
	[grid_960 type="5"]  - column width: 280px;
	[grid_960 type="6"]  - column width: 340px;
	[grid_960 type="7"]  - column width: 400px;
	[grid_960 type="8"]  - column width: 460px;
	[grid_960 type="9"]  - column width: 520px;
	[grid_960 type="10"] - column width: 580px;
	[grid_960 type="11"] - column width: 640px;
	[grid_960 type="12"] - column width: 700px;
	[grid_960 type="13"] - column width: 760px;
	[grid_960 type="14"] - column width: 820px;
	[grid_960 type="15"] - column width: 880px;
	[grid_960 type="16"] - column width: 940px;
	
	alpha="1" - left margin: 10px;
	alpha="0" - left margin: 0px;

	omega="1" - right margin: 10px;
	omega="0" - right margin: 0px;

*/

/* separator */
function veles_separator($atts, $content = null) {
	extract(shortcode_atts(array(),$atts));

	return '<div class="separator"></div>';
}
add_shortcode('separator', 'veles_separator');

/* width: 940px */
function one_column($atts, $content = null) {
	extract( shortcode_atts( array( "align" => 'left', "margin" => '1', "last" => '0' ), $atts));
	
	$code = '';
	
	if( ($margin == "1") && ($last == "0")) $code ='<div class="span-24">'.do_shortcode($content).'</div>';	
	if( ($margin == "0") && ($last == "1")) $code ='<div class="span-24 notopmargin last">'.do_shortcode($content).'</div>';		
	if( ($last == "1") && ($margin == "1")) $code ='<div class="span-24 last">'.$content.'</div>';	
	if( ($margin == "0")  && ($last == "0")) $code ='<div class="span-24 notopmargin">'.do_shortcode($content).'</div>';		
	
	
	return $code;
}

add_shortcode('one', 'one_column');


/* width: 460px */
function one_half_column($atts, $content = null) {
	extract( shortcode_atts( array( "align" => 'left', "margin" => '1', "last" => '0' ), $atts));
	
	$code = '';
	
	if( ($margin == "1") && ($last == "0")) $code ='<div class="span-12">'.do_shortcode($content).'</div>';	
	if( ($margin == "0") && ($last == "1")) $code ='<div class="span-12 notopmargin last">'.do_shortcode($content).'</div>';		
	if( ($last == "1") && ($margin == "1")) $code ='<div class="span-12 last">'.do_shortcode($content).'</div>';	
	if( ($margin == "0")  && ($last == "0"))$code ='<div class="span-12 notopmargin">'.do_shortcode($content).'</div>';		
	
	
	return $code;
}

add_shortcode('one_half', 'one_half_column');

/* width: 620px */
function two_third_column($atts, $content = null) {
	extract( shortcode_atts( array( "align" => 'left', "margin" => '1', "last" => '0' ), $atts));
	
	$code = '';
	
	if( ($margin == "1") && ($last == "0")) $code ='<div class="span-16">'.do_shortcode($content).'</div>';	
	if( ($margin == "0") && ($last == "1")) $code ='<div class="span-16 notopmargin last">'.do_shortcode($content).'</div>';		
	if( ($last == "1") && ($margin == "1")) $code ='<div class="span-16 last">'.do_shortcode($content).'</div>';	
	if( ($margin == "0")  && ($last == "0")) $code ='<div class="span-16 notopmargin">'.do_shortcode($content).'</div>';		
	
	
	return $code;
}

add_shortcode('two_third', 'two_third_column');


/* width: 300px */
function one_third_column($atts, $content = null) {
	extract( shortcode_atts( array( "align" => 'left', "margin" => '1', "last" => '0' ), $atts));
	
	$code = '';
	
	if( ($margin == "1") && ($last == "0")) $code ='<div class="span-8">'.do_shortcode($content).'</div>';	
	if( ($margin == "0") && ($last == "1")) $code ='<div class="span-8 notopmargin last">'.do_shortcode($content).'</div>';		
	if( ($last == "1") && ($margin == "1")) $code ='<div class="span-8 last">'.do_shortcode($content).'</div>';	
	if( ($margin == "0")  && ($last == "0")) $code ='<div class="span-8 notopmargin">'.do_shortcode($content).'</div>';		
	
	
	return $code;
}

add_shortcode('one_third', 'one_third_column');


/* width: 220px */
function one_fourth_column($atts, $content = null) {
	extract( shortcode_atts( array( "align" => 'left', "margin" => '1', "last" => '0' ), $atts));
	
	$code = '';
	
	if( ($margin == "1") && ($last == "0")) $code ='<div class="span-6">'.do_shortcode($content).'</div>';	
	if( ($margin == "0") && ($last == "1")) $code ='<div class="span-6 notopmargin last">'.do_shortcode($content).'</div>';		
	if( ($last == "1") && ($margin == "1")) $code ='<div class="span-6 last">'.do_shortcode($content).'</div>';	
	if( ($margin == "0")  && ($last == "0")) $code ='<div class="span-6 notopmargin">'.do_shortcode($content).'</div>';		
	
	
	return $code;
}

add_shortcode('one_fourth', 'one_fourth_column');


/* width: 700px */
function three_fourth_column($atts, $content = null) {
	extract( shortcode_atts( array( "align" => 'left', "margin" => '1', "last" => '0' ), $atts));
	
	$code = '';
	
	if( ($margin == "1") && ($last == "0")) $code ='<div class="span-18">'.do_shortcode($content).'</div>';	
	if( ($margin == "0") && ($last == "1")) $code ='<div class="span-18 notopmargin last">'.do_shortcode($content).'</div>';		
	if( ($last == "1") && ($margin == "1")) $code ='<div class="span-18 last">'.do_shortcode($content).'</div>';	
	if( ($margin == "0")  && ($last == "0")) $code ='<div class="span-18 notopmargin">'.do_shortcode($content).'</div>';		
	
	
	return $code;
}

add_shortcode('three_fourth', 'three_fourth_column');
/* END COLUMNS */



/* Dropcaps */

function dropcap11($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<span class="dropcap">'.do_shortcode($content).'</span>
	';
	return $code;
}

add_shortcode('dropcap1', 'dropcap11');

function dropcap22($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<span class="dropcap2">'.do_shortcode($content).'</span>
	';
	return $code;
}

add_shortcode('dropcap2', 'dropcap22');


function dropcap33($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<span class="dropcap3">'.do_shortcode($content).'</span>
	';
	return $code;
}

add_shortcode('dropcap3', 'dropcap33');

function dropcap44($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<span class="dropcap4">'.do_shortcode($content).'</span>
	';
	return $code;
}

add_shortcode('dropcap4', 'dropcap44');


function dropcap55($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<span class="dropcap5">'.do_shortcode($content).'</span>
	';
	return $code;
}

add_shortcode('dropcap5', 'dropcap55');

/* /Dropcaps */

/* Blockquotes */
function blockquote11($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<p class="blockquote1">'.do_shortcode($content).'</p>
	';
	return $code;
}

add_shortcode('blockquote1', 'blockquote11');

function blockquote22($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<p class="blockquote2">'.do_shortcode($content).'</p>
	';
	return $code;
}

add_shortcode('blockquote2', 'blockquote22');


function blockquote33($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<p class="blockquote3">'.do_shortcode($content).'</p>
	';
	return $code;
}

add_shortcode('blockquote3', 'blockquote33');

function blockquote44($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<p class="blockquote4">'.do_shortcode($content).'</p>
	';
	return $code;
}

add_shortcode('blockquote4', 'blockquote44');


function blockquote55($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<p class="blockquote5">'.do_shortcode($content).'</p>
	';
	return $code;
}

add_shortcode('blockquote5', 'blockquote55');



function blockquote66($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<p class="blockquote6">'.do_shortcode($content).'</p>
	';
	return $code;
}

add_shortcode('blockquote6', 'blockquote66');


function blockquote77($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<p class="blockquote7">'.do_shortcode($content).'</p>
	';
	return $code;
}

add_shortcode('blockquote7', 'blockquote77');


function blockquote88($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<p class="blockquote8">'.do_shortcode($content).'</p>
	';
	return $code;
}

add_shortcode('blockquote8', 'blockquote88');

function blockquote99($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<p class="blockquote9">'.do_shortcode($content).'</p>
	';
	return $code;
}

add_shortcode('blockquote9', 'blockquote99');

/* /Blockquotes */


function awesome_block($atts, $content = null) {
	extract( shortcode_atts( array(  "title" => 'Some Title Here' ), $atts));
	
	$code = '
		<div class="awesome_block">
			<h5>'.do_shortcode($title).'</h5>
			<p class="nobottommargin" style="margin-top:10px;">'.do_shortcode($content).'</p>
		</div>
	';
	return $code;
}

add_shortcode('spec', 'awesome_block');







function discountt($atts, $content = null) {
	extract( shortcode_atts( array(  "percent" => '15' ), $atts));
	
	$code = '
		<div class="discount1">
			<p class="percent">'.do_shortcode($percent).'</p>
			<p class="small-italic nobottommargin">'.do_shortcode($content).'</p>
		</div>
	';
	return $code;
}

add_shortcode('discount', 'discountt');


function coloredd($atts, $content = null) {
	extract( shortcode_atts( array(), $atts));
	
	$code = '
			<span class="colored">'.do_shortcode($content).'</span>
	';
	return $code;
}

add_shortcode('colored', 'coloredd');


function readmoree($atts, $content = null) {
	extract( shortcode_atts( array( "url" =>'#', "content" => 'Read More'), $atts));
	
	$code = '
			<a class="button_readmore" style="font-style:normal"  href='.do_shortcode($url).'>Read More</a>
	';
	return $code;
}

add_shortcode('readmore', 'readmoree');



function skills($atts, $content = null) {
	extract( shortcode_atts( array( "percent" =>'20'), $atts));
	
	$code = '
			<h6>'.do_shortcode($content).'</h6>
			<div class="progress-bar blue stripes">
				<span style="width: '.do_shortcode($percent).'%"></span>
			</div>
	';
	return $code;
}

add_shortcode('skill', 'skills');



