// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//

//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.spin
//= require_tree .

$('.remote-wikipage-link').bind('ajax:beforeSend', function() {
	$('#content-canavas').fadeOut();
	$('#content-canavas').spin();
});

$('.remote-wikipage-link').bind('ajax:complete', function() {
	$('#content-canavas').fadeIn();
});


$('.new_post').bind('ajax:beforeSend', function() {
	$('#post:first').hide();
	$('#post:first').fadeIn();
});

$(function()
{
	$('#social-stream-table').jScrollPane();
	$('#content-stream-table').jScrollPane();

	$(".jspVerticalBar").hide();

});

$("#social-stream-table").hover(function(){$("#social-stream-table .jspVerticalBar").show();}, function(){$("#social-stream-table .jspVerticalBar").hide();});

$("#content-stream-table").hover(function(){$("#content-stream-table .jspVerticalBar").show();}, function(){$("#content-stream-table .jspVerticalBar").hide();});

$("#group-publisher-text").click(function(){
	$("#group-publisher-text").attr("rows","3");
});

