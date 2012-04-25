// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//

//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap


$('.remote-wikipage-link').bind('ajax:before', f);



$(document).ready(function(){

  $("#content-canavas-view").click( f = function(){


  	if ($("#content-canavas-view").hasClass("btn-info")) {

			$("#content-canavas-view").toggleClass("btn-info", false);
			$("#content-canavas-view").toggleClass("btn-success", true);
			$("#content-canavas-view").html("Show Content Canavas");


			$('#content-canavas').hide();

			$("#social-stream").toggleClass("span3", false);
			$("#social-stream").toggleClass("span5", true);
  		$("#social-stream").hide();
  		$('#social-stream').animate({width:"toggle"});

			$("#post_text").toggleClass("span3", false);
			$("#post_text").toggleClass("span5", true);
			$("#post_text").hide();
			$("#post_text").animate({width:"toggle"});

			$(".post-button").toggleClass("span3", false);
			$(".post-button").toggleClass("span5", true);
			$(".post-button").hide();
			$(".post-button").animate({width:"toggle"});


			$("#content-stream").toggleClass("span3", false);
			$("#content-stream").toggleClass("span7", true);
  		$("#content-stream").hide();
  		$('#content-stream').animate({width:"toggle"});

  	}

  	else {
			$("#content-canavas").show();

			$("#content-stream").toggleClass("span7", false);
			$("#content-stream").toggleClass("span3", true);



			$("#social-stream").toggleClass("span5", false);
			$("#social-stream").toggleClass("span3", true);
			$("#social-stream").hide();
  		$('#social-stream').animate({width:"toggle"});

			$("#post_text").toggleClass("span5", false);
			$("#post_text").toggleClass("span3", true);

			$(".post-button").toggleClass("span5", false);
			$(".post-button").toggleClass("span3", true);

			$("#content-canavas-view").toggleClass("btn-success", false);
			$("#content-canavas-view").toggleClass("btn-info", true);

			$("#content-canavas-view").html("Hide Content Canavas");

  	}

  });




	$('.dropdown-toggle').dropdown();

});

