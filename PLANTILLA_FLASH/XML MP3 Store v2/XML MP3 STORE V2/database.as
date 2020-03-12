meuXML.onLoad = function() 
{
	var childs:XMLNode    = meuXML.firstChild;
	var childTotal:Number = childs.childNodes.length;
	
	nName        = new Array;
	nDescription = new Array;
	nTrack       = new Array;
	nPrice       = new Array;
	nItemNumber  = new Array;
	
	MySound.stop();
	_parent._parent.playPause.enabled = false;
	_parent._parent.next.enabled = false;
	
	_global.fcn = function() 
	{
		for (var i = 0; i<childTotal; i++) 
		{
			if (i != pSelection) 
			{
				_parent.bar['bt'+i].enabled = true;
				_parent.bar['bt'+i].useHandCursor = true;
				_parent.bar['bt'+i].fd_txt.colorTo(0x1b1b1b, 1);
			}
		}
	}
	
	//REMOVE PREVIOUSLY STORED MOVIECLIPS
	for (var i = 0; i<getTotal; i++) 
	{
		_parent.bar['bt'+i].removeMovieClip();
	}

	_global.getTotal = childTotal;
	
	_parent.bar.bt._visible = false;
	
	//set variables
	var v:Number     = 1; // how many columns
	var space:Number = 3; // space between products
	var xIni:Number  = 0; // x cordinates
	var yIni:Number  = 0; // y cordinates
	var rows         = bt._width + space;
	var columns      = bt._height + space;

	function createColumns (s) 
	{
		for (var i = 0; i<childTotal; i++) 
		{
			posX = xIni + rows * (i % s);
			posY = yIni + columns * int (i / s);
			
			eval ("bt" + i).tween ("_x", posX, 1, "easeOutCubic", products.length);
			eval ("bt" + i).tween ("_y", posY, 1, "easeOutCubic", products.length);
		}
	}
	
	for (var i = 0; i<childTotal; i++) 
	{
		
		duplicateMovieClip ("bt", "bt" + i, i);//which item to duplicate
		createColumns (v);//pass on the v variable
		
		/*************************/
		nName[i]        = (childs.childNodes[i].childNodes[0].firstChild.nodeValue);
		nDescription[i] = (childs.childNodes[i].childNodes[1].firstChild.nodeValue);
		nTrack[i]       = (childs.childNodes[i].childNodes[2].firstChild.nodeValue);
		nPrice[i]       = (childs.childNodes[i].childNodes[3].firstChild.nodeValue);
		nItemNumber[i]  = (childs.childNodes[i].childNodes[4].firstChild.nodeValue);
		//trace(nPrice)
		
		//ONLOAD GET PRODUCT NAME + PRICE ON THE LEFT FRAME
		_parent.bar['bt'+i].name_txt.autoSize    = true;
		_parent.bar['bt'+i].name_txt.text        = nName[i];
		_parent.bar['bt'+i].description_txt.text = nDescription[i];
		_parent.bar['bt'+i].picture.loadMovie(nTrack[i])
		
		/*************************/
		//ONLOAD GET VARIABLES FROM XML
		_parent.bar['bt'+i].i = i;
			
		//ONLOAD GET PICTURE + DESCRIPTION
		_parent.meuScroll.scroller._y = 0; //GET SCROLLBAR TO THE TOP	
				
		/*************************/
		_parent.bar['bt'+i].nName        = nName;
		_parent.bar['bt'+i].nDescription = nDescription;
		_parent.bar['bt'+i].nTrack       = nTrack;
		_parent.bar['bt'+i].nPrice       = nPrice;
		_parent.bar['bt'+i].nItemNumber  = nItemNumber;
	
		
		//PRODUCT ON ROLLOVER ACTION
		_parent.bar['bt'+i].onRollOver = function()
		{
			this.fd_txt.colorTo(0x555555, 1);
		}
		
		
		//PRODUCT ON ROLLOUT ACTION
		_parent.bar['bt'+i].onRollOut = function() 
		{
			this.fd_txt.colorTo(0x1b1b1b, 1);
		}
		
		//PRODUCT ON RELEASE ACTION
		_parent.bar['bt'+i].onRelease = function()
		{			
			_parent._parent.playPause.enabled = true;
			_parent._parent.next.enabled = true;
			_parent._parent.playPause.gotoAndStop("pause");
			
			_global.pSelection  = this.i;
			_global.n = pSelection;
			
			_global.TRACKNAME 		= this.nName[pSelection];
			_global.TRACKPRICE 		= this.nPrice[pSelection];
			_global.TRACKITEMNUMBER = this.nItemNumber[pSelection];
			
			//_global.PRICE = this.nPrice[pSelection];
			
			this.enabled        = false;
			this.useHandCursor  = false;
			
			fcn();
		
			_root.orderform._visible = false;
			_root.view_cart.gotoAndStop(1);
			
			MySound = new Sound();
   			MySound.loadSound(this.nTrack[pSelection], true);
			
			var pos:Number;
			
			//Only executed once
			MySound.onSoundComplete = function() 
			{
				playSong();
			}
			
			_parent._parent.next.onRelease = function()
			{
				playSong();
			}
			
			function playSong():Void
			{
				if (i-1 > n)
				{
					_parent.bar['bt'+n].fd_txt.colorTo(0x1b1b1b, 1);
					_parent.bar['bt'+n].enabled       = true;
					_parent.bar['bt'+n].useHandCursor = true;
				
					_global.n++;
					MySound = new Sound();
					MySound.onSoundComplete = playSong;
	   				MySound.loadSound(nTrack[n], true);
					
					_global.TRACKNAME 		= nName[n];
					_global.TRACKPRICE 		= nPrice[n];
					_global.TRACKITEMNUMBER = nItemNumber[n];
				}
				else
				{
					trace("END OF ALBUM")
					pos = 0;
				}
				_parent.bar['bt'+n].enabled       = false;
				_parent.bar['bt'+n].useHandCursor = false;
				_parent.bar['bt'+n].fd_txt.colorTo(0x555555, 1);
			}
	
			_parent._parent.playPause.onRollOver = function() 
			{
				if(this._currentframe == 1) {this.gotoAndStop("pauseOver");}
				else {this.gotoAndStop("playOver");}
			}

			_parent._parent.playPause.onRollOut = function() 
			{
				if(this._currentframe == 10) {this.gotoAndStop("pause");}
				else {this.gotoAndStop("play");}
			}

			_parent._parent.playPause.onRelease = function() 
			{
				if(this._currentframe == 10) 
				{
					this.gotoAndStop("playOver");
					pauseIt()
				}
				else 
				{
					this.gotoAndStop("pauseOver");
					unPauseIt();
				}//END IF
			}//END FUNCTION
			
			function pauseIt():Void
			{
				pos = MySound.position;
				MySound.stop();
			}

			// Pauses the music
			function unPauseIt():Void
			{
				MySound.start(pos/1000);
			}
			
			_parent._parent.addTrack.onRelease = function()
			{
				var item = new _parent._parent.CartItem(TRACKNAME, TRACKITEMNUMBER, TRACKPRICE, 1);
				_parent._parent.total_fade.gotoAndPlay(2);
				_parent._parent.additem(item);
			}
		}
	}
}