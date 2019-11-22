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
        toggleSeatToList($(this).attr("id"), $(this).data("name"), $(this).data("price"), $(this).data("discountprice"));
      });
    }
  });
}

function toggleSeatToList(seatID, seatName, seatPrice, seatDiscount) {
  if ($("#"+seatID).hasClass("seat-selected") === true) {
    $("#bookings-list > p").hide();
    $("#bookings-list").append('<div class="seat-list" id="listed-'+seatID+'"><p>Price: '+seatPrice+' Seat: '+seatName+' Discount Price: '+seatDiscount+'</p></div>');
  } else {
    $("#listed-"+seatID).remove();
    if (document.querySelector('.seat-list') === null) {
      $("#bookings-list > p").show();
    }
  }



  function buildDiv(seatID, seatName) {
    var elem = document.createElement("div");
    elem.attr("id", "listed-"+seatID);
    elem.innerHTML("<p>'+seatName+'</p>")
    return elem;
  }
}
