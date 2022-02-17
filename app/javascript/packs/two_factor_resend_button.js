$(document).ready(function() {
    $('#resend').hide().delay(Math.floor((Math.random() * 10000) + 10000)).fadeIn(2200);
   });
   $('#resend').click(function() {
     $('#resend').hide().delay(Math.floor((Math.random() * 60000) + 120000)).fadeIn(2200);
     });