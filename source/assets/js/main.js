$("document").ready(function(){
	$('#nav').tinyNav({
		indent: '→',
	});
	//Tocify
	$(function(){
		var toc = $("#toc").tocify({
			context: ".r_guide-block",
			extendPage: false,
			showAndHide: false
		});
	});
	$(window).scroll(function(){
		var bottom = $('#r_guide-selector').position().top+$('#r_guide-selector').outerHeight(true);
		var trueHeight = bottom - 545;
		console.log(bottom);
		//
		var scroll = $(window).scrollTop();
		if (scroll >= trueHeight){
			$("#toc").fadeOut(100);
		}else{
			$("#toc").fadeIn(100);
		}
	});
	// Newton
	var newtonHeight = $(".newton").height() - 40;
	var nav = $('.narrow-docs-nav');
	nav.css({
		height: newtonHeight
	});
});