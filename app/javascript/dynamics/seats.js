$(document).ready(function(){

});

$("#book-seats-button").click(function(){
  //resets seats
  $(".seat-selecatble").each(function( i ){
    $(this).removeClass("selected");
  });
});

$(".seat-selectable").click(function(){
  $(this).toggleClass("selected");
})

$.ajax({
  url : "/movies/1/sessions/1/boogings",
  type : "post",
  data : { datters: "HIIYA" }
});

