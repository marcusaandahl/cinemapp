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
        toggleSeatToList($(this).attr("id"), $(this).data("name"));
      });
    }
  });
}

function toggleSeatToList(seatID, seatName) {
  if ($("#"+seatID).hasClass("seat-selected") === true) {
    $("#bookings-list").append('<div id="listed-'+seatID+'"><p>'+seatName+'</p></div>');
  } else {
    $("#listed-"+seatID).remove();
  }

  function buildDiv(seatID, seatName) {
    var elem = document.createElement("div");
    elem.attr("id", "listed-"+seatID);
    elem.innerHTML("<p>'+seatName+'</p>")
    return elem;
  }
}
