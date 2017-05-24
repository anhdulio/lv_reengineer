$(document).ready(function(){
  var sliderheight = $(".header").css("height");
  $(".dropdown-button").dropdown();
  $('ul.tabs').tabs();
  $('.slider').slider({
    indicators: false,
    height: sliderheight,
    });
})