//Start of colorpicker block
const CSColorpicker = "#custom-fields-colorpicker";
var colorpicker;
var colorpickerInput;
var uploading_type;

jQuery(document).ready(function(){
    try {
        colorpicker = jQuery.farbtastic(CSColorpicker);
    } catch (e){
        console.log("Colorpicker problems");
    }

    CF_initColorFields();

    jQuery("input.colorpicker").on("click",CF_showColorpicker);
});

function CF_showColorpicker(){
    var colorpickerDiv = jQuery(CSColorpicker);
    var $this = jQuery(this);

    if( colorpickerInput == $this.attr("id") ) {
        colorpickerDiv.hide();
        colorpickerInput = '';
    } else {
        colorpickerInput = $this.attr("id");
        colorpickerDiv.show();
    }
    colorpicker.setColor($this.val());
    colorpicker.linkTo(function(color){
        jQuery("#" + colorpickerInput).val(color).css("background-color",color);
        console.log(color);
    });

    var top = $this.offset().top - $this.closest(".postbox").offset().top;

    colorpickerDiv.css({
        left:450 + "px",
        top:(top - 50) +"px"
    });
}

function CF_initColorFields(){
    jQuery("input.colorpicker").each(function(){
        jQuery(this).css("background-color", jQuery(this).val());
    });
}
//End of colorpicker block


//Start of image uploader block

var targetOfImage;
jQuery(document).ready(function(){
    jQuery(".cf-add-image").on("click", CF_loadCustomImage);
    jQuery(".cf-remove-image").on("click", CF_removeCustomImage);

});

function CF_removeCustomImage(){
    var target = jQuery(this).data("target");

    jQuery("#" + target ).val("");
    jQuery("#image-" + target).empty();
    jQuery(this).hide();
}

function CF_loadCustomImage(){
    targetOfImage = jQuery(this).data("target");
    tb_show('', 'media-upload.php?type=image&post_id=1&TB_iframe=true&flash=0&simple_slideshow=true');
    CF_processUploadedImage();
}

function CF_processUploadedImage(){
    window.default_send_to_editor = window.send_to_editor;
    window.send_to_editor = function(html){
        console.log("Send to editor");
        html = '<div>'+html+'</div>';
        imgurl = jQuery('img',html).attr('src');

        jQuery("#" + targetOfImage).val(imgurl);
        jQuery("#image-" + targetOfImage).html("<img src = '" + imgurl + "' class = 'CF-uploaded-image' />");
        jQuery(".cf-remove-image[data-target=" + targetOfImage + "]").show();

        tb_remove();
        window.send_to_editor = window.default_send_to_editor;
    }
}
//End of image uploader block

//Start of video uploader block

var targetOfVideo;
jQuery(document).ready(function(){
    jQuery(".cf-add-video").on("click", CF_loadCustomVideo);
    jQuery(".cf-remove-video").on("click", CF_removeCustomVideo);
});

function CF_removeCustomVideo(){
    var target = jQuery(this).data("target");
    jQuery("#" + target ).val("");
    jQuery("#image-" + target).empty();
    jQuery(this).hide();
}

function CF_loadCustomVideo() {
    targetOfVideo = jQuery(this).data("target");
    tb_show('', 'media-upload.php?type=image&post_id=1&TB_iframe=true&flash=0&simple_slideshow=true');
    CF_processUploadedVideo();
}

function CF_processUploadedVideo() {
    window.default_send_to_editor = window.send_to_editor;
    window.send_to_editor = function(html){

        html = '<div>'+html+'</div>';
        var video_url = jQuery('a',html).attr( 'href' );

        jQuery("#" + targetOfVideo).val( video_url );
        jQuery("#image-" + targetOfVideo).html( video_url );
        jQuery(".cf-remove-video[data-target=" + targetOfVideo + "]").show();

        tb_remove();
        window.send_to_editor = window.default_send_to_editor;
    }
}

//End of video uploader block


//Show/hide metabox, depending on element value
jQuery(document).ready(function(){
    toggleMetaboxOnFormat("post_video_custom_fields", 'video');
    toggleMetaboxOnFormat("post_quote_custom_fields", 'quote');
    jQuery("input[name=post_format]").on("change",function(){
        toggleMetaboxOnFormat("post_video_custom_fields", 'video');
        toggleMetaboxOnFormat("post_quote_custom_fields", 'quote');
    });
});

function toggleMetaboxOnFormat(metaboxId, value){
    var format = jQuery("input[name=post_format]:checked").val();
    if(format != value )
        jQuery("#" + metaboxId).slideUp("fast");
    else
        jQuery("#" + metaboxId).slideDown("fast");
    console.log(format);
}




