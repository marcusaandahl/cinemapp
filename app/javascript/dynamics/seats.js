$(".seat-selectable").click(function(){
  $(this).toggleClass("seat-selected");
})

$(document).ready(function(i){
  $('#bookings_form')[0].reset();
  loadSeats();
});

const displayPrice = () => {
  // get all the selected seats
  const selectedSeats = document.querySelectorAll('.seat-selected');
  // for each sum the base prices
  // and sum the discounted prices
  let baseSum = 0;
  let discountedSum = 0;

  selectedSeats.forEach((seat) => {
    baseSum += parseFloat(seat.dataset.price, 10);
    discountedSum += parseFloat(seat.dataset.discountprice, 10);
  });
  // select the original-price and discounted-price spans, and change the content with the new values
  const originalSpan = document.querySelector('#original-price');
  originalSpan.innerHTML = baseSum + " kr"
  const discountedSpan = document.querySelector('#discounted-price');
  discountedSpan.innerHTML = discountedSum + " kr"
}


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
        displayPrice();
      });
    }
  });
}

function toggleSeatToList(seatID, seatName, seatPrice, seatDiscount) {
  if ($("#"+seatID).hasClass("seat-selected") === true) {
    $("#bookings-list > p").hide();
    $("#bookings-list").append(`<div class="seat-list" id="listed-${seatID}"><p>${seatName}</p></div>`);
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
