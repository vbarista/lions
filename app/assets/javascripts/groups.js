$( function() {
  var fn = function() {
    var checkbox = $(this);
    var label = checkbox.parent('label');
    if (checkbox.prop('checked') === true)  {
        label.addClass('btn-warning').addClass('active');
    } else {
        label.removeClass('btn-warning').removeClass('active');
    }
  };
  $('.btn-group').on('change', 'input:checkbox', fn);
  $('.btn-group :checkbox').each(fn);
} );