
var dashboardApp = angular.module('dashboardApp', ['ngCookies']);

dashboardApp.controller('DashboardController', function DashboardController($scope, $http, $window, $cookies) {

$scope.total_incidents;
$scope.non_confirmed;
$scope.confirmed;

var incidentLayer;
var incidentSource;
var filter_options = {};
var map;

$scope.init = function init()
{
alert('hi');
 map = new ol.Map({
layers: [
  new ol.layer.Tile({
    source: new ol.source.OSM()
  })
],
target: 'map',
view: new ol.View({
  center: ol.proj.transform([80.704870,7.999818], 'EPSG:4326', 'EPSG:3857'),
  zoom: 7
})
});
}

$http(
{method: 'POST',
url: '/dashboard/get_summary/',
dataType: "json",
contentType: "application/json; charset=utf-8",
headers: {
              'X-CSRFToken': $cookies['csrftoken']
},
data:{}
}
).success(function(data) {
   console.log(data);
   $scope.total_incidents = data['total_incidents'];
   $scope.non_confirmed = data['non_confirmed_count'];
   $scope.confirmed = data['confirmed_inc_count'];

});

function load_incident_layer(){

}

})

dashboardApp.run( function run( $http, $cookies){

    //For CSRF token compatibility with Django
    $http.defaults.headers.post['X-CSRFToken'] = $cookies.get('csrftoken');

})

dashboardApp.config(function() {
  var $cookies;
  angular.injector(['ngCookies']).invoke(['$cookies', function(_$cookies_) {
    $cookies = _$cookies_;
  }]);

});
