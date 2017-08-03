$( function() {
  var fn = function() {
    var checkbox = $(this);
    var label = checkbox.parent('label');
    if (checkbox.prop('checked') === true)  {
        label.addClass('btn-primary').addClass('active');
    } else {
        label.removeClass('btn-primary').removeClass('active');
    }
  };
  $('.btn-group').on('change', 'input:checkbox', fn);
  $('.btn-group :checkbox').each(fn);
} );