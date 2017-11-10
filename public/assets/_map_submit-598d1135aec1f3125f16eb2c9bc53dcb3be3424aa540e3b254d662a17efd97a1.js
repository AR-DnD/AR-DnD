$('#yourButton').button("disable");​​​​​​​​​​​​​

$('.fields').bind('keyup', function() {
var nameLength = $("#name").length;
var storyLength = $("#story").length;

if (nameLength > 0 && storyLength > 4)
{
   $('#yourButton').button("enable");​​​​​​​​​​​​​
}

} );
