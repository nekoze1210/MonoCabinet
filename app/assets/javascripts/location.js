document.addEventListener("DOMContentLoaded", function() {
    var options = {
        enableHighAccuracy: true,
        timeout: 60000,
        maximumAge: 0
    };
    window.navigator.geolocation.getCurrentPosition(success, error, options);
}, false);

function success(pos) {
    document.getElementById('item_latitude').value = pos.coords.latitude;
    document.getElementById('item_longitude').value = pos.coords.longitude;
}

function error(err) {
    console.warn('ERROR(' + err.code + '): ' + err.message);
}