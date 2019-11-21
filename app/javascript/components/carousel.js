const initCarousel = () => {
  console.log('running carousel')
  $('#carousel').slick({
  infinite: true,
  dots: true,
  slidesToShow: 1,
  slidesToScroll: 1,
  draggable: true,
  centerMode: true,
});
}

export { initCarousel };
