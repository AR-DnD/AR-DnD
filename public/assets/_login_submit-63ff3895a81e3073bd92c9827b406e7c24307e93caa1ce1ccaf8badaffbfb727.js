$('#yourButton').button("disable");​​​​​​​​​​​​​

$('.fields').bind('keyup', function() {
var emailLength = $("#email").length;
var passwordLength = $("#password").length;

if (emailLength > 0 && passwordLength > 4)
{
   $('#yourButton').button("enable");​​​​​​​​​​​​​
}

} );
