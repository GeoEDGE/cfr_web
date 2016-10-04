
var incidentApp = angular.module('incidentApp', ['ngCookies']);

incidentApp.controller('IncidentController', function IncidentController($scope, $cookies, $http, $window) {

$scope.selectedDisaster = "-1";
$scope.name;
$scope.description;
$scope.contact;
$scope.images = [];
$scope.questions;
var map;
var markerLayer;
var iconGeometry;
var iconFeature;
var iconStyle;
var markerSource;
var geolocation;
var latitude;
var longitude;

$scope.init = function init()
{

  var proj = new ol.proj.Projection({
        code: 'EPSG:4326'
  });

  map = new ol.Map({
    layers: [
      new ol.layer.Tile({
        source: new ol.source.OSM()
      })
    ],
    target: 'map',
    view: new ol.View({
       center: ol.proj.transform([80.704870,7.999818], 'EPSG:4326', 'EPSG:3857'),
       zoom: 7,
       //maxZoom: 15,
       //projection: proj
    })
  });

  map.on("singleclick", function(evt){

     var location = ol.proj.transform([evt.coordinate[0], evt.coordinate[1]], 'EPSG:3857', 'EPSG:4326')
     latitude = location[1]
     longitude = location[0]
     console.log(latitude, ' ', longitude);
     if(iconGeometry)
     iconGeometry.setCoordinates(evt.coordinate);
     else{
      setMarker(evt.coordinate[0], evt.coordinate[1]);
      iconGeometry.setCoordinates(evt.coordinate);
     }
     //alert(latitude +' '+ longitude);
  })

  geolocation = new ol.Geolocation({
  tracking: true
  });

 }

 $scope.getUserLocation = function getUserLocation()
 {
    gpsLocation();

 }

function gpsLocation()
{
  $.ajax({
    url: '//freegeoip.net/json/',
    type: 'POST',
    dataType: 'jsonp',
    success: function (location) {
       
        latitude = location.latitude;
        longitude = location.longitude;
        if(!markerLayer){
        setMarker(latitude, longitude);
        }
        else
        iconGeometry.setCoordinates(ol.proj.transform([latitude, longitude], 'EPSG:4326', 'EPSG:3857'));

    }
});

}

function setMarker(latitude, longitude)
{
console.log(latitude, longitude);
iconGeometry = new ol.geom.Point(ol.proj.transform([longitude, latitude], 'EPSG:4326', 'EPSG:3857'));
iconFeature = new ol.Feature({
  geometry: iconGeometry,
  name: 'Null Island',
  population: 4000,
  rainfall: 500
});
//[0.1, 20]
iconStyle = new ol.style.Style({
  image: new ol.style.Icon(({
    anchor: [0.26, 30],
    anchorXUnits: 'fraction',
    anchorYUnits: 'pixels',
    opacity: 0.75,
    src: "/static/incidents/img/marker.png"
  }))
});

iconFeature.setStyle(iconStyle);

markerSource = new ol.source.Vector({
  features: [iconFeature]
});

if(!markerLayer){
markerLayer = new ol.layer.Vector({
  source: markerSource
});
map.addLayer(markerLayer);
}

map_zoom_to_marker();
}

function map_zoom_to_marker()
{
map.getView().setZoom(15);
map.getView().setCenter(ol.proj.transform([longitude, latitude], 'EPSG:4326', 'EPSG:3857'));
}

$scope.incident_submit = function incident_submit()
{
console.log('save ', JSON.stringify($scope.formData));
$scope.disaster_er_msg = "";
$scope.location_er_msg = "";
$scope.contact_er_msg = "";

is_number_valid = phonenumber($scope.contact);

if($scope.selectedDisaster == "-1")
 $scope.disaster_er_msg = "Please select the Disaster Type";
if(!latitude)
 $scope.location_er_msg = "Please select your location";
if(!is_number_valid)
  $scope.contact_er_msg = "Please select a valid phone number";
else if($scope.selectedDisaster != "-1" && latitude && is_number_valid){
 $scope.disaster_er_msg = "";
 $scope.location_er_msg = "";
 $scope.contact_er_msg = "";
$http({
    method: 'POST',
    url: 'http://maps.googleapis.com/maps/api/geocode/json',
    params: {latlng: ''+latitude+', '+longitude+'',
             sensor: true},
    headers: {'X-CSRFToken': $cookies['csrftoken']},
    }).success(function(data, status, headers, config) {

    console.log(data);
    get_admin_area(data);
    address = data.results[0].formatted_address;
    save_data(address);

 })
 }
}

function phonenumber(number)
{
  var is_valid;
  if(number){
  var number = number.replace(/[^0-9]/g, '');
  if(number.length != 10)
      is_valid = false;
  else
      is_valid = true;
  }
  else
     is_valid = true;

  return is_valid;
}

function save_data(address)
{
console.log('save ', latitude, ' ', longitude);
$http(
    {method: 'POST',
    url: '/incidents/incident_save/',
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    headers: {'X-CSRFToken': $cookies['csrftoken']},
    data:JSON.stringify({'name':$scope.name, 'contact': $scope.contact, 'description': $scope.description,
    'disaster_type': $scope.selectedDisaster, 'files': $scope.images, 'latitude': latitude,
     'longitude': longitude, 'district': $scope.getDistrict, 'province': $scope.getProvince,
     'address': address, 'close_end_qs': $scope.formData
    })
    }
    ).success(function(data) {
       console.log('result ', data);
     $('#modal-container-571347').modal("show");
       //form_reset();
    });
console.log('data ', $scope.formData);
}

$scope.page_reload = function(){
   $window.location.href = '/incidents/incident_form/en';

}

function form_reset()
{
  $scope.formData = {};
  $scope.name = "";
  $scope.contact = "";
  $scope.description = "";
  $scope.getDistrict = "";
  $scope.selectedDisaster = "-1";
  $scope.getProvince = "";
  $scope.images = [];

}

function get_admin_area(data)
{
var i, f;
var splitresult = [];
var checkresult = [];
for (i = 0; i <= data.results[0].address_components.length - 1; i++) {

    for (f = 0; f <= data.results[0].address_components[i].types.length - 1; f++) {
        if (angular.equals(data.results[0].address_components[i].types[f], "administrative_area_level_2")) {
            $scope.resultDistrict = JSON.stringify(data.results[0].address_components[i].long_name);
            var removequotes = $scope.resultDistrict.split('"').join('');
            $scope.getDistrict = removequotes;
            checkresult.push($scope.getDistrict);
        }
        if (angular.equals(data.results[0].address_components[i].types[f], "administrative_area_level_1")) {
            $scope.resultDistrict = JSON.stringify(data.results[0].address_components[i].long_name);
            var removespace = $scope.resultDistrict.split(' ').join('');
            var removequotes = removespace.split('"').join('');
            splitresult = removequotes.split("Province");
            $scope.getProvince = splitresult[0];

        }
    }
  }

  console.log($scope.getDistrict, $scope.getProvince);

}

$scope.imageUpload = function(event){
     var files = event.target.files;

     for (var i = 0; i < files.length; i++) {
         var file = files[i];

             var reader = new FileReader();
             reader.onload = $scope.imageIsLoaded;
             reader.readAsDataURL(file);
     }
}

$scope.imageIsLoaded = function(e){
    $scope.$apply(function() {
        $scope.images.push(e.target.result);
    });
}

$scope.select_questions = function select_questions()
{
    $http(
    {method: 'POST',
    url: '/incidents/select_questions/',
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    headers: {'X-CSRFToken': $cookies['csrftoken']},
    data:JSON.stringify({'disaster': $scope.selectedDisaster
    })
    }
    ).success(function(data) {
       console.log('updated data ', data);
       $scope.questions = data;
       $scope.formData = {};
       $scope.formTemplate = data;

    });
}

$scope.formTemplate = [];

function get_form_values()
{
  angular.forEach($scope.formData, function(value, key) {
     //alert($scope.va);
  })
}

$scope.$watch('formData', function(){

console.log('watch ', $scope.formData);
})


$scope.formData = {};

})

