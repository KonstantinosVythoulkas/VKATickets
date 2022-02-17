$(document).ready(function(){
    $(".custom-control-label").click(function(){
      if (this.value == "inactive") {
      alert("We recommend to keep two factor active!")
      $("#save_detailes").trigger('click');
      } else {
        alert("You will get a one time code in your email each time you trying to login" + " " + this.value)
      $("#save_detailes").trigger('click');
      }
    });
  });