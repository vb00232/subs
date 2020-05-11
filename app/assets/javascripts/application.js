// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require_tree ./channels

//this keeps the footer at the bottom of the page
$(document).ready(function() {
  var docHeight = $(window).height();
  var footerHeight = $('#footer').height();
  var footerTop = $('#footer').position().top + footerHeight;

  if (footerTop < docHeight)
      $('#footer').css('margin-top', 10+ (docHeight - footerTop) + 'px');

  $('#A2').hide();
  $('#q2').click(function(){
    $('#A2').toggle();
  });
  $('#A3').hide();
  $('#q3').click(function(){
    $('#A3').toggle();
  });
  $('#A4').hide();
  $('#q4').click(function(){
    $('#A4').toggle();
  });
  $('#A5').hide();
  $('#q5').click(function(){
    $('#A5').toggle();
  });
});

//when a user logs in, signs up or logs out then a message is displayed
//this removes that message after a certain time period
$(document).ready(function(){
   setTimeout(function(){
      $("p.notice").hide("slow");
   },1000);
});

//Following is all for the carousel on main(view listings) page
//Had to split each carousel track so they didn't all move together
//and only moved for the particular category
$(document).ready(function(){
  const carouselWidth = $(".carousel-container").width()

  let indexart = 0;
  $(".nextart").click(function(){
    indexart++;
    $(".trackart").css("transform", `translateX(-${indexart*carouselWidth}px)`)
    if(indexart == 1){
      $(".nextart").css("display", "none")
      $(".prevart").css("display", "block")
    }
  });
  $(".prevart").click(function(){
    indexart--;
    $(".trackart").css("transform", `translateX(-${indexart*carouselWidth}px)`)
    if(indexart==0){
      $(".nextart").css("display", "block")
      $(".prevart").css("display", "none")
    }
  });

  let indexbooks = 0;
  $(".nextbooks").click(function(){
    indexbooks++;
    $(".trackbooks").css("transform", `translateX(-${indexbooks*carouselWidth}px)`)
    if(indexbooks == 1){
      $(".nextbooks").css("display", "none")
      $(".prevbooks").css("display", "block")
    }
  });
  $(".prevbooks").click(function(){
    indexbooks--;
    $(".trackbooks").css("transform", `translateX(-${indexbooks*carouselWidth}px)`)
    if(indexbooks==0){
      $(".nextbooks").css("display", "block")
      $(".prevbooks").css("display", "none")
    }
  });

  let indexclothes = 0;
  $(".nextclothes").click(function(){
    indexclothes++;
    $(".trackclothes").css("transform", `translateX(-${indexclothes*carouselWidth}px)`)
    if(indexclothes == 1){
      $(".nextclothes").css("display", "none")
      $(".prevclothes").css("display", "block")
    }
  });
  $(".prevclothes").click(function(){
    indexclothes--;
    $(".trackclothes").css("transform", `translateX(-${indexclothes*carouselWidth}px)`)
    if(indexclothes==0){
      $(".nextclothes").css("display", "block")
      $(".prevclothes").css("display", "none")
    }
  });

  let indexelectronics = 0;
  $(".nextelectronics").click(function(){
    indexelectronics++;
    $(".trackelectronics").css("transform", `translateX(-${indexelectronics*carouselWidth}px)`)
    if(indexelectronics == 1){
      $(".nextelectronics").css("display", "none")
      $(".prevelectronics").css("display", "block")
    }
  });
  $(".prevelectronics").click(function(){
    indexelectronics--;
    $(".trackelectronics").css("transform", `translateX(-${indexelectronics*carouselWidth}px)`)
    if(indexelectronics==0){
      $(".nextelectronics").css("display", "block")
      $(".prevelectronics").css("display", "none")
    }
  });

  let indexeventtickets = 0;
  $(".nexteventtickets").click(function(){
    indexeventtickets++;
    $(".trackeventtickets").css("transform", `translateX(-${indexeventtickets*carouselWidth}px)`)
    if(indexeventtickets == 1){
      $(".nexteventtickets").css("display", "none")
      $(".preveventtickets").css("display", "block")
    }
  });
  $(".preveventtickets").click(function(){
    indexeventtickets--;
    $(".trackeventtickets").css("transform", `translateX(-${indexeventtickets*carouselWidth}px)`)
    if(indexeventtickets==0){
      $(".nexteventtickets").css("display", "block")
      $(".preveventtickets").css("display", "none")
    }
  });

  let indexfurniture = 0;
  $(".nextfurniture").click(function(){
    indexfurniture++;
    $(".trackfurniture").css("transform", `translateX(-${indexfurniture*carouselWidth}px)`)
    if(indexfurniture == 1){
      $(".nextfurniture").css("display", "none")
      $(".prevfurniture").css("display", "block")
    }
  });
  $(".prevfurniture").click(function(){
    indexfurniture--;
    $(".trackfurniture").css("transform", `translateX(-${indexfurniture*carouselWidth}px)`)
    if(indexfurniture==0){
      $(".nextfurniture").css("display", "block")
      $(".prevfurniture").css("display", "none")
    }
  });

  let indexhealthandbeauty = 0;
  $(".nexthealthandbeauty").click(function(){
    indexhealthandbeauty++;
    $(".trackhealthandbeauty").css("transform", `translateX(-${indexhealthandbeauty*carouselWidth}px)`)
    if(indexhealthandbeauty == 1){
      $(".nexthealthandbeauty").css("display", "none")
      $(".prevhealthandbeauty").css("display", "block")
    }
  });
  $(".prevhealthandbeauty").click(function(){
    indexhealthandbeauty--;
    $(".trackhealthandbeauty").css("transform", `translateX(-${indexhealthandbeauty*carouselWidth}px)`)
    if(indexhealthandbeauty==0){
      $(".nexthealthandbeauty").css("display", "block")
      $(".prevhealthandbeauty").css("display", "none")
    }
  });

  let indexjewelry = 0;
  $(".nextjewelry").click(function(){
    indexjewelry++;
    $(".trackjewelry").css("transform", `translateX(-${indexjewelry*carouselWidth}px)`)
    if(indexjewelry == 1){
      $(".nextjewelry").css("display", "none")
      $(".prevjewelry").css("display", "block")
    }
  });
  $(".prevjewelry").click(function(){
    indexjewelry--;
    $(".trackjewelry").css("transform", `translateX(-${indexjewelry*carouselWidth}px)`)
    if(indexjewelry==0){
      $(".nextjewelry").css("display", "block")
      $(".prevjewelry").css("display", "none")
    }
  });

  let indexvideogamesandconsoles = 0;
  $(".nextvideogamesandconsoles").click(function(){
    indexvideogamesandconsoles++;
    $(".trackvideogamesandconsoles").css("transform", `translateX(-${indexvideogamesandconsoles*carouselWidth}px)`)
    if(indexvideogamesandconsoles == 1){
      $(".nextvideogamesandconsoles").css("display", "none")
      $(".prevvideogamesandconsoles").css("display", "block")
    }
  });
  $(".prevvideogamesandconsoles").click(function(){
    indexvideogamesandconsoles--;
    $(".trackvideogamesandconsoles").css("transform", `translateX(-${indexvideogamesandconsoles*carouselWidth}px)`)
    if(indexvideogamesandconsoles==0){
      $(".nextvideogamesandconsoles").css("display", "block")
      $(".prevvideogamesandconsoles").css("display", "none")
    }
  });

});
