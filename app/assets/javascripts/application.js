//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .
//= require turbolinks
//= require jquery_ujs
//= require moment
//= require moment/ja.js
//= require tempusdominus-bootstrap-4.js

document.addEventListener("turbolinks:load",function () { 
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('.img_field').change("turbolinks:load",function () {
    readURL(this);
  });
});