import templateLoader.mvc.*
import templateLoader.I.*
import templateLoader.mvctemplate.*
import templateLoader.util.Observable

  

class templateLoader.mvctemplate.Loader{
 var __model:LoaderModel
 var __target:MovieClip
 
 ///////view
 var __containerPage:ContainerPageView
 var __container:ContainerView
 var __menuPrimary:MenuPrimaryView 
 var __menuSecondary:MenuSecondaryView
 var __background:BackgroundView
 var __logo:LogoView
 var __fullScreen:FullScreenView
 var __playerMp3:PlayerMp3View
 var __footer:FooterView
 var __header:HeaderView
 var __preloader:PreloaderView
 
 
 

 
 static var __instance:Loader
  
 
//////////////////////////////////////////////////////////////////////////////

  static function getInstance(){
	  if(Loader.__instance==undefined){
		  trace("WARNING !!! - NIE STWORZYLES INSTANCJI Loader !")		  
	  }
	  return __instance
  }
  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  public function Loader(target:MovieClip) {
	  this.__target=target
	 __instance=this
	 __model=new LoaderModel(this)
	 this.faceView()
  }
  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   function faceView(){
	   
	   
	/////////////////background
	this.__background=BackgroundView(this.__target.attachMovie("_background","_background_" ,2))
	this.__background.setModel(this.__model)
	this.__model.addEventListener("onChangedPositionMenu",this.__background)
	this.__model.addEventListener("onIntroEnd",this.__background)
	this.__model.addEventListener("onResize",this.__background)
	this.__model.addEventListener("onExitEnd",this.__background)
	
	
	
	////////container page
	this.__containerPage=ContainerPageView(this.__target.attachMovie("_containerPage","_containerPage_",233232))
	this.__model.addEventListener("onResize",this.__containerPage)
	this.__containerPage.setModel(this.__model)
	
	
	
	
	////footer
	if(ConfigurationSite.FOOTER_VISIBLE=="true"){
	this.__footer=FooterView(this.__target.attachMovie("_footer","_footer_",219))
	this.__model.addEventListener("onResize", this.__footer)
	this.__model.addEventListener("onLoadMenuTree", this.__footer)
	this.__model.addEventListener("onIntroEnd", this.__footer)
	this.__model.addEventListener("onIntroStart",this.__footer)
	this.__footer.setModel(this.__model)
	}
	
	
	
	if(ConfigurationSite.MP3_VISIBLE=="true"){
	/////playerMp3
	this.__playerMp3=PlayerMp3View(__footer.container.attachMovie("_player_mp3_loader","_player_mp3_loader_",44432))
	this.__playerMp3.setModel(this.__model)
	this.__model.addEventListener("onResize",this.__playerMp3)
	this.__model.addEventListener("onIntroEnd",this.__playerMp3)
	this.__model.addEventListener("onStartPlayerFlv", this.__playerMp3) ///on start player flv
	this.__model.addEventListener("onStopPlayerFlv", this.__playerMp3) ///on start player flv
	}
	
	         	   
	////////////////////////////container
	this.__container=ContainerView(this.__containerPage.attachMovie("_containerLoader","_containerLoader_",10000,{_x:0,_y:0}))
	__container.setModel(__model)
	this.__model.addEventListener("onLoadXml",this.__container)
	this.__model.addEventListener("onExitStart",this.__container)
	this.__model.addEventListener("onExitEnd",this.__container)
	this.__model.addEventListener("onIntroStart",this.__container)
	this.__model.addEventListener("onIntroEnd",this.__container)
	this.__model.addEventListener("onChangedPositionMenu",this.__container)
	this.__model.addEventListener("onResize",this.__container)
	this.__model.__loader.addListener(this.__container)
	
	
	/////////////////////////////////menu primary
	if(ConfigurationSite.MENU_VISIBLE=="true"){
	this.__menuPrimary=MenuPrimaryView(this.__containerPage.attachMovie("_menuPrimary","_menuPrimary_",20))
	this.__menuPrimary.setModel(__model)
	this.__model.addEventListener("onLoadXml",this.__menuPrimary)
	this.__model.addEventListener("onExitStart",this.__menuPrimary)
	this.__model.addEventListener("onExitEnd",this.__menuPrimary)
	this.__model.addEventListener("onIntroStart",this.__menuPrimary)
	this.__model.addEventListener("onIntroEnd",this.__menuPrimary)
	this.__model.addEventListener("onChangedPositionMenu",this.__menuPrimary)
	this.__model.addEventListener("onResize",this.__menuPrimary)
	this.__model.addEventListener("onChangedPositionMenu", this.__menuPrimary)
	}
	
	
	/////////////////////////////////menu secondary
	this.__menuSecondary//=MenuSecondaryView(this.__containerPage.attachMovie("_menuSecondaryView","_menuSecondaryView_",22,{_x:0,_y:0}))
	this.__menuSecondary.setModel(__model)
	this.__model.addEventListener("onLoadXml",this.__menuSecondary)
	this.__model.addEventListener("onExitStart",this.__menuSecondary)
	this.__model.addEventListener("onExitEnd",this.__menuSecondary)
	this.__model.addEventListener("onIntroStart",this.__menuSecondary)
	this.__model.addEventListener("onIntroEnd",this.__menuSecondary)
	this.__model.addEventListener("onChangedPositionMenu",this.__menuSecondary)
	this.__model.addEventListener("onResize",this.__menuSecondary)
	
		
	/////logo
	
	this.__logo=LogoView(__menuPrimary.containerLogo.attachMovie("_logo","_logo_",496))
	this.__model.addEventListener("onResize",this.__logo)
	this.__model.addEventListener("onIntroEnd",this.__logo)
	this.__logo.setModel(this.__model)
	

		   
	/////full screen
	this.__fullScreen=FullScreenView(__footer.container.attachMovie("_fullScreen","_fullScreen",133))
	this.__model.addEventListener("onResize",this.__fullScreen)
	this.__fullScreen.setModel(this.__model)
	this.__fullScreen._visible=true
	
	
	
	
	
	
	
	
	////HEADER
	this.__header//=HeaderView(this.__containerPage.attachMovie("_header","_header_",228))
	this.__model.addEventListener("onResize",this.__header)
	this.__header.setModel(this.__model)
	
	
	/////PRELOADER
	this.__preloader=PreloaderView(this.__containerPage.attachMovie("_preloader_body","_preloader_body_",101010990654432))
	this.__preloader.setModel(__model)
	this.__model.addEventListener("onResize",this.__preloader)
	this.__model.addEventListener("onLoadXml",this.__preloader)
	this.__model.__loader.addListener(this.__preloader)
	this.__model.__loaderBck.addListener(this.__preloader)
	
	
	
	
	
	   
   }
   
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 



}