/*
* Custom Slider - jQuery plugin
* written by Eduardo Sada
*
* Some rights reserved.
* http://creativecommons.org/licenses/by-nc/3.0/
*
* Built for jQuery library
* http://jquery.com
*
*/ 

(function($) {

  $.fn.customSlider = function(options) {

    var defaults = {
      speed     : 400,
      width     : 300,
      height    : 300,
      distance  : 1,
      direction : 'horizontal'
    };

    var options = $.extend(defaults, options); 

    this.each(function() {
      var obj    = $('ul', this);
      var slideL = $('li', obj).length;

      if (options.direction == 'horizontal') {
        obj.css({'width': options.width * slideL});
      } else if (options.direction == 'vertical') {
        obj.css({'height': options.height * slideL});
      }
      
      obj.data('slider-position', 0);
      
      obj.wrap('<div style="overflow:hidden; width:100%; height:100%; position:relative;" />');

      $('.controls a', this).bind('click', function(e){
          currentPosition = obj.data('slider-position');
          currentPosition = ($(this).attr('class')=='right' || $(this).attr('class')=='down') ? currentPosition+options.distance : currentPosition-options.distance;

          if (currentPosition<0) {
            var resto = parseInt(slideL%options.distance);
            currentPosition = slideL - (resto>0?resto:1);
          } else if (currentPosition>=slideL) {
            currentPosition = 0;
          }

          obj.data('slider-position', currentPosition);
          
          if (options.direction == 'horizontal') {
            obj.animate({'marginLeft' : options.width*(-currentPosition)}, options.speed);
          } else if (options.direction == 'vertical') {
            obj.animate({'marginTop' : options.height*(-currentPosition)}, options.speed);
          }
          e.preventDefault();
      });

    });
  };

})(jQuery);