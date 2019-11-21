$(".seat-selectable").click(function(){
  $(this).toggleClass("seat-selected");
})

$(document).ready(function(i){
  $('#bookings_form')[0].reset();
  loadSeats();
});

function loadSeats() {
  $(".seat").each(function(i){
    if ($(this).data("booked") === true) {
      $(this).addClass("booked");
      console.log($(this).attr("id"));
      $("#"+($(this).attr("id")).replace("seat-", "")).attr("id", "booked");
    } else {
      $(this).click(function(){
        $(this).toggleClass("seat-selected");
      });
    }
  });
}
