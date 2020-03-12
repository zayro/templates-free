XML FILES
There are several XML files that you can edit in order to customize the accent color template.

template.XML
In this file you can define the number of tiles every object will be devided to. You must change the cols and rows numbers. The v_pos and h_pos variables define the position of the object that you will animate with the tiles. The speed of tile animation can be controlled by the mdelay variable. Larger number means lower speed. Also the default menu item can be set from here. It will result in auto select of this menu item as if it was pressed. In this file you can enter the copyright text. Choose an accent color and enter its hexadecimal value in this file. This color can be used in the template for many of its objects. The audio track can be set from here and you need to put the path to the file. The background tile image must be entered again with the full path to the file. Lastly from here you define which XML file the template will open to load its menu.

menu.xml
In this file you can set the space between the menu items - both horizontal and vertical. The leftmargin and rightmargin numbers define the space each menu item will have before and after its caption. The bar behind the menu can be different color than the menus - use the menu_back_color variable. The color of the text is global for all menu items and must be set in the normaltextcolor. The pressedtextcolor number stores the color of the caption when the menu item is pressed.

Each menu item has caption and an unique menu_id. In order for the menu to work properly please include one menu item with menu_id of 0. The command variable can be one of the following:
-change_object where attribut1 stores the movie to load and the attribut2 holds the resource file that the external movie may need;
-start_slideshow where attribut1 holds the XML file describing the slideshow;
-load_gallery where attribut1 stores the XML file describing the gallery
-getURL where you need to set attribut1 with the requested url and attribut2 with the target (_self/_blank);
-gotoAndStop where attribut1 holds the target movie and the attribut2 holds the target frame (named or number);
-gotoAndPlay where attribut1 holds the target movie and the attribut2 holds the target frame (named or number);
-loadMovie where attribut1 holds the deploy movie where the content will load and attribut2 holds the name of the external file to load (tested with images and swf files);
attribut3 is an additional variable which can be used to extend functionality.

xml files storing text and image data
An example of such file is about_us.xml file. Set the images_frame_color for the rectangle frame around the images. The window_width and window_height variables hold the dimensions of the panel that will hold the text content. Set the margins around the text content by using leftmargin, rightmargin, topmargin and bottommargin variables. Within the CDATA portion you can put your HTML content. There is one thing you can use and that is the $accent_color variable - put it where you want the global accent_color to show. Also there is an option to use the margin attribut within the img tag to set margins for the image. Use both images and SWF files in img tags.

xml files storing slideshow information
The wait variable sotres the seconds between changing slideshow items. Set the repeat value to true or false to define if the slideshow will start again on ending. The show_time and interaction variables define if any controls will appear while the slideshow plays. Each slideshow item can define individual wait time or use the global wait time. The url and target variables defin if the slideshow item will have an url link attached. Object variable holds the file that will load for the slideshow item and the params variable can set the resource file that the slideshow item may use. Put some caption text that will show in a text box below the slideshow item while it playing.

xml files storing gallery information
The gallery XML files has some similar options to the slideshow files. The reason for that is that each gallery can start a slideshow with its items. The slideshow_wait,
repeat and the show_time variables are the same as the ones in slideshow xml files. The wait variable here defines the delay between showing the gallery thumbnail images. The space defines the pixels between the thumbnail images. Count is the number of thumbnails each page will show and the scrollstep defines how many thumbnail will change on previous or next buttons clicked. Thumbnails can be orientated horizontally or vertically - set this using the thumbs_orientation variable. The thumbs_pop variable is still not used. The folder variable stores the path to the thumb images. Each gallery item can control its wait time when part of slideshow, the url and the target variables for the link connected to it. The tar_width and tar_height variables define the thumb size, and the normal_width and normal_height define the size of the the thumb popup. Pressing a thumbnail is the same as if a menu item was pressed. Because of that fact each gallery item has command, attribut1 and attribut2 variables. The thumb variable holds the name of the thumb image. Each gallery item can store some caption text which will show using a text box.

MOVIE CLIPS
the template.fla includes almost all movie clips that the template uses.

the tile transition folder contents the actionscript for the main functionality - the changing of the objects by flipping the tiles. it uses the variables from the template.xml to create the tile movies. the tile movies create a snapshot of each movie clip that needs to show. every tile shows its portion of the screenshot. by using a tween there is a moment when a tile is not visible - this is the moment when it changes its content and starts showing the new screenshot. the code here is based on the flipping tile slideshow project. it can show in a slideshow selected object that must be defined in xml file (news.xml for example). this code also is used to show the slideshows generated by the galleries. the code is well commented.

the menu folder contents the code for the menu functionality. upon choosing a menu the code defines which menu items must show and which menu items must hide. after that the coordinates are calculated and tweens for each menu item to show are generated. colors and margins can be set from xml file. default menu item can be set from xml file. the code is commented for your convenience.

the background folder contains main_back_mc. this code uses external image and the accent color to draw the tiled background and the gradient fill over it.

the audio player is loading a file defined in xml. while streaming the audio it causes the play button to pulse. here the stop, pause and play events are handled.

the bottom panel includes some code to handle repositioning and resizing of the items it holds.

the gallery movie clip builds the thumbs area accoridng to the variables set in the xml file. upon loading the describing xml file it generates a slideshow xml object which is passed when the slideshow button is pressed. the gallery loads the first image by default. it passes the description text to the text box movie clip. the code is well commented.

the promos folder hodls the code constructing the promo panel which shows on the left part of bottom panel. it reads variables from xml file and builds promo items in an area with predefined width and height. hiting the more button is the same as hiting a menu item - same code is executed. there is scrollbar showing if needed.

the text box movie clip is used both by the gallery items and by the slideshow items. it receives HTML formated text which it shows in a rectangle with predefined width height and margins. there is scrollbar showing if needed.


the text_html_image.fla contains the code that shows the objects with HTML content.

here the loading of the content is divided in several passes. the first pass is to show the text without the images. here we define if scrollbar is needed in first pass and we draw the frames of the image content that will be loaded in the second pass. at this moment the clip reports to the main movie that it is ready. the flipping tiles animation occurs and then the main movie commands the external movie to go to next frame. here the pass three takes place. it loads the images/swfs using a preloader.


contact.fla is a simple example of contact form. it is loaded in the text_html_image file upon hitting the contacts menu item. it has some simple validation and uses LoadVars to send the entered info to a php script.


the video.fla file listens for the ready event in order to determine the width and height of the FLV file to load. then it pauses the movie and reports to the main movie that it is ready. when commanded to go in the next frame it plays the FLV file.


In general when trying to load an external movie you have to ensure that it is stopped in the first frame. This is the frame that the flipping tile animation will show. After the end of this animation the clip will be commanded to play in order to reveal its content.