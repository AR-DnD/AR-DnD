$(document).on("turbolinks:load", function(){
  $('#adventure_title').on("keyup", function(){
    if(!$(this).val() || !$("#adventure_story").val()){
      $("input[type='submit'][name='commit'][value='Create Adventure']").prop("disabled",true);
    } else {
      $("input[type='submit'][name='commit'][value='Create Adventure']").prop("disabled",false);

    }
  })

  $('#adventure_story').on("keyup", function(){
    console.log($(this).val());
    if(!$("#adventure_title").val() || !$(this).val()){
      $("input[type='submit'][name='commit'][value='Create Adventure']").prop("disabled",true);
    } else {
      $("input[type='submit'][name='commit'][value='Create Adventure']").prop("disabled",false);
    }
  })

});
