$(window).on('load', function(){
  $('#submit').on('click', function () {
    var $btn = $(this).button('loading')
        var options = {
            enableHighAccuracy: true ,
            timeout: 10000,
            maximumAge: 0
        };
    window.navigator.geolocation.getCurrentPosition(success, error, options);
      function success(pos) {
          $('#location_latitude').val(pos.coords.latitude);
          $('#location_longitude').val(pos.coords.longitude);
          $(this).submit();
      }
      function error(err) {
        alert("位置情報が取得できませんでした。\n ページを更新するか、位置情報を確認できる端末をお使いください。");
      }
  });
});
