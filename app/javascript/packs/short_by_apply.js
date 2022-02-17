
  if ($('#short_by').val() === "07") {
    document.getElementById("search_id").style.display = "inline-block"
    document.getElementById("search_button").style.display = "inline-block"}
$(document).on('change', '.dropbtn', function() {
  if ($('#short_by').val() === "07") {
    document.getElementById("search_id").style.display = "inline-block"
    document.getElementById("search_button").style.display = "inline-block"
  } else {
    $('.filter').trigger( "click" );
}});