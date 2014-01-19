// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready(function(){
	$("#pwd").hide();
	$(".click").click(function(){
		$("#pwd").slideToggle();
	});

	$("#user_vehicles").hide();
	$(".up").hide();
	$(".up").click(function(){
		$("#user_vehicles").slideUp();
		$(".up").hide();
		$(".down").show();
  });

	$(".down").click(function(){
		$("#user_vehicles").slideDown();
		$(".down").hide();
		$(".up").show();
	});
});