incidentApp.directive('rnStepper', ['$document', '$compile' ,function($document, $compile) {

    return {
        restrict: 'AE',
         scope: {
         formTemplate: '=template',
         formData: '=ngModel'
        },

        link: function ($scope, element, attrs, ngCtrl) {
              $scope.$watch('formTemplate', function(){
              var form_content = angular.element( document.querySelector( 'rn-stepper' ) );


              var bracket = function (model, base) {
              props = model.split('.');
              return (base || props.shift()) + (props.length ? "['" + props.join("']['") + "']" : '');
              }
              //clean previous form data
              form_content.empty();

              angular.forEach($scope.formTemplate, function(value, key) {
                        var newDirective;
                        if(value.type == 'text'){
                        newDirective = angular.element(
                        "<div class='form-group' >"
                        +'<label for="textArea" class="col-lg-2 control-label">'+value.label+'</label>'
                        +'<div class="col-lg-10">'
                        +'<input class="form-control" ng-model="'+value.model+'" type="text" />'
                        +'</div>'
                        +'</div>'
                        );
                        newDirective.find('input').attr('ng-model', bracket(value.model, attrs.ngModel));

                        }
                        else if(value.type == 'select'){

                        element_string = "<div class='form-group' >"
                        +'<label for="textArea" class="col-lg-2 control-label">'+value.label+'</label>'
                        +'<div class="col-lg-10">'
                        +'<select class="form-control" >'
                        +'<option value="">-- Please select --';
                        console.log('select ', value);
                        angular.forEach(value.options, function (option) {
                         element_string += '<option value="'+option.value+'">'+option.label+'';
                        });

                        newDirective = angular.element(element_string);
                        newDirective.find('select').attr('ng-model', bracket(value.model, attrs.ngModel));
			            element.append(newDirective);
                        $compile(newDirective)($scope);
                        }

                        else if(value.type == 'multiple_choices'){
                          var element_string = "<div class='form-group' >"
                          +'<label class="col-lg-2 control-label">'+value.label+'</label>'
                          +'<div id="multiple_choices" class="col-lg-10 ">';
                        var newDirective_form_el = angular.element(element_string);
                        element.append(newDirective_form_el);

                        var el_content = angular.element(document.querySelectorAll('#multiple_choices'));

                        angular.forEach(value.options, function (option) {
                        element_string =
                        "<label class='col-md-6 checkbox-inline'><input type='checkbox' aria-label='' value="+option.value+">"+option.label+"";
                        newDirective = angular.element(element_string);
                        newDirective.find('input').attr('ng-model', bracket(value.model+ "." + option.value, attrs.ngModel));
                        el_content.append(newDirective);

                        $compile(newDirective)($scope);
                        })

                        }

                        else if(value.type == 'boolean'){
                          var element_string = "<div class='form-group' >"
                          +'<label for="textArea" class="col-lg-2 control-label">'+value.label+'</label>'
                          +'<div id="boolean_choice" class="col-lg-10 ">';
                        var newDirective_form_el = angular.element(element_string);
                        element.append(newDirective_form_el);

                        var boolean_choice = angular.element(document.querySelectorAll('#boolean_choice'));
                        angular.forEach(value.options, function (option) {
                        //alert(option.value);
                        element_string =
                        ' <div class="radio"><label class="">'
                        +"<input type='radio' name="+value.model+" aria-label='' value="+option.label+">"+option.label+""
                        +"</label>"
                        ;

                        newDirective = angular.element(element_string);
                        boolean_choice.append(newDirective);
                        console.log(angular.element(document.querySelectorAll('#boolean_choice')));
                        newDirective.find('input').attr('ng-model', bracket(value.model+ "." + option.value, attrs.ngModel));
                        $compile(newDirective)($scope);
                        })
                        }

              });
              })
        }
    };
}]
);

