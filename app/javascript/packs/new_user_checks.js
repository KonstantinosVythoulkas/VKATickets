$('#new_user_button').attr("disabled", true);
//Username Checks
$('#username').on('keyup', function (){
    if ($('#username').val() != "" && $('#username').val().length < 4 ){
        $('#username_valid').css('color','red');
        $('#username').attr('style','border:4px solid red');
        $('#username_valid').text("Username should be at least 4 chars no space,numbers or symbols allowed");

    }
    else if ($('#username').val() == "") {
        $('#username_valid').css('color','wheat');
        $('#username').css('border','red');
        $('#username_valid').text("Username should be at least 4 chars no space,numbers or symbols allowed");

    }
    else if ($('#username').val().match("^[A-Za-z]+$")) {
     $('#username_valid').css('color','#00ed04');
     $('#username').attr('style','border:4px solid #00ed04');
}
    else {
        $('#username').css('border','');
        $('#username_valid').css('color','red');
        $('#username_valid').text("Username should be at least 4 chars no space,numbers or symbols allowed");
    }
})

//Email Checks
$('#Email').on('keyup', function (){
     if ($('#Email').val() == "") {
        $('#email_valid').css('color','wheat');
        $('#Email').css('border','');
        $('#email_valid').text("Email should be valid format");

    }
    else if ($('#Email').val().match("^[^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$")) {
     $('#email_valid').css('color','#00ed04');
     $('#Email').attr('style','border:4px solid #00ed04');
     $('#email_valid').text("Email is Valid");
}
    else {
        $('#email').css('border','');
        $('#Email').css('border','');
        $('#email_valid').css('color','red');
        $('#email_valid').text("Email isn't valid");
    }
})
//Password Checks
$('#new_password, #password_com').on('keyup', function () {
    if ( $('#new_password').val() != "" && $('#new_password').val().length < 8 )
{
    $('#password_length').css('color','red');
    $('#password_match').css('color','red');

} else if ($('#new_password').val() == "" && $('#password_com').val() != "")  {
    $('#password_length').css('color','wheat');
    $('#password_match').css('color','red');

}  else if ($('#new_password').val() ==  $('#password_com').val()){
    $('#password_match').css('color','#00ed04');
    $('#password_match').text("Password matches with password confirmation");


} else if ($('#new_password').val() == "") {
    $('#password_length').css('color','wheat');
    $('#password_match').css('color','wheat');

} else if  ( $('#new_password').val().length >= 8 ){
    $('#password_length').css('color','#00ed04');

} else {
    $('#password_length').css('color','#00ed04');
    $('#password_match').css('color','red');
}

 if ($('#new_password').val() == $('#password_com').val() && $('#new_password').val().length >= 8 && $('#username').val().length >= 4 && $('#username').val().match("^[A-Za-z]+$") ) {
   $('#password_com').attr('style','border:4px solid #00ed04');
   $('#new_password').attr('style','border:4px solid #00ed04');
   $('#new_user_button').attr("disabled", false);
   $('#password_match').css('color','#00ed04');
   $("#password_match").text("Password matches with password confirmation");

} else { 
   $('.password_restore_form').css('border-color', 'wheat');
   $('#password_com').attr('style','border:4px solid #ed1000');
   $('#new_password').attr('style','border:4px solid #ed1000');
   $("#password_match").text("Password doesn't match with password confirmation");
   $('#new_user_button').attr("disabled", true);

}});