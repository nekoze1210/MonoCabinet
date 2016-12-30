$(document).on('page:load', function(){
  $('#myButton').on('click', function () {
    var $btn = $(this).button('loading')
        var options = {
            enableHighAccuracy: true ,
            timeout: 100000,
            maximumAge: 0
        };
        window.navigator.geolocation.getCurrentPosition(success, error, options);
      function success(pos) {
          document.getElementById('item_locations_attributes_0_latitude').value = pos.coords.latitude;
          document.getElementById('item_locations_attributes_0_longitude').value = pos.coords.longitude;
          $("#new_item").submit();
      }
      function error(err) {
        alert("位置情報が取得できませんでした。\n ページを更新するか、端末を変えてください。")
      }
  });

  $('#updateButton').on('click', function () {
    var $btn = $(this).button('loading')
        var options = {
            enableHighAccuracy: true ,
            timeout: 1000000,
            maximumAge: 0
        };
        window.navigator.geolocation.getCurrentPosition(success, error, options);
      function success(pos) {
          $('#location_latitude').val(pos.coords.latitude);
          $('#location_longitude').val(pos.coords.longitude);
          $("#new_location").submit();
      }
      function error(err) {
        alert("位置情報が取得できませんでした。\n ページを更新するか、端末を変えてください。")
      }
  });
})
