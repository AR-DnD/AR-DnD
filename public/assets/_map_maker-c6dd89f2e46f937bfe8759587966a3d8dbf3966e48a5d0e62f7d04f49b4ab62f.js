/* globals $ */


$(document).on('turbolinks:load', function () {
  $("input[type='submit'][name='commit'][value='Create Map']").prop('disabled', true)

  var currElement = 'obj-Tree'
  var grid = [[null, null, null], [null, null, null], [null, null, null]]
  if ($('#map_data').val()) {
    var savedState = JSON.parse($('#map_data').val())
    for (var i = 0; i < savedState.length; i++) {
      for (var j = 0; j < savedState[i].length; j++) {
        var stringID = String(i) + '-' + String(j)
        var currGridCoord = $('#' + stringID)
        if (savedState[i][j]) {
          var currGridElement = savedState[i][j].split('-')
          currGridCoord.css('background-image', 'url(/assets/' + currGridElement[1] + '.png)')
          if (currGridElement[0] === 'char') {
            currGridCoord.empty()
            $('<p>' + currGridElement[2] + '</p>').appendTo(currGridCoord)
          }
        }
      }
    }
    grid = savedState
  }

  $('#map_data').val(JSON.stringify(grid))

  $('input').on('click', function () {
    $('#log').html($('input:checked').val() + ' is checked!')
  })

  $('.mapElement').on('click', function () {
    currElement = $(this).attr('id')
    $('.selected').html('You have selected: ' + currElement)
  })

  $('.btn-mapgrid').unbind('click').on('click', function (e) {
    e.stopPropagation()
    e.preventDefault()
    if ($('#show_map-flag').length > 0) {
      return
    }
    var currData = currElement.split('-')
    if (currData[0] === 'char') {
      $(this).empty()
      $('<p>' + currData[2] + '</p>').appendTo($(this))
      for (var i = 0; i < grid.length; i++) {
        for (var j = 0; j < grid.length; j++) {
          if (grid[i][j] === currElement) {
            grid[i][j] = null
            var stringID = String(i) + '-' + String(j)
            var currGridCoord = $('#' + stringID)
            currGridCoord.css('background-image', '')
            currGridCoord.html('')
          }
        }
      }
    }
    var coords = $(this).attr('id').split('-')
    var rowNum = coords[0]
    var colNum = coords[1]
    rowNum = parseInt(rowNum)
    colNum = parseInt(colNum)
    if (currData[1] === 'Nil') {
      grid[rowNum][colNum] = null
      $(this).css('background-image', '')
      $(this).html('')
      $(this).empty()
    } else {
      grid[rowNum][colNum] = currElement
      var imageUrlString = '/assets/' + currData[1] + '.png'
      $(this).css('background-image', 'url(' + imageUrlString + ')')
    }
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
