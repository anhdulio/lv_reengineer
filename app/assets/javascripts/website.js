$(document).on('turbolinks:load', function() {
  fbq('track', 'PageView');
  fbq('track', 'ViewContent');   
  $("body").removeClass("md-theme-default");
  get_full_chips('products','usage');
  get_full_chips('products','spec');
  $(".dropdown-button").dropdown();
  $('ul.tabs').tabs();
  $('#homepage').slider();
  $('.carousel').carousel();
  $(".button-collapse").sideNav();
  $('.modal').modal({
     opacity: 1 // Opacity of modal background
  });
  // Landing page
  $('#landing').slider({
    indicators: false
  });
  $('#landing').slider('pause');
  $(".next").bind("click", function(){
    $('#landing').slider('next');
    $('#landing').slider('pause');
  });
  $(".previous").bind("click", function(){
    $('#landing').slider('prev');
    $('#landing').slider('pause');
  });

  if (typeof $("#landing #crmWebToEntityForm > form > div:nth-child(6) > input")[0] != "undefined") {
    $("#landing #crmWebToEntityForm > form > div:nth-child(6) > input")[0].value = "Gạo chén cơm x 1 túi 10 kgs"
  }


  // Update all field materialize
  Materialize.updateTextFields();
})
