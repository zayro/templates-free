var searchFocus = false,
		menuYloc = null;

$(document).ready( function () {
		/* Scrolling Menu & Sidebar */
		if (!$.browser.msie) {
			menuYloc = parseInt($("#nav").css("top").substring( 0, $("#nav").css("top").indexOf("px")));
			$(window).scroll(function () {  
					var offset = $(document).scrollTop() + 20 + "px";
					if ($(document).scrollTop() > 155) $("#nav, #sidebar").animate({ top: offset }, { duration: 500, queue: false });
					else $("#nav, #sidebar").animate({ top: menuYloc + "px" }, { duration: 500, queue: false });
				});
		}
		
		/* Navigation */
		$("#nav li").hover( function () {
				$(this).find("ul").stop(true, true).slideDown("slow");
			}, function () {
				if (!$(this).hasClass("active")) $(this).find("ul").stop(true, true).delay(3000).slideUp("slow");
			});
		
		/* Sidebar */
		$("#sidebar .wrap").hover( function () {
				var a = false;
				if ($(this).parent().hasClass("search")) $(this).children(".inner").stop(true, true).animate({ width: "104px" }, "slow");
				else {
					$(this).children(".inner").stop(true, true).slideDown("slow");
					$(this).css({ display: "block" });
				}
			}, function () {
				if ($(this).parent().hasClass("search")) { if (searchFocus == false) $(this).children(".inner").stop(true, true).delay(2000).animate({ width: "0" }, "slow"); }
				else {
					$(this).children(".inner").stop(true, true).delay(3000).slideUp("slow");
					$(this).delay(3000).css({ display: "inline-block" });
				}
			});
		
		/* Search: stay active if clicked */
		$("#searchfield").click( function () {
				$(this).addClass("active");
				if ($(this).val() == "Keyword") $(this).val("");
				searchFocus = true;
			});
		
		/* Show entry-info @ blog-page */
		$("#content .article").hover( function () {
				$(this).children(".shadow.info-shadow").stop(true, false).delay(500).animate({ width: "152px", paddingLeft: "12px" }, "slow");
				$(this).children(".img").children("a").append('<div class="overlay"></div>');
				$(this).find(".overlay").css({ opacity: 0 }).animate({ opacity: 0.1 });
			}, function () {
				$(this).find(".overlay").stop(true, true).animate({ opacity: 0 }, function () { $(this).remove(); });
				$(this).children(".shadow.info-shadow").stop(true, false).animate({ width: "0px", paddingLeft: "0" }, "slow");
			});
		
		/* Show entry-info @ entry-page */
		$("#content .header").hover( function () { $(this).children(".inner-shadow").stop(true, false).delay(500).animate({ height: "56px" }, "slow"); },
				function () { $(this).children(".inner-shadow").stop(true, false).animate({ height: "0px" }, "slow"); });
		
		/* Show info @ portfolio */
		$(".portfolio").hover( function () {
				$(this).find(".info-shadow").stop(true, false).delay(500).animate({ height: "65px", paddingBottom: "28px" }, "slow");
				$(this).find("a").append('<span class="overlay"></span>');
				$(this).find(".overlay").css({ opacity: 0 }).animate({ opacity: 0.1 });
			}, function () {
				$(this).find(".overlay").stop(true, true).animate({ opacity: 0 }, function () { $(this).remove(); });
				$(this).find(".info-shadow").stop(true, false).animate({ height: "0px", paddingBottom: "0" }, "slow");
			});
		
		/* Give Feedback when hovering the follow-icons */
		$(".follow li").hover( function () {
				$(this).children("a").append('<div class="overlay"></div>');
				$(this).find(".overlay").css({ opacity: 0 }).animate({ opacity: 0.3 });
			}, function () { $(this).find(".overlay").stop(true, true).animate({ opacity: 0 }, function () { $(this).remove(); }); });
		
		/* contact-form handler */
		$("#formSubmit").click(function () {
				var that = $(this);
				that.css ({ display: "none" });
				$(this).parent().append('<img src="./images/loader.gif" alt="Loading..." id="formLoad" style="margin: 10px;" />');
				
				/* Init variables */
				var pre 	= $("#formPre").val();
				var name 	= $("#formName").val();
				var mail	= $("#formMail").val();
				var phone = $("#formPhone").val();
				var text 	= $("#formText").val();
				
				/* Load form-function asynchron */
				$("#formReturn").load("ajax/contact.php", {send: true, prename: pre, name: name, mail: mail, phone: phone, text: text },
						function () {
							$("#formReturn p.error").animate({ top:"-=10px" }, 100).animate({ top:"+=10px" }, 100).animate({ top:"-=10px" }, 100).animate({ top:"+=10px" }, 100);
							that.parent().find("#formLoad").remove();
							that.css({ display: "block" });
					});
				
				return false;
			});
		
		// Background-color-fade for tables
		$("table tr").hover( function() { $(this).css({backgroundColor: "#f1f1f1"})}, 
			function(){ if ($(this).hasClass("odd")) $(this).animate({backgroundColor: "#fafafa"}, 750); else $(this).stop(true, false).animate({backgroundColor: "#fff"}, 750); });
		
	});

$(window).resize( function () {
		/* Resize portfolio-entry on window resizing to keep square */
		$(".portfolio").each( function () {
				$(this).css({ height: $(this).width() });
			});
	});