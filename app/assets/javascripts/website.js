$(document).on('turbolinks:load', function() {
  get_full_chips('products','usage');
  get_full_chips('products','spec');
  $(".dropdown-button").dropdown();
  $('ul.tabs').tabs();
  $('.slider').slider();
  $('.carousel').carousel();
  $(".button-collapse").sideNav();
  $('.modal').modal({
     opacity: 1 // Opacity of modal background
  });
  Materialize.updateTextFields();
})
