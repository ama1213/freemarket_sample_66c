$(function(){
  $('.item__content__photo__main__box__image').each(function(){
    var img_height = $(this).height();
    var img_width  = $(this).width();
    if((img_width / img_height) >= 1){
      $(this).css("width", "100%");
    }else{
      $(this).css("height", "100%");
    }
  });
  $('.item__content__photo__sub__box__image').each(function(){
    var img_height = $(this).height();
    var img_width  = $(this).width();
    if((img_width / img_height) >= 1){
      $(this).css("height", "100%");
    }else{
      $(this).css("width", "100%");
    }
  });
  $('.comment__content__list__box__user__icon__image').each(function(){
    var img_height = $(this).height();
    var img_width  = $(this).width();
    if((img_width / img_height) >= 1){
      $(this).css("height", "100%");
    }else{
      $(this).css("width", "100%");
    }
  });
  $('.other__profile__group__box__top__image').each(function(){
    var img_height = $(this).height();
    var img_width  = $(this).width();
    if((img_width / img_height) >= 1){
      $(this).css("height", "100%");
    }else{
      $(this).css("width", "100%");
    }
  });
  $('.item__content__photo__sub__box').click(
    function(){
    $('.item__content__photo__sub__box').removeClass('active');
    $(this).addClass('active');
  });
  $('.item__bottom__left__like').click(function(){
    if($(this).hasClass('liked')){
      $(this).removeClass('liked');
      $('.like').removeClass('icon-liked');
      $('.like').addClass('far');
      $('.like').removeClass('fas');
      $('.like').removeClass('animated');
      $('.like').removeClass('rubberBand');
      $('.like-num').addClass('fadeInUp');
      $('.like-num').removeClass('fadeInDown');
    }else{
      $(this).addClass('liked');
      $('.like').addClass('icon-liked');
      $('.like').addClass('fas');
      $('.like').addClass('animated');
      $('.like').addClass('rubberBand');
      $('.like').removeClass('far');
      $('.like-num').addClass('animated');
      $('.like-num').removeClass('fadeInUp');
      $('.like-num').addClass('fadeInDown');
    }
  });
  var slider = ".item__content__photo__main";
  var thumbnailItem = ".item__content__photo__sub__box";
  $(thumbnailItem).each(function(){
    var index = $(thumbnailItem).index(this);
    $(this).attr("data-index",index);
   });
   $(slider).on('init',function(slick){
    var index = $(".slide-item.slick-slide.slick-current").attr("data-slick-index");
    $(thumbnailItem+'[data-index="'+index+'"]').addClass("thumbnail-current");
   });
   $(slider).slick({
    arrows: false,
    speed: 1500,
    waitForAnimate: false,
    infinite: false //これはつけましょう。
  });
  $(thumbnailItem).on('click',function(){
    var index = $(this).attr("data-index");
    $(slider).slick("slickGoTo",index,false);
  });
  $(slider).on('beforeChange',function(event,slick, currentSlide,nextSlide){
    $(thumbnailItem).each(function(){
      $(this).removeClass("thumbnail-current");
    });
    $(thumbnailItem+'[data-index="'+nextSlide+'"]').addClass("thumbnail-current");
  });
  
  // $('.item__bottom__left__like').click(function(){
  //   $(".fas.fa-heart.like").jrumble({ x:8, y:8, rotation:9 })
  //     $(".fas.fa-heart.like").trigger('startRumble');
  //     $(".far.fa-heart.like").trigger('stopRumble');
	// 	});
});