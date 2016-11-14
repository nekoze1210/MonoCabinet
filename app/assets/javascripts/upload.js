$(window).on('load', function () {
  $('.fileInput').change(function(){
    if (!this.files.length) {
      return;
    }
    var file = this.files[0]
    fr = new FileReader();
    fr.readAsDataURL(file);
    fr.onload = function(){
     $('.preview').append('<img src= '+ event.target.result +'>');
    };
  });
});
