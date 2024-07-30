// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// Import jQuery and FancyBox
import $ from 'jquery';
import '@fancyapps/fancybox/dist/jquery.fancybox.min.css';
import '@fancyapps/fancybox';

// Initialize FancyBox on document ready
document.addEventListener('DOMContentLoaded', () => {
  $('[data-fancybox="gallery"]').fancybox({
    buttons: ['zoom', 'close']
  });
});
