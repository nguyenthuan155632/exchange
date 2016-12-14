$("#reservation_amout").focusout(function(){
  $.ajax({
    url: "/btc_value",
    data: { jpy_value: $(this).val()},
    success: function(data) {
      $(".btc_value").text("¥ " + data);
    }
  })
});
$(".jpy_btc").focusout(function(){
  $.ajax({
    url: "/jpy_value",
    data: { btc_value: $(this).val()},
    success: function(data) {
      $(".jpy_value").text(data + " BTC");
    }
  })
});