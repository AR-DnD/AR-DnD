/* globals $ */


$(document).on('turbolinks:load', function () {
  $("input[type='submit'][name='commit'][value='Create Map']").prop('disabled', true)

  var currElement = 'Tree'
  var grid = [[null, null, null], [null, null, null], [null, null, null]]
  var savedState = JSON.parse($('#map_data').val())
  for (var i = 0; i < savedState.length; i++) {
    for (var j = 0; j < savedState[i].length; j++) {
      var stringID = String(i) + '-' + String(j)
      var currGridCoord = $('#' + stringID)
      var currGridElement = savedState[i][j]
      if (currGridElement) {
        currGridCoord.css('background-image', 'url(/assets/' + currGridElement + '.png)')
      }
    }
  }
  grid = savedState
  console.log('grid', grid)

  $('#map_data').val(JSON.stringify(grid))

  $('input').on('click', function () {
    $('#log').html($('input:checked').val() + ' is checked!')
  })

  $('.mapElement').on('click', function () {
    currElement = $(this).attr('id')
    console.log('currElement', currElement)
    $('.selected').html('You have selected: ' + currElement)
  })

  $('.btn-mapgrid').on('click', function () {
    if ($('#show_map-flag').length > 0) {
      return
    }
    var coords = $(this).attr('id').split('-')
    var rowNum = coords[0]
    var colNum = coords[1]
    rowNum = parseInt(rowNum)
    colNum = parseInt(colNum)
    if (currElement === 'Nil') {
      grid[rowNum][colNum] = null
    } else {
      grid[rowNum][colNum] = currElement
    }
    var imageUrlString = '/assets/' + currElement + '.png'
    console.log('imageUrlString', imageUrlString)
    $(this).css('background-image', 'url(' + imageUrlString + ')')
    $('#map_data').val(JSON.stringify(grid))
  })

  $('#map_name').on('keyup', function () {
    if (!$(this).val() || !$('#map_story').val()) {
      $("input[type='submit'][name='commit'][value='Create Map']").prop('disabled', true)
    } else {
      $("input[type='submit'][name='commit'][value='Create Map']").prop('disabled', false)
    }
  })

  $('#map_story').on('keyup', function () {
    if (!$('#map_name').val() || !$(this).val()) {
      $("input[type='submit'][name='commit'][value='Create Map']").prop('disabled', true)
    } else {
      $("input[type='submit'][name='commit'][value='Create Map']").prop('disabled', false)
    }
  })
})
;
