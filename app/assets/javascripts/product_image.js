var fileIndex = [1,2,3,4,5,6,7,8,9,10];
$(function(){
  $('#image-box__container').change(function(e) {
      var num = fileIndex.shift();
      $(`.js_file${num}`).removeAttr("id");
      $(`.js_file${num + 1}`).attr("id", "image_label");
      
      if (num == 1) {
        $('#exhibition_image6').css("display","block");
        $('#exhibition_wrap_container').css("width","491px");
      } else if (num == 2) {
        $('#exhibition_image7').css("display","block");
        $('#exhibition_wrap_container').css("width","363px");
      } else if (num == 3) {
        $('#exhibition_image8').css("display","block");
        $('#exhibition_wrap_container').css("width","234px");
      } else if(num == 4) {
        $('#exhibition_image9').css("display","block");
        $('#exhibition_wrap_container').css("width","106px");
      } else if (num == 5) {
        $('#exhibition_image10').css({display: "block", margin: "16px 0 0"});
        $('#exhibition_image_box').removeAttr("id");
        $('#exhibition_wrap_container').css({width: "620px", height: "162px"});
        $('#contents_image_container').css("height","475px")
      } else if (num == 6) {
        $('#wrap_box_after').css({display: "block", display: "flex"});
        $('#exhibition_image1').css("display","block");
        $('#exhibition_wrap_container').css("width","491px");
      } else if (num == 7) {
        $('#exhibition_image2').css("display","block");
        $('#exhibition_wrap_container').css("width","363px");
      } else if (num == 8) {
        $('#exhibition_image3').css("display","block");
        $('#exhibition_wrap_container').css("width","234px");
      } else if (num == 9) {
        $('#exhibition_image4').css("display","block");
        $('#exhibition_wrap_container').css("width","106px");
      } else if (num == 10) {
        $('#exhibition_image5').css("display","block");
        $('#exhibition_wrap_container').css("display","none");
      }

      var reader = new FileReader();
      reader.onload = function (e) {
          $(`#preview${num}`).attr('src', e.target.result);
          $(`#preview${num}`).removeAttr('id');
      }
      reader.readAsDataURL(e.target.files[0]);
  });
});