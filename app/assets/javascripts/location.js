// Geolocation APIに対応している
if( navigator.geolocation )
{
  // 現在位置を取得できる場合の処理
  alert( "あなたの端末では、現在位置を取得することができます。" ) ;
}

// Geolocation APIに対応していない
else
{
  // 現在位置を取得できない場合の処理
  alert( "あなたの端末では、現在位置を取得できません。" ) ;
}

navigator.geolocation.getCurrentPosition(successFunc, errorFunc, optionObj);

function successFunc(position)
{
  //緯度、軽度のアラート表示
  alert(position.coords.latitude);
  alert(position.coords.longitude);


  document.getElementById( 'result' ).innerHTML = '<dl><dt>緯度</dt><dd>' + lat + '</dd><dt>経度</dt><dd>' + lng + '</dd><dt>高度</dt><dd>' + alt + '</dd><dt>緯度、経度の精度</dt><dd>' + accLatlng + '</dd><dt>高度の精度</dt><dd>' + accAlt + '</dd><dt>方角</dt><dd>' + heading + '</dd><dt>速度</dt><dd>' + speed + '</dd></dl>' ;


}

function errorFunc(error)
{
    var errorMessage = {
    0: "原因不明のエラーが発生しました…。" ,
    1: "位置情報の取得が許可されませんでした…。" ,
    2: "電波状況などで位置情報が取得できませんでした…。" ,
    3: "位置情報の取得に時間がかかり過ぎてタイムアウトしました…。" ,
  };
  alert( errorMessage[error.code] ) ;
}

var optionObj = {
  "enableHighAccuracy": false ,
  "timeout": 8000 ,
  "maximumAge": 5000 ,
} ;










