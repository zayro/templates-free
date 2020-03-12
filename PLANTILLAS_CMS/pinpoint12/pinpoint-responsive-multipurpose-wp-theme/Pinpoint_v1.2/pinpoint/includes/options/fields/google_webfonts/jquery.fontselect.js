jQuery(document).ready(function ($) {
    var googlefont = jQuery('.font').fontselect();
    fontset(googlefont);

    function fontset(googlefont) {
        var relid = googlefont.attr('id');

        // replace + signs with spaces for css
        var font = googlefont.val().replace(/\+/g, ' ');

        // split font into family and weight
        font = font.split(':');

        // set family on example
        jQuery('#' + relid + '.example').css('font-family', font[0]);
    }
});

/*
 * jQuery.fontselect - A font selector for the Google Web Fonts api
 * Tom Moor, http://tommoor.com
 * Copyright (c) 2011 Tom Moor
 * MIT Licensed
 * @version 0.1
*/
(function($){

  $.fn.fontselect = function(options) {  

     var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

     var fonts = [
      'ABeeZee','Abel','Abril Fatface','Aclonica','Acme','Actor','Adamina','Advent Pro',
      'Aguafina Script','Akronim','Aladin','Aldrich','Alegreya','Alegreya SC','Alex Brush',
      'Alfa Slab One','Alice','Alike','Alike Angular','Allan','Allerta','Allerta Stencil',
      'Allura','Almendra','Almendra Display','Almendra SC','Amarante','Amaranth','Amatic SC',
      'Amethysta','Anaheim','Andada','Andika','Angkor','Annie Use Your Telescope',
      'Anonymous Pro','Antic','Antic Didone','Antic Slab','Anton','Arapey','Arbutus',
      'Arbutus Slab','Architects Daughter','Archivo Black','Archivo Narrow','Arimo','Arizonia',
      'Armata','Artifika','Arvo','Asap','Asset','Astloch','Asul','Atomic Age','Aubrey',
      'Audiowide','Autour One','Average','Average Sans','Averia Gruesa Libre','Averia Libre',
      'Averia Sans Libre','Averia Serif Libre','Bad Script','Balthazar','Bangers','Basic',
      'Battambang','Baumans','Bayon','Belgrano','Belleza','BenchNine','Bentham',
      'Berkshire Swash','Bevan','Bigelow Rules','Bigshot One','Bilbo','Bilbo Swash Caps',
      'Bitter','Black Ops One','Bokor','Bonbon','Boogaloo','Bowlby One','Bowlby One SC',
      'Brawler','Bree Serif','Bubblegum Sans','Bubbler One','Buda','Buenard','Butcherman',
      'Butterfly Kids','Cabin','Cabin Condensed','Cabin Sketch','Caesar Dressing','Cagliostro',
      'Calligraffitti','Cambo','Candal','Cantarell','Cantata One','Cantora One','Capriola',
      'Cardo','Carme','Carrois Gothic','Carrois Gothic SC','Carter One','Caudex',
      'Cedarville Cursive','Ceviche One','Changa One','Chango','Chau Philomene One','Chela One',
      'Chelsea Market','Chenla','Cherry Cream Soda','Cherry Swash','Chewy','Chicle','Chivo',
      'Cinzel','Cinzel Decorative','Clicker Script','Coda','Coda Caption','Codystar','Combo',
      'Comfortaa','Coming Soon','Concert One','Condiment','Content','Contrail One',
      'Convergence','Cookie','Copse','Corben','Courgette','Cousine','Coustard',
      'Covered By Your Grace','Crafty Girls','Creepster','Crete Round','Crimson Text',
      'Croissant One','Crushed','Cuprum','Cutive','Cutive Mono','Damion','Dancing Script',
      'Dangrek','Dawning of a New Day','Days One','Delius','Delius Swash Caps','Delius Unicase',
      'Della Respira','Denk One','Devonshire','Didact Gothic','Diplomata','Diplomata SC',
      'Domine','Donegal One','Doppio One','Dorsa','Dosis','Dr Sugiyama','Droid Sans',
      'Droid Sans Mono','Droid Serif','Duru Sans','Dynalight','EB Garamond','Eagle Lake',
      'Eater','Economica','Electrolize','Elsie','Elsie Swash Caps','Emblema One','Emilys Candy',
      'Engagement','Englebert','Enriqueta','Erica One','Esteban','Euphoria Script','Ewert',
      'Exo','Expletus Sans','Fanwood Text','Fascinate','Fascinate Inline','Faster One',
      'Fasthand','Federant','Federo','Felipa','Fenix','Finger Paint','Fjalla One','Fjord One',
      'Flamenco','Flavors','Fondamento','Fontdiner Swanky','Forum','Francois One',
      'Freckle Face','Fredericka the Great','Fredoka One','Freehand','Fresca','Frijole',
      'Fruktur','Fugaz One','GFS Didot','GFS Neohellenic','Gafata','Galdeano','Galindo',
      'Gentium Basic','Gentium Book Basic','Geo','Geostar','Geostar Fill','Germania One',
      'Gilda Display','Give You Glory','Glass Antiqua','Glegoo','Gloria Hallelujah',
      'Goblin One','Gochi Hand','Gorditas','Goudy Bookletter 1911','Graduate','Grand Hotel',
      'Gravitas One','Great Vibes','Griffy','Gruppo','Gudea','Habibi','Hammersmith One',
      'Hanalei','Hanalei Fill','Handlee','Hanuman','Happy Monkey','Headland One','Henny Penny',
      'Herr Von Muellerhoff','Holtwood One SC','Homemade Apple','Homenaje','IM Fell DW Pica',
      'IM Fell DW Pica SC','IM Fell Double Pica','IM Fell Double Pica SC','IM Fell English',
      'IM Fell English SC','IM Fell French Canon','IM Fell French Canon SC',
      'IM Fell Great Primer','IM Fell Great Primer SC','Iceberg','Iceland','Imprima',
      'Inconsolata','Inder','Indie Flower','Inika','Irish Grover','Istok Web','Italiana',
      'Italianno','Jacques Francois','Jacques Francois Shadow','Jim Nightshade','Jockey One',
      'Jolly Lodger','Josefin Sans','Josefin Slab','Joti One','Judson','Julee',
      'Julius Sans One','Junge','Jura','Just Another Hand','Just Me Again Down Here','Kameron',
      'Karla','Kaushan Script','Keania One','Kelly Slab','Kenia','Khmer','Kite One','Knewave',
      'Kotta One','Koulen','Kranky','Kreon','Kristi','Krona One','La Belle Aurore','Lancelot',
      'Lato','League Script','Leckerli One','Ledger','Lekton','Lemon','Libre Baskerville',
      'Life Savers','Lilita One','Limelight','Linden Hill','Lobster','Lobster Two',
      'Londrina Outline','Londrina Shadow','Londrina Sketch','Londrina Solid','Lora',
      'Love Ya Like A Sister','Loved by the King','Lovers Quarrel','Luckiest Guy','Lusitana',
      'Lustria','Macondo','Macondo Swash Caps','Magra','Maiden Orange','Mako','Marcellus',
      'Marcellus SC','Marck Script','Margarine','Marko One','Marmelad','Marvel','Mate',
      'Mate SC','Maven Pro','McLaren','Meddon','MedievalSharp','Medula One','Megrim',
      'Meie Script','Merienda','Merienda One','Merriweather','Metal','Metal Mania',
      'Metamorphous','Metrophobic','Michroma','Milonga','Miltonian','Miltonian Tattoo',
      'Miniver','Miss Fajardose','Modern Antiqua','Molengo','Molle','Monda','Monofett',
      'Monoton','Monsieur La Doulaise','Montaga','Montez','Montserrat','Montserrat Alternates',
      'Montserrat Subrayada','Moul','Moulpali','Mountains of Christmas','Mouse Memoirs',
      'Mr Bedfort','Mr Dafoe','Mr De Haviland','Mrs Saint Delafield','Mrs Sheppards','Muli',
      'Mystery Quest','Neucha','Neuton','New Rocker','News Cycle','Niconne','Nixie One',
      'Nobile','Nokora','Norican','Nosifer','Nothing You Could Do','Noticia Text','Nova Cut',
      'Nova Flat','Nova Mono','Nova Oval','Nova Round','Nova Script','Nova Slim','Nova Square',
      'Numans','Nunito','Odor Mean Chey','Offside','Old Standard TT','Oldenburg','Oleo Script',
      'Oleo Script Swash Caps','Open Sans','Open Sans Condensed','Oranienbaum','Orbitron',
      'Oregano','Orienta','Original Surfer','Oswald','Over the Rainbow','Overlock',
      'Overlock SC','Ovo','Oxygen','Oxygen Mono','PT Mono','PT Sans','PT Sans Caption',
      'PT Sans Narrow','PT Serif','PT Serif Caption','Pacifico','Paprika','Parisienne',
      'Passero One','Passion One','Patrick Hand','Patua One','Paytone One','Peralta',
      'Permanent Marker','Petit Formal Script','Petrona','Philosopher','Piedra','Pinyon Script',
      'Pirata One','Plaster','Play','Playball','Playfair Display','Playfair Display SC',
      'Podkova','Poiret One','Poller One','Poly','Pompiere','Pontano Sans','Port Lligat Sans',
      'Port Lligat Slab','Prata','Preahvihear','Press Start 2P','Princess Sofia','Prociono',
      'Prosto One','Puritan','Purple Purse','Quando','Quantico','Quattrocento',
      'Quattrocento Sans','Questrial','Quicksand','Quintessential','Qwigley','Racing Sans One',
      'Radley','Raleway','Raleway Dots','Rambla','Rammetto One','Ranchers','Rancho','Rationale',
      'Redressed','Reenie Beanie','Revalia','Ribeye','Ribeye Marrow','Righteous','Risque',
      'Roboto','Roboto Condensed','Rochester','Rock Salt','Rokkitt','Romanesco','Ropa Sans',
      'Rosario','Rosarivo','Rouge Script','Ruda','Rufina','Ruge Boogie','Ruluko','Rum Raisin',
      'Ruslan Display','Russo One','Ruthie','Rye','Sacramento','Sail','Salsa','Sanchez',
      'Sancreek','Sansita One','Sarina','Satisfy','Scada','Schoolbell','Seaweed Script',
      'Sevillana','Seymour One','Shadows Into Light','Shadows Into Light Two','Shanti','Share',
      'Share Tech','Share Tech Mono','Shojumaru','Short Stack','Siemreap','Sigmar One',
      'Signika','Signika Negative','Simonetta','Sirin Stencil','Six Caps','Skranji','Slackey',
      'Smokum','Smythe','Sniglet','Snippet','Snowburst One','Sofadi One','Sofia','Sonsie One',
      'Sorts Mill Goudy','Source Code Pro','Source Sans Pro','Special Elite','Spicy Rice',
      'Spinnaker','Spirax','Squada One','Stalemate','Stalinist One','Stardos Stencil',
      'Stint Ultra Condensed','Stint Ultra Expanded','Stoke','Strait','Sue Ellen Francisco',
      'Sunshiney','Supermercado One','Suwannaphum','Swanky and Moo Moo','Syncopate','Tangerine',
      'Taprom','Telex','Tenor Sans','Text Me One','The Girl Next Door','Tienne','Tinos',
      'Titan One','Titillium Web','Trade Winds','Trocchi','Trochut','Trykker','Tulpen One',
      'Ubuntu','Ubuntu Condensed','Ubuntu Mono','Ultra','Uncial Antiqua','Underdog','Unica One',
      'UnifrakturCook','UnifrakturMaguntia','Unkempt','Unlock','Unna','VT323','Vampiro One',
      'Varela','Varela Round','Vast Shadow','Vibur','Vidaloka','Viga','Voces','Volkhov',
      'Vollkorn','Voltaire','Waiting for the Sunrise','Wallpoet','Walter Turncoat','Warnes',
      'Wellfleet','Wendy One','Wire One','Yanone Kaffeesatz','Yellowtail','Yeseva One',
      'Yesteryear','Zeyada'];
      
      
    var settings = {
      style: 'font-select',
      placeholder: 'Select a font',
      lookahead: 2,
      api: 'http://fonts.googleapis.com/css?family='
    };
    
    var Fontselect = (function(){
    
      function Fontselect(original, o){
        this.$original = $(original);
        this.options = o;
        this.active = false;
        this.setupHtml();
        this.getVisibleFonts();
        this.bindEvents();

        var font = this.$original.val();
        if (font) {
          this.updateSelected();
          this.addFontLink(font);
        }
      }
      
      Fontselect.prototype.bindEvents = function(){
      
        $('li', this.$results)
        .click(__bind(this.selectFont, this))
        .mouseenter(__bind(this.activateFont, this))
        .mouseleave(__bind(this.deactivateFont, this));
        
        $('span', this.$select).click(__bind(this.toggleDrop, this));
        this.$arrow.click(__bind(this.toggleDrop, this));
      };
      
      Fontselect.prototype.toggleDrop = function(ev){
        
        if(this.active){
          this.$element.removeClass('font-select-active');
          this.$drop.hide();
          clearInterval(this.visibleInterval);
          
        } else {
          this.$element.addClass('font-select-active');
          this.$drop.show();
          this.moveToSelected();
          this.visibleInterval = setInterval(__bind(this.getVisibleFonts, this), 500);
        }
        
        this.active = !this.active;
      };
      
      Fontselect.prototype.selectFont = function(){
        
        var font = $('li.active', this.$results).data('value');
        this.$original.val(font).change();
        this.updateSelected();
        this.toggleDrop();
      };
      
      Fontselect.prototype.moveToSelected = function(){
        
        var $li, font = this.$original.val();
        
        if (font){
          $li = $("li[data-value='"+ font +"']", this.$results);
        } else {
          $li = $("li", this.$results).first();
        }

        this.$results.scrollTop($li.addClass('active').position().top);
      };
      
      Fontselect.prototype.activateFont = function(ev){
        $('li.active', this.$results).removeClass('active');
        $(ev.currentTarget).addClass('active');
      };
      
      Fontselect.prototype.deactivateFont = function(ev){
        
        $(ev.currentTarget).removeClass('active');
      };
      
      Fontselect.prototype.updateSelected = function(){
        
        var font = this.$original.val();
        $('span', this.$element).text(this.toReadable(font)).css(this.toStyle(font));
      };
      
      Fontselect.prototype.setupHtml = function(){
      
        this.$original.empty().hide();
        this.$element = $('<div>', {'class': this.options.style});
        this.$arrow = $('<div><b></b></div>');
        this.$select = $('<a><span>'+ this.options.placeholder +'</span></a>');
        this.$drop = $('<div>', {'class': 'fs-drop'});
        this.$results = $('<ul>', {'class': 'fs-results'});
        this.$original.after(this.$element.append(this.$select.append(this.$arrow)).append(this.$drop));
        this.$drop.append(this.$results.append(this.fontsAsHtml())).hide();
      };
      
      Fontselect.prototype.fontsAsHtml = function(){
        
        var l = fonts.length;
        var r, s, h = '';
        
        for(var i=0; i<l; i++){
          r = this.toReadable(fonts[i]);
          s = this.toStyle(fonts[i]);
          h += '<li data-value="'+ fonts[i] +'" style="font-family: '+s['font-family'] +'; font-weight: '+s['font-weight'] +'">'+ r +'</li>';
        }
        
        return h;
      };
      
      Fontselect.prototype.toReadable = function(font){
        return font.replace(/[\+|:]/g, ' ');
      };
      
      Fontselect.prototype.toStyle = function(font){
        var t = font.split(':');
        return {'font-family': this.toReadable(t[0]), 'font-weight': (t[1] || 400)};
      };
      
      Fontselect.prototype.getVisibleFonts = function(){
      
        if(this.$results.is(':hidden')) return;
        
        var fs = this;
        var top = this.$results.scrollTop();
        var bottom = top + this.$results.height();
        
        if(this.options.lookahead){
          var li = $('li', this.$results).first().height();
          bottom += li*this.options.lookahead;
        }
       
        $('li', this.$results).each(function(){

          var ft = $(this).position().top+top;
          var fb = ft + $(this).height();

          if ((fb >= top) && (ft <= bottom)){
            var font = $(this).data('value');
            fs.addFontLink(font);
          }
          
        });
      };
      
      Fontselect.prototype.addFontLink = function(font){
      
        var link = this.options.api + font;
      
        if ($("link[href*='" + font + "']").length === 0){
      $('link:last').after('<link href="' + link + '" rel="stylesheet" type="text/css">');
    }
      };
    
      return Fontselect;
    })();

    return this.each(function(options) {        
      // If options exist, lets merge them
      if (options) $.extend( settings, options );
      
      return new Fontselect(this, settings);
    });

  };
})(jQuery);
