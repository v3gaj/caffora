// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require turbolinks
//= require jquery.slick
//= require home
//= require jquery_ujs
//= require jquery.remotipart
//= require modernizr.min
//= require_tree .


function menu() {

    if (window.innerWidth < 801 ) {
      $("#menu_mobile").removeClass("noDisplay");
      $("#menu_classic").addClass("noDisplay");
    }else{
      $("#menu_mobile").addClass("noDisplay");
      $("#menu_classic").removeClass("noDisplay");
    }
}

var show = false;

function showMenu() {

	if ($('#menu_classic').css("display") == 'none'){
		$('#menu_classic').addClass("display");
    	show = true;
    }else{
    	$('#menu_classic').removeClass("display");
    	show = false;
    }	
}

$(document).ready(function() {
  	menu();
});


$( window ).resize(function() {
	menu();
});


window.addEventListener("turbolinks:load",function(event){
	if (window.innerWidth < 801 ) {
		if (show === true) {
			$('#menu_classic').removeClass("noDisplay");
		}else{
			$('#menu_classic').addClass("noDisplay");
		}
	}
});


jQuery(document).ready(function($) {
  "use strict";
  /* pretty photo */
  $(document).ready(function(){
    $("a[data-rel^='prettyPhoto']").prettyPhoto();
    $("a.prettyphoto").prettyPhoto();
    $("a[data-rel^='prettyPhoto']").prettyPhoto({hook:"data-rel",social_tools:!1,theme:"pp_default",horizontal_padding:20,opacity:.8,deeplinking:!1});
   })
});

$(document).on('turbolinks:load', function() {
  $('.open_collection').on('click', function(event) {
    window.location.reload();
  });
})

document.addEventListener("page:restore", function() {
  app.init();
});
