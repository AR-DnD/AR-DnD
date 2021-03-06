$(document).on('turbolinks:load', function(){
  $("input[type='submit'][name='commit'][value='Create Map']").prop("disabled",true);

  var grid = Array(3).fill().map(x => Array(3).fill(null))
  console.log(grid)
  var currElement = "Tree"
  //var grid = [[null, null, null], [null, null, null], [null, null, null]]
  if($("#edit_map-flag").length > 0) {
    var savedState = JSON.parse($("#map_data").val())
    console.log(savedState)
    for (var i = 0; i < savedState.length; i++) {
      for (var j = 0; j < savedState[i].length; j++) {
        var stringID = String(i) + "-" + String(j)
        var currGridCoord = $("#" + stringID)
        var currGridElement = savedState[i][j]
        if (currGridElement) {
          //currGridCoord.html(currGridElement)
          currGridCoord.css("background-image", "url(/assets/" + currGridElement + ".png)")
        }
      }
    }
    grid = savedState
  }
  if ($("#show_map-flag").length > 0) {
    var savedState = JSON.parse($("#map_data").html())
    console.log(savedState)
    for (var i = 0; i < savedState.length; i++) {
      for (var j = 0; j < savedState[i].length; j++) {
        var stringID = String(i) + "-" + String(j)
        var currGridCoord = $("#" + stringID)
        var currGridElement = savedState[i][j]
        if (currGridElement) {
          currGridCoord.css("background-image", "url(/assets/" + currGridElement + ".png)")
        }
      }
    }
  }

  $("#map_data").val(JSON.stringify(grid))

  $( "input" ).on( "click", function() {
    $( "#log" ).html( $( "input:checked" ).val() + " is checked!" );
    console.log("here")
  });

  $( ".mapElement" ).on("click", function() {
    currElement = $(this).attr("id")
    $(".selected").html("You have selected: " + currElement)
    console.log("currElement", currElement)
  })

  $( ".btn-mapgrid" ).on("click", function() {
    if ($("#show_map-flag").length > 0){
      return
    }
    var coords = $(this).attr("id").split("-")
    var rowNum = coords[0]
    var colNum = coords[1]
    rowNum = parseInt(rowNum)
    colNum = parseInt(colNum)
    if (currElement == "Nil") {
      grid[rowNum][colNum] = null
    } else {
      grid[rowNum][colNum] = currElement
    }
    console.log("Grid", grid)
    var imageUrlString = "/assets/" + currElement + ".png"
    $(this).css("background-image", "url(" + imageUrlString + ")")
    //$(this).html(currElement)
    $("#map_data").val(JSON.stringify(grid))
  })

  $("#map_name").on("keyup", function(){
    if(!$(this).val() || !$("#map_story").val()){
      console.log("Do NOT Submit");
      $("input[type='submit'][name='commit'][value='Create Map']").prop("disabled",true);
    } else {
      $("input[type='submit'][name='commit'][value='Create Map']").prop("disabled",false);

    }
  })

  $("#map_story").on("keyup", function(){
    if(!$("#map_name").val() || !$(this).val()){
      console.log("Do NOT Submit");
      $("input[type='submit'][name='commit'][value='Create Map']").prop("disabled",true);
    } else {
      $("input[type='submit'][name='commit'][value='Create Map']").prop("disabled",false);
    }of
  })
});
