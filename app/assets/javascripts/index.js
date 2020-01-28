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
  $('.search__right__content__box__area__image').each(function(){
    var img_height = $(this).height();
    var img_width  = $(this).width();
    if((img_width / img_height) >= 1){
      $(this).css("height", "100%");
    }else{
      $(this).css("width", "100%");
    }
  });
});