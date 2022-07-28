$(document).on('change','#product_image', function(e){
  let file = e.target.files[0];
  if (file) {
    $('#blah').attr('src',  URL.createObjectURL(file));
    $('#blah').removeClass('d-none');
  }
})
