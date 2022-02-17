let email_regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');

$('#new_email_conf, #new_email').on('keyup', function () {
if ($("#new_email").val() != $("#new_email_conf").val()) {
    $('#new_email').attr('style','border:4px solid #ed1000');
    $('#new_email_conf').attr('style','border:4px solid #ed1000');
} else if  ($("#new_email").val() == "" &&  $("#new_email_conf").val() == "" ) {
    $('#new_email').attr('style','border:4px solid #ed1000');
    $('#new_email_conf').attr('style','border:4px solid #ed1000');
}
else if ((email_regex.test($("#new_email").val()) == true && (email_regex.test($("#new_email_conf").val() )) == true ) ){
    $('#new_email').attr('style','border:4px solid #00ed04');
    $('#new_email_conf').attr('style','border:4px solid #00ed04');
}
})

$('#MobileNumber').on('keyup', function () {
    if ((/^\d{10}$/.test($("#MobileNumber").val())) == true) {
        $('#MobileNumber').attr('style','border:4px solid #00ed04');
    }
    else {
        $('#MobileNumber').attr('style','border:4px solid #ed1000');
    }
})