document.addEventListener("turbolinks:load", function() {
  $(function(){
    $('.ui.sidebar')
    .sidebar('attach events', '.toc.item');

    $("#sign-in, .sign-in").click(function(){
      $(".ui.modal").modal('show');
    });
    
    $(".ui.modal").modal({
      closable: true
    });

    $('.list-images').slick({
      dots: true,
      infinite: true,
      arrow: true
    });

    $('.message .close')
      .on('click', function() {
        $(this)
          .closest('.message')
          .transition('fade')
        ;
      })
    ;

    $(".mygallery").lightGallery({
      fullScreen: true,
      selector: 'a'
    });
  });
});