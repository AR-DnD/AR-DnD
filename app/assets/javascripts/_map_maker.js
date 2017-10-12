$(document).on('turbolinks:load', function(){
  var currElement = "Tree"
  var grid = [[null, null, null], [null, null, null], [null, null, null]]
  if($("#edit_map-flag").length > 0) {
    alert("You are now on the editor. We will try to load up a map");
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
    var coord = $(this)
    var rowNum = coord.attr("id")[0]
    var colNum = coord.attr("id")[1]
    console.log("rownum", rowNum)
    console.log("colNum", colNum)
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
