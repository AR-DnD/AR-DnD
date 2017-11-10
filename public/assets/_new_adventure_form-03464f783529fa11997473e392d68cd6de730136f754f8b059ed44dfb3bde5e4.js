$(document).on("ready", function(){
  $('.field').on("click", function(){
    console.log("(this).val()");
  });
  $('#adventure_title').on("keypress", function(){
    console.log((this).val());
  });
});
