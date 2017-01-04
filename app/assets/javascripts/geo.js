$(function(){
  $('#new_item').submit(function(e) {
    $btn = $('#new_item_submit').button('loading');
    var options = {
        enableHighAccuracy: false,
        timeout: 8000,
        maximumAge: 0
    };
    navigator.geolocation.getCurrentPosition(success, error, options)
    function success(position) {
      $('#item_locations_attributes_0_latitude').val(position.coords.latitude);
      $('#item_locations_attributes_0_longitude').val(position.coords.longitude);
      setTimeout(function() {
           $('#new_item').off('submit');
           $('#new_item').submit();
       }, 300 );
    }
    function error() {
      alert("位置情報が取得できませんでした。\n お使いの端末が位置情報サービスに対応していない可能性があります。\n ページを更新するか、端末を変えてください。");
    }
    e.preventDefault();
  });

  $('#new_location').submit(function(e) {
    $btn = $('#updateButton').button('loading');
    var options = {
        enableHighAccuracy: false,
        timeout: 8000,
        maximumAge: 0
    };
    navigator.geolocation.getCurrentPosition(success, error, options)
    function success(position) {
      $('#location_latitude').val(position.coords.latitude);
      $('#location_longitude').val(position.coords.longitude);
      setTimeout(function() {
           $('#new_location').off('submit');
           $('#new_location').submit();
       }, 300 );
    }
    function error() {
      alert("位置情報が取得できませんでした。\n お使いの端末が位置情報サービスに対応していない可能性があります。\n ページを更新するか、端末を変えてください。");
    }
    e.preventDefault();
  });
});
