const initCarousels = () => {
  console.log('running carousel')
  $('#film-carousel').slick({
  infinite: true,
  dots: true,
  slidesToShow: 1,
  slidesToScroll: 1,
  draggable: true,
  centerMode: true,
});

  $('#cinema-carousel').slick({
  infinite: true,
  dots: true,
  slidesToShow: 1,
  slidesToScroll: 1,
  draggable: true,
  centerMode: true,
});
}

export { initCarousels };
