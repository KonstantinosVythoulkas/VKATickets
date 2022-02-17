
 $('.myButton').attr("disabled", true);
$('#password, #password_comf').on('keyup', function () {
    if ( $('#password').val() != "" && $('#password').val().length < 8 )
{
    $('#password_length').css('color','red');
    $('#password_match').css('color','red');

} else if ($('#password').val() == "" && $('#password_comf').val() != "")  {
    $('#password_length').css('color','white');
    $('#password_match').css('color','red');

} else if ($('#password').val() == "") {
    $('#password_length').css('color','white');
    $('#password_match').css('color','white');
} else {
    $('#password_length').css('color','#00ed04');
    $('#password_match').css('color','red');

}
if ($('#password').val() == $('#password_comf').val() && $('#password').val().length >= 8) {
   $('#password_comf').attr('style','border:4px solid #00ed04');
   $('#password').attr('style','border:4px solid #00ed04');
   $('.password_restore_form').css('border-color', '#00ed04');
   $('.myButton').attr("disabled", false);
   $('#password_match').css('color','#00ed04');
   $('#edit_title').css('color','#00ed04');
   $("#password_match").text("Password matches with password confirmation");
   $('.myButton').show();

} else { 
   $('.password_restore_form').css('border-color', 'wheat');
   $('#password_comf').attr('style','border:4px solid #ed1000');
   $('#password').attr('style','border:4px solid #ed1000');
   $("#password_match").text("Password doesn't match with password confirmation");
   $('#edit_title').css('color','wheat');

   $('.myButton').attr("disabled", true);

}});
// forgoten password_checks
$('#passwordButton').attr("disabled", true);
$('#forgoten_password, #forgoten_password_comf').on('keyup', function () {
    if ( $('#forgoten_password').val() != "" && $('#forgoten_password').val().length < 8 )
{
    $('#password_length').css('color','red');
    $('#password_match').css('color','red');

} else if ($('#forgoten_password').val() == "" && $('#forgoten_password_comf').val() != "")  {
    $('#password_length').css('color','white');
    $('#password_match').css('color','red');

} else if ($('#forgoten_password').val() == "") {
    $('#password_length').css('color','white');
    $('#password_match').css('color','white');
} else {
    $('#password_length').css('color','#00ed04');
    $('#password_match').css('color','red');

}
if ($('#forgoten_password').val() == $('#forgoten_password_comf').val() && $('#forgoten_password').val().length >= 8) {
   $('#forgoten_password_comf').attr('style','border:4px solid #00ed04');
   $('#forgoten_password').attr('style','border:4px solid #00ed04');
   $('.password_restore_form').css('border-color', '#00ed04');
   $('#passwordButton').attr("disabled", false);
   $('#password_match').css('color','#00ed04');
   $('#edit_title').css('color','#00ed04');
   $("#password_match").text("Password matches with password confirmation");
   $('#passwordButton').show();

} else { 
   $('.password_restore_form').css('border-color', 'wheat');
   $('#forgoten_password_comf').attr('style','border:4px solid #ed1000');
   $('#forgoten_password').attr('style','border:4px solid #ed1000');
   $("#password_match").text("Password doesn't match with password confirmation");
   $('#edit_title').css('color','wheat');
   $('#passwordButton').attr("disabled", true);

}});