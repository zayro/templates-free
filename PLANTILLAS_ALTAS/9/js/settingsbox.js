// SETTINGS BOX

$(document).ready(function(){
    $('.customPanel').each(function(){
        var t_toggle_time = 500;   //duration of the panel toggle animation in milisecons
        var t_menu_fonts = [   //fonts data (name, link and css) for the top menu
            {
                name:"Lato",
                link:"http://fonts.googleapis.com/css?family=Lato:300,400,700",
                css:"'Lato', sans-serif"
            },
            {   
                name:"Metrophobic",
                link:"http://fonts.googleapis.com/css?family=Metrophobic",
                css:"'Metrophobic', sans-serif"
            },
            {
                name:"Telex",
                link:"http://fonts.googleapis.com/css?family=Telex>",
                css:"'Telex', sans-serif"
            },
            {
                name:"Questrial",
                link:"http://fonts.googleapis.com/css?family=Questrial",
                css:"'Questrial', sans-serif"
            },
            {
                name:"Open sans",
                link:"http://fonts.googleapis.com/css?family=Open+Sans:400,700,300",
                css:"'Open Sans', sans-serif"
            },
            {
                name:"Oxygen",
                link:"http://fonts.googleapis.com/css?family=Oxygen",
                css:"'Oxygen', sans-serif"
            },
            {
                name:"Gudea",
                link:"http://fonts.googleapis.com/css?family=Gudea:400,700",
                css:"'Gudea', sans-serif"
            },
            {
                name:"Imprima",
                link:"http://fonts.googleapis.com/css?family=Imprima",
                css:"'Imprima', sans-serif"
            },
            {
                name:"Ubuntu",
                link:"http://fonts.googleapis.com/css?family=Ubuntu:300,400,700",
                css:"'Ubuntu', sans-serif"
            },
            {
                name:"Pontano sans",
                link:"http://fonts.googleapis.com/css?family=Pontano+Sans",
                css:"'Pontano Sans', sans-serif"
            },
            {
                name:"Ropa sans",
                link:"http://fonts.googleapis.com/css?family=Ropa+Sans",
                css:"'Ropa Sans', sans-serif"
            },
            {
                name:"Oswald",
                link:"http://fonts.googleapis.com/css?family=Oswald:400,700,300",
                css:"'Oswald', sans-serif"
            },
            {
                name:"Armata",
                link:"http://fonts.googleapis.com/css?family=Armata",
                css:"'Armata', sans-serif"
            },
            {
                name:"Numans",
                link:"http://fonts.googleapis.com/css?family=Numans",
                css:"'Numans', sans-serif"
            },
            {
                name:"Asap",
                link:"http://fonts.googleapis.com/css?family=Asap:400,700",
                css:"'Asap', sans-serif"
            }
        ];
        var t_text_fonts = [   //fonts data (name, link and css) for text
            {
                name:"Open sans",
                link:"http://fonts.googleapis.com/css?family=Open+Sans:400,700,300",
                css:"'Open Sans', sans-serif"
            },
			{
                name:"Lato",
                link:"http://fonts.googleapis.com/css?family=Lato:300,400,700",
                css:"'Lato', sans-serif"
            },
			{
                name: "PT Sans Narrow",
                link: "http://fonts.googleapis.com/css?family=PT+Sans+Narrow",
                css: "'PT Sans Narrow', sans-serif"
            },
            {
                name:"Varela",
                link:"http://fonts.googleapis.com/css?family=Varela",
                css:"'Varela', sans-serif"
            },
            {
                name:"Droid sans",
                link:"http://fonts.googleapis.com/css?family=Droid+Sans:400,700",
                css:"'Droid Sans', sans-serif"
            },

            {
                name:"Pt Sans Caption",
                link:"http://fonts.googleapis.com/css?family=PT+Sans+Caption:400,700",
                css:"'PT Sans Caption', sans-serif"
            },
            {
                name:"Magra",
                link:"http://fonts.googleapis.com/css?family=Magra:400,700",
                css:"'Magra', sans-serif"
            },
            {
                name:"Chivo",
                link:"http://fonts.googleapis.com/css?family=Chivo",
                css:"'Chivo', sans-serif"
            },
            {
                name:"Verdana",
                link:"",
                css:"'Verdana', sans-serif"
            },
            {
                name:"Tahoma",
                link:"",
                css:"'Tahoma', sans-serif"
            },
            {
                name:"Arial",
                link:"",
                css:"'Arial', sans-serif"
            }
        ];
        var t_title_fonts = [   //fonts data (name, link and css) for title
			{
                name: "Oswald",
                link: "http://fonts.googleapis.com/css?family=Oswald:400,300,700",
                css: "'Oswald', sans-serif"
            },
            {
                name: "PT Sans Narrow",
                link: "http://fonts.googleapis.com/css?family=PT+Sans+Narrow",
                css: "'PT Sans Narrow', sans-serif"
            },
            {
                name:"Varela",
                link:"http://fonts.googleapis.com/css?family=Varela",
                css:"'Varela', sans-serif"
            },
            {
                name:"Open sans",
                link:"http://fonts.googleapis.com/css?family=Open+Sans:400,700,300",
                css:"'Open Sans', sans-serif"
            },
            {
                name:"Lato",
                link:"http://fonts.googleapis.com/css?family=Lato:300,400,700",
                css:"'Lato', sans-serif"
            },
            {
                name:"Droid sans",
                link:"http://fonts.googleapis.com/css?family=Droid+Sans:400,700",
                css:"'Droid Sans', sans-serif"
            },
            {
                name:"Pt Sans Caption",
                link:"http://fonts.googleapis.com/css?family=PT+Sans+Caption:400,700",
                css:"'PT Sans Caption', sans-serif"
            },
            {
                name:"Magra",
                link:"http://fonts.googleapis.com/css?family=Magra:400,700",
                css:"'Magra', sans-serif"
            },
            {
                name:"Chivo",
                link:"http://fonts.googleapis.com/css?family=Chivo",
                css:"'Chivo', sans-serif"
            },
            {
                name:"Verdana",
                link:"",
                css:"'Verdana', sans-serif"
            },
            {
                name:"Tahoma",
                link:"",
                css:"'Tahoma', sans-serif"
            },
            {
                name:"Arial",
                link:"",
                css:"'Arial', sans-serif"
            }
        ];
        var t_menu_css = $('#header .topmenu li a');   //selector for elements to change menu font
        var t_text_css = $('body');   //selector for elements to change text font
        var t_title_css = $('.container .title, .container #subscribe .subscribebutton, .container #miniportfolio .time, .container #miniportfolio h3, #project h3, #footer h3');   //selector for elements to change title font
        var t = $(this);
        var t_width = t.outerWidth(true);
        var t_options = t.children('.customPanelOptions');
        var t_menu_font_select = t_options.children('select[name="menu-font"]');
        var t_text_font_select = t_options.children('select[name="text-font"]');
        var t_title_font_select = t_options.children('select[name="title-font"]');
        var t_button = t.children('.customPanelButton');
        var t_default = t_options.children('.customPanelOptionsDefault');
        var t_color = t_options.children('.customPanelOptionsColor');
        var t_color_default = '#f1f1f1';   //default background color
        var t_color_default_site = '#28B8FF';   //default site color
        var t_texture = t_options.children('.customPanelOptionsTexture');
        var t_layout_changed = false;
        var t_color_current_class = '';
        var t_texture_current_class = '';
        var t_change_backgroundcolor = $('body');   //elements for which to change the background
        var t_dom = $('');   //elements for which to change the layout
        var t_picker_button = t_options.children('.customPanelOptionsPickerButton.customPanelOptionsPickerButtonBackground');
        var t_picker_button_site = t_options.children('.customPanelOptionsPickerButton.customPanelOptionsPickerButtonSite');
        var t_picker_box = $('.customPanelOptionsPicker.customPanelOptionsPickerBackground');
        var t_picker_box_site = $('.customPanelOptionsPicker.customPanelOptionsPickerSite');
        var t_picker = $.farbtastic('.customPanelOptionsPicker.customPanelOptionsPickerBackground');
        var t_picker_site = $.farbtastic('.customPanelOptionsPicker.customPanelOptionsPickerSite');
        var t_style = $('<style>');
        $('head').append(t_style);
        t_picker.setColor(t_color_default);
        t_picker_site.setColor(t_color_default_site);
        t_picker.linkTo(function(color){
            t_boxed_layout_function();
            if(t_color_current_class!=''){
                t_change_backgroundcolor.removeClass(t_color_current_class);
                t_color_current_class = '';
            }
            t_change_backgroundcolor.css('background-color',color);
        });
        t_picker_site.linkTo(function(color){console.log(color)
            t_style.empty();
            color_rgb = hexToRgb(color);console.log(color_rgb)
            t_style.html('.colored, .pagination li a:hover, .photoControl ul li a:hover, .readMore, .blogBreadcrumb li.active, .blogItems a:hover, address ul li a:hover, .sidebarMenu .active a b, .sidebarMenu ul li a:hover b, .portfolioItems li figure h3 a:hover, .active > a, .menu li a:hover, .colored{color:'+color+' !important;}.arrowRight a:hover, .arrowLeft a:hover .postDate ul .date , .accordion-heading-active::after, .btn-color, .recentPosts li::before, .iconBg, .brand::after, .rs_mainslider .rs_mainslider_dots_container ul.rs_mainslider_dots li.rs_mainslider_dots_active { background:'+color+' !important}.coloredSection, .postDate ul .date{background:'+color+' !important; color: white;}.portfolioItems li figure:hover:after { border-bottom: 5px solid '+color+';}.servicesFeatures li figure a img, .progress .bar {background-color:'+color+'; !important}.arrowRight a:hover,.arrowLeft a:hover { background: '+color+' !important;}.nav-tabs > .active {border-top: 1px solid '+color+';}.portfolioItems li figure:hover{  border-bottom: 1px solid '+color+' !important;}.menu li > ul { border-top: 2px solid '+color+' !important;}.btn:hover, .btn:focus { background-color: '+color+' !important;}.pricingTable > li h3 { background-color: '+color+'; border: 1px solid '+color+';}.rs_mainslider_items_text h2,.introMess h2{background-color: rgba('+color_rgb.r+','+color_rgb.g+','+color_rgb.b+',0.5);}.navTop ul li:nth-child(1) a { background-color:  rgba('+color_rgb.r+','+color_rgb.g+','+color_rgb.b+',1);}.navTop ul li:nth-child(2) a {background-color: rgba('+color_rgb.r+','+color_rgb.g+','+color_rgb.b+',0.8);} .navTop ul li:nth-child(3) a { background-color: rgba('+color_rgb.r+','+color_rgb.g+','+color_rgb.b+',0.6);}.navTop ul li:nth-child(4) a {background-color: rgba('+color_rgb.r+','+color_rgb.g+','+color_rgb.b+',0.4);}.nav-tabs > .active::after{border-top: 5px solid '+color+'}');
        });
        t_picker_button.click(function(){
            t_picker_box_site.hide();
            t_picker_box.toggle();
        });
        t_picker_button_site.click(function(){
            t_picker_box.hide();
            t_picker_box_site.toggle();
        });
        var t_normal_layout_function = function(){
            if(t_layout_changed){
                t_change_backgroundcolor.removeClass(t_color_current_class).removeClass(t_texture_current_class);
                t_dom.removeClass('backwrapper');
                t_color_current_class = '';
                t_texture_current_class = '';
                t_change_backgroundcolor.css('background-color','');
                t_picker.setColor(t_color_default);
                t_layout_changed = false;
            }
        }
        var t_boxed_layout_function = function(){
            if(!t_layout_changed){
                t_dom.addClass('backwrapper');
                t_layout_changed = true;
            }
        }
        t_button.click(function(){
            if(t.hasClass('customPanelClosed'))
                t.removeClass('customPanelClosed').stop().animate({left:'0px'},{queue:false,duration:t_toggle_time});
            else{
                t.addClass('customPanelClosed').stop().animate({left:'-60px'},{queue:false,duration:t_toggle_time});
                t_picker_box.hide();
                t_picker_box_site.hide();
            }
        });
        t_default.click(function(){
            t_normal_layout_function();
        });
        t_color.click(function(){
            t_boxed_layout_function();
            var t_color_current = $(this);
            var t_color_current_class_new = t_color_current.attr('class').split(' ')[1];
            if(t_color_current_class_new!=t_color_current_class){
                if(t_color_current_class=='')
                    t_change_backgroundcolor.css('background-color','');
                t_change_backgroundcolor.removeClass(t_color_current_class).addClass(t_color_current_class_new);
                t_color_current_class = t_color_current_class_new;
                t_picker.setColor(colorToHex(t_color_current.css('background-color')));
            }
        });
        t_texture.click(function(){
            t_boxed_layout_function();
            var t_texture_current = $(this);
            var t_texture_current_class_new = t_texture_current.attr('class').split(' ')[1];
            if(t_texture_current_class_new!=t_texture_current_class){
                t_change_backgroundcolor.removeClass(t_texture_current_class).addClass(t_texture_current_class_new);
                t_texture_current_class = t_texture_current_class_new;
            }
        });
        var i;
        for(i=0;i<t_menu_fonts.length;i++)
            t_menu_font_select.append('<option value="'+i+'">'+t_menu_fonts[i].name+'</option>');
        for(i=0;i<t_text_fonts.length;i++)
            t_text_font_select.append('<option value="'+i+'">'+t_text_fonts[i].name+'</option>');
        for(i=0;i<t_title_fonts.length;i++)
            t_title_font_select.append('<option value="'+i+'">'+t_title_fonts[i].name+'</option>');
        var t_menu_font_link = $('.TopmenuFont');
        var t_text_font_link = $('.TextFont');
        var t_title_font_link = $('.TitleFont');
        t_menu_font_select.change(function(){
            var t_font_index = parseInt(t_menu_font_select.val());
            t_menu_font_link.attr('href',t_menu_fonts[t_font_index].link);
            t_menu_css.css('font-family',t_menu_fonts[t_font_index].css);
        });
        t_text_font_select.change(function(){
            var t_font_index = parseInt(t_text_font_select.val());
            t_text_font_link.attr('href',t_text_fonts[t_font_index].link);
            t_text_css.css('font-family',t_text_fonts[t_font_index].css);
        });
        t_title_font_select.change(function(){
            var t_font_index = parseInt(t_title_font_select.val());
            t_title_font_link.attr('href',t_title_fonts[t_font_index].link);
            t_title_css.css('font-family',t_title_fonts[t_font_index].css);
        });
    });
});
function colorToHex(color) {
    if (color.substr(0, 1) === '#') {
        return color;
    }
    var digits = /(.*?)rgb\((\d+), (\d+), (\d+)\)/.exec(color);
    
    var red = parseInt(digits[2]);
    var green = parseInt(digits[3]);
    var blue = parseInt(digits[4]);
    
    var rgb = blue | (green << 8) | (red << 16);
    return digits[1] + '#' + rgb.toString(16);
};
function hexToRgb(hex) {
    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    } : null;
}