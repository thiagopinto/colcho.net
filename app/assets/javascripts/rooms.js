$(function(){
  var $review = $('.review');

  $review.on('ajax:beforeSend', function(){
    $(this).find('input').attr('disabled', true);
  });
  $review.on('ajax:erro', function() {
    replaceButton(this, 'fs-check', '#B94A48');
  });
  $review.on('ajax:success', function() {
    replaceButton(this, 'fs-times', '#468847');
  });
  function replaceButton(conteiner, icon_class, color){
    $(conteiner).find('input:submit').
    replaceWith($('<i/>').addClass(icon_class).css('color', color));
  };
});
