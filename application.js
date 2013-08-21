(function() {
  $(function() {
    return $('.joosy_usage_module img').show().on('mouseenter', function() {
      return $(this).removeClass('desaturate');
    }).on('mouseleave', function() {
      return $(this).addClass('desaturate');
    });
  });

}).call(this);
