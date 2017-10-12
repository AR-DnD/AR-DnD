$(document).on('turbolinks:load', function(){
  var currElement = "Tree"
  var grid = [[null, null, null], [null, null, null], [null, null, null]]
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

  $( "input" ).on( "click", function() {
    $( "#log" ).html( $( "input:checked" ).val() + " is checked!" );
    console.log("here")
  });

  $( ".mapElement" ).on("click", function() {
    currElement = $(this).attr("id")
    console.log("currElement", currElement)
  })

  $( ".btn-lg" ).on("click", function() {

    var coords = $(this).attr("id").split("-")
    var rowNum = coords[0]
    var colNum = coords[1]
    //var coords = $(this)
    //var rowNum = coord.attr("id")[0]
    //var colNum = coord.attr("id")[1]
    //console.log("rownum", rowNum)
    //console.log("colNum", colNum)
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
});
