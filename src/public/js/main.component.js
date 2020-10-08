'use strict';

(function() {
  document.querySelectorAll('.card').
      forEach(card => {
        card.addEventListener('click', function() {
          window.location.replace(`image-details@${this.dataset.id}`);
        });
      });
}());
