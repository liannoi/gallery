'use strict';

$('#photo').on('change', function() {
  $(this).next('.custom-file-label').html('Ready');
});
