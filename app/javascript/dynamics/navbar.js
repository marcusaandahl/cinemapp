var curWidth;
var curHeight;

var ratio = 0.08;

$(document).ready(function(){
  curWidth = $( window ).width();
  curHeight = $( window ).height();
  if (curWidth < curHeight){
    $(".navbar-nav").height((curWidth*ratio)+"px");
  } else {
    $(".navbar-nav").height("100px");
  }

  var type;

  if ((/[/]movies\w*/).test(window.location.pathname)) {
    type = "movies"
  } else if ((/[/]dashboard\w*/).test(window.location.pathname)) {
    type = "bookings";
  } else if ((/[/]profile\w*/).test(window.location.pathname)) {
    type = "profile";
  } else if ((/[/]/).test(window.location.pathname)) {
    type = "root";
  }



  switch (type) {
    case "root":
      $("#navbar-root-link").addClass("active");
      break;
    case "movies":
      $("#navbar-movies-link").addClass("active");
      break;
    case "bookings":
      $("#navbar-dashboard-link").addClass("active");
      break;
    case "profile":
      $("#navbar-profile-link").addClass("active");
      break;
    default:
  }


});

$(window).resize(function(){
  curWidth = $( window ).width();
  curHeight = $( window ).height();

  $("#navbar-container").height((curHeight*ratio)+"px");
  console.log(curWidth*ratio);
});
