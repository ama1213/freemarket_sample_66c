$(function(){
  $('#shipping_categorie').change(function() {
    if ($('#shipping_categorie').val() == "レディース"){
      $('#append_container_child_1').css('display', 'block');
      $('.exhibition__contents__detail').css('height', '317px');
      $('.exhibition__contents__detail__box__categorie').css('height', '126px');
  } else if ($('#shipping_categorie').val() == "---"){
      $('#append_container_child_1').css('display', 'none');
      $('#shipping_categorie_child_1').val('---');
      $('#append_container_grandchild_1').css('display', 'none');
      $('#shipping_categorie_grandchild_1').val('---');
      $('#append_container_size').css('display', 'none');
      $('#shipping_categorie_grandchild_1__size').val('---');
      $('#append_container_brand').css('display', 'none');
      $('.exhibition__contents__detail').css('height', '261px');
      $('.exhibition__contents__detail__box__categorie').css('height', '70px');
    }
  });

  $('#shipping_categorie_child_1').change(function() {
    if ($('#shipping_categorie_child_1').val() == "トップス"){
      $('#append_container_grandchild_1').css('display', 'block');
      $('.exhibition__contents__detail').css('height', '373px');
      $('.exhibition__contents__detail__box__categorie').css('height', '182px');
  } else if ($('#shipping_categorie_child_1').val() == "---"){
      $('#append_container_grandchild_1').css('display', 'none');
      $('#shipping_categorie_grandchild_1').val('---');
      $('#append_container_size').css('display', 'none');
      $('#shipping_categorie_grandchild_1__size').val('---');
      $('#append_container_brand').css('display', 'none');
      $('.exhibition__contents__detail').css('height', '317px');
      $('.exhibition__contents__detail__box__categorie').css('height', '126px');
    }
  });

    $('#shipping_categorie_grandchild_1').change(function() {
    if ($('#shipping_categorie_grandchild_1').val() == "Tシャツ/カットソー(半袖/袖なし)"){
      $('#append_container_size').css('display', 'block');
      $('#append_container_brand').css('display', 'block');
      $('.exhibition__contents__detail').css('height', '593px');
      $('.exhibition__contents__detail__box__categorie').css('height', '182px');
  } else if ($('#shipping_categorie_grandchild_1').val() == "---"){
      $('#append_container_size').css('display', 'none');
      $('#shipping_categorie_grandchild_1__size').val('---');
      $('#append_container_brand').css('display', 'none');
      $('.exhibition__contents__detail').css('height', '373px');
      $('.exhibition__contents__detail__box__categorie').css('height', '182px');
    }
  });
  
  $('#shipping_charges').change(function() {
    if ($('#shipping_charges').val() == "送料込み(出品者負担)"){
      $('#shipping_method_1').css('display', 'block');
      $('#shipping_method_2').css('display', 'none');
      $('.exhibition__contents__shipping').css('height', '481px');
  } else if ($('#shipping_charges').val() == "着払い(購入者負担)"){
      $('#shipping_method_2').css('display', 'block');
      $('#shipping_method_1').css('display', 'none');
      $('.exhibition__contents__shipping').css('height', '481px');
  } else if ($('#shipping_charges').val() == "---"){
      $('#shipping_method_1').css('display', 'none');
      $('#shipping_method_2').css('display', 'none');
      $('.exhibition__contents__shipping').css('height', '371px');
    }
  });

  $('#input_price').keyup(function(){
    if ($('#input_price').val() >= 300 && $('#input_price').val() <= 9999999){
      var input_price = $('#input_price').val();
      var tax = Math.floor(input_price / 10);
      var price = input_price - tax;
      $('#price_tax').text(`¥${tax}`);
      $('#final_price').text(`¥ ${price}`);
  } else {
      $('#price_tax').text("–");
      $('#final_price').text("—");
    }
  });
});