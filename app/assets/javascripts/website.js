$(document).on('turbolinks:load', function() {
  var sliderheight = $(".header").css("height");
  $(".dropdown-button").dropdown();
  $('ul.tabs').tabs();
  $('.slider').slider({
    indicators: false,
    height: sliderheight,
  });
  $('.carousel').carousel();
  $(".button-collapse").sideNav();
})
