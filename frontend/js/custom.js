$(document).ready(function () {
  // create sidebar and attach to menu open
  $('.ui.sidebar')
    .sidebar('attach events', '.toc.item');
    
  $('.ui.accordion').accordion();

  var imgInput = function(input) {
    if (input.files && input.files[0]) {
      var img = new FileReader();
      img.onload = function (e) {
        $('#avatar').attr('src', e.target.result);
      }
      img.readAsDataURL(input.files[0]);
    }
  }

  $(".imgUpload").on('change', function(){
    imgInput(this);
  });

  $(".upload-button").on('click', function() {
    $(".imgUpload").click();
  });
});