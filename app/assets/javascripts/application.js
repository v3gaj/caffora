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

$(document).on('turbolinks:load', function() {

    slickSlider();
    ajaxExec();
    ajaxBack();
    ajaxPosts();
    prettyPhot();

    setTimeout(function() {
        $('body').css({ opacity: "1"});
    }, 1500);   
});

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
      $('#menu_classic').addClass("noDisplay");
    	show = false;
    }	
}

// Funcion mostrar elemento del menu seleccionado con Ajax

function isActive(){
    
    var path = window.location.href;


    $("#menu_classic a").each(function(){

      var href = $(this).attr("href");
      $(this).removeClass('active');
      if (href === "/"){
        if (path.substring(19, path.length) === href || path.substring(21, path.length) === href) {
          $(this).addClass('active');
        }
      }else{
        if (path.substring(19, href.length + 19) === href || path.substring(21, href.length + 21) === href) {
          $(this).addClass('active');
        }
      }
    }); 
};



$(document).ready(function() {
    menu();
});


$( window ).resize(function() {
	menu();
});


window.addEventListener("turbolinks:load",function(event){
	if (window.innerWidth < 801 ) {
		if (show === true) {
			$('#menu_classic').addClass("display");
		}else{
			$('#menu_classic').removeClass("display");
		}
	}
});

function prettyPhot() {
    jQuery(document).ready(function($) {
      "use strict";
      /* pretty photo */
      $(document).ready(function(){
        $("a[data-rel^='prettyPhoto']").prettyPhoto();
        $("a.prettyphoto").prettyPhoto();
        $("a[data-rel^='prettyPhoto']").prettyPhoto({hook:"data-rel",social_tools:!1,theme:"pp_default",horizontal_padding:20,opacity:.8,deeplinking:!1});
       })
    });
}



// Funcion para ejecutar el slider

function slickSlider() {
  $('.scroller').not('.slick-initialized').slick({
    autoplay: true, dots: false, pauseOnHover: false, pauseOnFocus: false
  })

  $('.center').not('.slick-initialized').slick({
    centerMode: true,
    centerPadding: '100px',
    slidesToShow: 1,
    autoplay: true,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          arrows: true,
          centerMode: true,
          centerPadding: '40px',
          slidesToShow: 3
        }
      },
      {
        breakpoint: 480,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: '40px',
          slidesToShow: 1
        }
      }
    ]
  });
}

// Funcion para aplicar ajax

function ajaxExec(){ 
    $(document).on('click', '.ajaxLink', function(event){
        event.preventDefault();

        $('#Content').css({ opacity: "0"});
        $('.ajaxLink').bind('click', false);

        var url = $(this).attr('href');
        setTimeout(function() {
            $.ajax({
                dataType: 'html',
                url: url,
                async: true,
                strURl: "",
                cache: false,
                success: function(data){

                    if (url === "/") {
                        $('#Content').html($(data).find('#Content').html());
                    }else{
                        $("#Content").html(data);
                    }
                    window.history.pushState("","", url);

                    $('#Content').css({ opacity: "1"});
                    $('.ajaxLink').unbind('click', false);

                    prettyPhot();
                    ajaxScroll();
                    metaTitle();
                    isActive();
                    slickSlider();
                    
                }
            });
        }, 700); 
        
        event.stopImmediatePropagation();
        return false;
    });
}

// // Funcion para retroceder en el navegador con ajax

function ajaxBack(){
    window.onpopstate = function (event) {
        event.preventDefault();

        $('#Content').css({ opacity: "0"});
        $('.ajaxLink').bind('click', false);
        history.scrollRestoration = 'manual'; //Eliminar scroll a la ultima posicion en pantalla

        var url = window.location.href;
        setTimeout(function() {
            $.ajax({
                dataType: 'html',
                url: url,
                async: true,
                strURl: "",
                cache: false,
                success: function(data){

                    if (url === "http://localhost:3000/" || url === "http://caffora.cafe/" ) {
                        $('#Content').html($(data).find('#Content').html());
                    }else{
                        $("#Content").html(data);
                    }

                    $('#Content').css({ opacity: "1"});
                    $('.ajaxLink').unbind('click', false);

                    prettyPhot();
                    ajaxScroll();
                    metaTitle();
                    isActive();
                    slickSlider();
                    
                }
            });
        }, 700);

        event.stopImmediatePropagation();
        return false;
    }

}

//Funcion para asignar Meta title

function metaTitle(){
    var title = "";
    if ( $(".meta_title").text() || undefined) {
        title = (' | ' + $(".meta_title").text());
    }
    $('title').html('Caffora' + title );     
}

//Funcion para determinar la posicion de la pantalla despues de una ejecucion de Ajax

function ajaxScroll(){

    var menu = $( "header" )[ 0 ];

    var offMenu = menu.offsetTop + menu.scrollHeight;

    if (offMenu < document.body.scrollTop || offMenu < window.pageYOffset || offMenu < document.documentElement.scrollTop) {
        if (window.innerWidth < 1001) {
            $("html, body").scrollTop(offMenu);
        }else{
            $("html, body").scrollTop(0);
        }
    }  
};





function ajaxPosts(){ 

    $(document).on('click', '.post_edit', function(event){

        event.preventDefault();

        var edit = $(this);
        var url = $(this).attr("href");

        $.ajax({
            dataType: 'html',
            url: url,
            success: function(data){

                $(edit).closest('div').html($(data).find('#Content').html());
                
            }
        });

        event.stopImmediatePropagation();
        return false;
    });
}


