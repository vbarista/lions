$(function() {
  // 委員会選択制御（radio）
  var fn_radio = function() {
    $('.radio_label').removeClass('btn-success').removeClass('active');
    $(':radio:checked').parent('.radio_label').addClass('btn-success').removeClass('active');
  };
  $('.radio_label').on('click', function(){
    var $radio = $(this).children(':radio');
    $radio.prop('checked', true);
    fn_radio();
  });
  fn_radio();
  
  // 所属メンバー選択制御（checkbox）
  var fn_checkbox = function() {
    var $label = $(this);
    var $checkbox = $label.children(':checkbox');
    
    if ($checkbox.prop('checked') === true)  {
      $label.addClass('btn-success').removeClass('active');
    } else {
      $label.removeClass('btn-success').removeClass('active');
    }
  };

  $('.checkbox_label').on('click', function(){
    var $label = $(this);
    var $checkbox = $label.children(':checkbox');
    $checkbox.prop('checked', !$checkbox.prop('checked'));
    if ($checkbox.prop('checked') === true)  {
      $label.addClass('btn-success').removeClass('active');
    } else {
      $label.removeClass('btn-success').removeClass('active');
    }
  });
  $('.checkbox_label').each(fn_checkbox);
});