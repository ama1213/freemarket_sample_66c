$(function(){
  var time = new Date();
  var year = time.getFullYear();
  for (var i = year; i >= 1900; i--) {
      $('#user_birthday_year').append('<option value="' + i + '">' + i + '</option>');
  }
  for (var i = 1; i <= 12; i++) {
      $('#user_birthday_month').append('<option value="' + i + '">' + i + '</option>');
  }
  for (var i = 1; i <= 31; i++) {
      $('#user_birthday_day').append('<option value="' + i + '">' + i + '</option>');
  }
  $('#passcheck').change(function(){
    if ( $(this).prop('checked') ) {
        $('#password').attr('type','text');
    } else {
        $('#password').attr('type','password');
    }
  });

  $(".new_user__form__box__input").focus(function(){
    $(this).css("border-color","#0099E8");
    $(this).next().remove();
  }).blur(function(){
    if($(this).val() == ""){
      $(this).addClass("error");
      $(this).css("border-color","#ea352d");
      var name = $(this).attr("data-name");
      $(this).after('<div class="error-text">' + name + 'を入力してください</div>');
    }else{
      $(this).removeClass("error");
      $(this).css("border-color","#ccc");
      $(this).next().remove();
    }
  });

  $(".new_user__form__box__name__input").focus(function(){
    var nameBox = $(this).parent().parent();
    $(this).css("border-color","#0099E8");
    nameBox.next().remove();
  }).blur(function(){
    var nameBox = $(this).parent().parent();
    if($(this).val() == ""){
      $(this).css("border-color","#ea352d");
      var name = $(this).attr("data-name");
      nameBox.after('<div class="error-text">' + name + 'を入力してください</div>');
    }else{
      $(this).css("border-color","#ccc");
      nameBox.next().remove();
    }
  });

  $(".new_user__form__box__content__select__body").focus(function(){
    $(this).css("border-color","#0099E8");
  }).blur(function(){
    var nameBox = $(this).parent().parent();
    if($(this).val() == ""){
      $(this).css("border-color","#ea352d");
      var name = $(this).attr("data-name");
      nameBox.after('<div class="error-text">' + name + 'を入力してください</div>');
    }else{
      $(this).css("border-color","#ccc");
      nameBox.next().remove();
    }
  });

  var form = $("#pay_form");
  Payjp.setPublicKey(ENV["PAYJP_PUBLIC_KEY"]);
  $("#pay_submit").on("click",function(e){
    e.preventDefault();
    var card = {
      number: $("#pay_number").val(),
      cvc: $("#pay_security").val(),
      exp_month: $("#pay_month").val(),
      exp_year: $("#pay_year").val()
    };
    Payjp.createToken(card, function(status, response){
      form.find("input[type=submit]").prop("disabled", true);
      console.log(status);
      if(status == 200){
        $("#pay_number").removeAttr("name");
        $("#pay_cvc").removeAttr("name");
        $("#pay_month").removeAttr("name");
        $("#pay_year").removeAttr("name");
        var payjphtml = `<input type="hidden" name="payjpToken" value=${response.id}>`
        form.append(payjphtml);
        $('#pay_form').attr('name', 'inputForm');
        document.inputForm.submit();
      }else{
        $("#pay_submit").prop("disabled", false);
        alert("カード情報が正しくありません。");
      }
    });
  });
});