incidentApp.controller('IncidentAdminController', function IncidentAdminController($scope, $cookies, $http, $window) {

var map;
var markerLayer;
var geolocation;
$scope.comment;
$scope.address;
$scope.longitude;
$scope.latitude;
$scope.is_validated = $window.validation_id;

//alert($scope.is_validated);

$scope.init = function init()
{
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

  geolocation = new ol.Geolocation({
  tracking: true
  });

  setLocation();
  map.addLayer(markerLayer);

 }

function setLocation()
{
console.log($window.incident.latitude, $window.incident.longitude);
var iconFeature = new ol.Feature({
  geometry: new ol.geom.Point(ol.proj.transform([parseFloat($window.incident.longitude), parseFloat($window.incident.latitude)], 'EPSG:4326', 'EPSG:3857')),
  name: 'Null Island',
  population: 4000,
  rainfall: 500
});

var iconStyle = new ol.style.Style({
  image: new ol.style.Icon(({
    anchor: [0.26, 30],
    anchorXUnits: 'fraction',
    anchorYUnits: 'pixels',
    opacity: 0.75,
    src: "/static/incidents/img/marker.png"
  }))
});

iconFeature.setStyle(iconStyle);

var markerSource = new ol.source.Vector({
  features: [iconFeature]
});

markerLayer = new ol.layer.Vector({
  source: markerSource
});

}

$scope.validateIncident = function validateIncident(incident_id)
{
    save_data(incident_id);

}

$scope.get_user_location = function get_user_location(incident_id)
 {

        var location = geolocation.getPosition();
        $scope.latitude = location[1];
        $scope.longitude = location[0];
        console.log($scope.latitude, $scope.longitude);

        get_address(incident_id);

        //iconGeometry.setCoordinates(ol.proj.transform([latitude, longitude], 'EPSG:4326', 'EPSG:3857'));
 }

function get_address(incident_id)
{
console.log($scope.latitude, $scope.longitude);
$http({
    method: 'POST',
    url: 'http://maps.googleapis.com/maps/api/geocode/json',
    params: {latlng: ''+$scope.latitude+','+$scope.longitude+'',
             sensor: true},
    headers: {'X-CSRFToken': $cookies['csrftoken']},
    }).success(function(data, status, headers, config) {

    $scope.address = data.results[0].formatted_address;
    console.log($scope.address);

 })
}

function save_data(incident_id)
{
$http(
    {method: 'POST',
    url: '/incidents/save_validation/',
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    headers: {'X-CSRFToken': $cookies['csrftoken']},
    data:JSON.stringify({ 'validated_latitude': $scope.latitude, 'validated_longitude': $scope.longitude,
    'comment': $scope.comment, 'address': $scope.address,
     'incident_id': incident_id, 'date': new Date(), 'user':'/api/v1/user/1/'
    })
    }
    ).success(function(data) {
      console.log(data);
      $('#modal-container-336955').modal('hide')
      $(window).scrollTop(0);
      $('#success').fadeIn();

      $scope.is_validated = true;
    });

}

$scope.discardIncident = function discardIncident(id)
{
   $http(
    {method: 'POST',
    url: '/incidents/discard_incident/',
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    headers: {'X-CSRFToken': $cookies['csrftoken']},
    data:JSON.stringify({'incident_id': id})
    }
    ).success(function(data) {
      console.log(data);
      $window.location.href = '/incidents/incident_list/';
    });

    console.log($window.incident);
}


function deleteIncident(incident_id)
{
   $http(
    {method: 'DELETE',
    url: '/api/v1/incident/'+incident_id+'/',
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    headers: {'X-CSRFToken': $cookies['csrftoken']},
    }
    ).success(function(data) {
      console.log(data);

    });

}

})

incidentApp.run( function run( $http, $cookies){
    // For CSRF token compatibility with Django
    $http.defaults.headers.post['X-CSRFToken'] = $cookies.get('csrftoken');
})

incidentApp.config(function() {
  var $cookies;
  angular.injector(['ngCookies']).invoke(['$cookies', function(_$cookies_) {
    $cookies = _$cookies_;
  }]);

});
