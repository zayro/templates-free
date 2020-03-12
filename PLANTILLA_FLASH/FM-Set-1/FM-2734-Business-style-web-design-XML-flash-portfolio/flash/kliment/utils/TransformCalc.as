import flash.geom.Point;
import flash.geom.Rectangle;

/**
 * ...
 * @author      Kliment
 * @version     1.1.0
 */
class kliment.utils.TransformCalc {

        public static function putInSpace(target:Object, width:Number, height:Number, crop:Boolean, centred:Boolean):Rectangle {
                var preffix_target:String = '';
                if (target instanceof MovieClip)
                        preffix_target = '_';

                var x_ratio:Number = width / target[preffix_target+'width'];
                var y_ratio:Number = height / target[preffix_target+'height'];
                var ratio:Number = 0;
                var use_ratio:Boolean;
                if (crop)
                        ratio = Math.max(x_ratio, y_ratio);
                else
                        ratio = Math.min(x_ratio, y_ratio);
                use_ratio = (x_ratio == ratio)? true : false;
                var new_width:Number = (use_ratio)? width : (target[preffix_target+'width'] * ratio);
                var new_height:Number = (!use_ratio)? height : (target[preffix_target+'height'] * ratio);
                var new_x:Number = (use_ratio)? 0 : ((width - new_width) / 2);
                var new_y:Number = (!use_ratio)? 0 : ((height - new_height) / 2);

                if (crop) {
                        return new Rectangle(new_x, new_y, new_width, new_height);
                } else if (!centred) {
                        return new Rectangle(0, 0, new_width, new_height);
                } else {
                        return new Rectangle(new_x, new_y, new_width, new_height);
                }
        }

        public static function fixInSpace(target:Rectangle, space:Rectangle):Point {
                var dragRectangle:Rectangle = TransformCalc.getDragRectangle(target, space);
                var margen_x:Number = dragRectangle.x;
                var margen_y:Number = dragRectangle.y;
                var position:Point = new Point(target.x, target.y);

                if (target.width > space.width){
                        if (position.x < margen_x)
                                position.x = margen_x;
                        if (position.x > space.x)
                                position.x = space.x;
                } else {
                        if (position.x > margen_x)
                                position.x = margen_x;
                        if (position.x < space.x)
                                position.x = space.x;
                }
                if (target.height > space.height){
                        if (position.y < margen_y)
                                position.y = margen_y;
                        if (position.y > space.y)
                                position.y = space.y;
                } else {
                        if (position.y > margen_y)
                                position.y = margen_y;
                        if (position.y < space.y)
                                position.y = space.y;
                }
                return position;
        }

        public static function getDragRectangle(target:Rectangle, space:Rectangle):Rectangle {
                var _left:Number = space.width - target.width + space.x;
                var _top:Number = space.height - target.height + space.y;
                return new Rectangle(_left, _top, space.x, space.y);
        }
}