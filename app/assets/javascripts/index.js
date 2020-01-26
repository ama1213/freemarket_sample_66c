$(function(){
  $('.news').slick({
    autoplay:true,
    autoplaySpeed:3000,
    dots:true,
    dotsClass:'slide-dots',
    pauseOnHover:false,
    appendArrows: $('.news'),
    prevArrow: '<div class="slider-arrow slider-prev fa fa-angle-left"></div>',
    nextArrow: '<div class="slider-arrow slider-next fa fa-angle-right"></div>',
  });
});