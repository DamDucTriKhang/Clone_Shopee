$(document).on('change','#product_image', function(e){
  let file = e.target.files[0];
  if (file) {
    $('#blah').attr('src',  URL.createObjectURL(file));
    $('#blah').removeClass('d-none');
  }
})
function cal_price(){
  let price = 0  ;
  $('.checkbox:checked').each(function(){
    price = price + parseInt($(this).val());
  })
  $('#valueList').text(price)
}

function count_product(){
  let selectedProduct = $('.checkbox:checked').length;
  $('#product-count').text(selectedProduct)
}

$(document).on('change', '.checkbox', function(){
  cal_price();
})

$(document).on('change', '.checkbox', function(){
  count_product();
})
