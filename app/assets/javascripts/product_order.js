$(function(){
  $('.buy__main__item__area__image').each(function(){
    var img_height = $(this).height();
    var img_width  = $(this).width();
    if((img_width / img_height) >= 1){
      $(this).css("width", "100%");
    }else{
      $(this).css("height", "100%");
    }
  });
});