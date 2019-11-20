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
