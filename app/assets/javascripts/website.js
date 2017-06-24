$(document).on('turbolinks:load', function() {
  $(".dropdown-button").dropdown();
  $('ul.tabs').tabs();
  $('.slider').slider();
  $('.carousel').carousel();
  $(".button-collapse").sideNav();
  $('.chips-usage').material_chip();
  Materialize.updateTextFields();
  get_full_chips('products','usage');
  get_full_chips('products','spec');
})
