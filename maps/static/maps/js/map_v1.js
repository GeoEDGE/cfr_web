
var mapApp = angular.module('mapApp', ['ngCookies', 'nvd3']);

mapApp.controller('MapController', function MapController($scope, $window, $document, $cookies, $http) {

      var map;
      var incidentLayer;
      var incidentSource;
      var filter_options = {};
      var popup;
      $scope.selectedDisaster = "-1";
      $scope.selectedDistrict = "-1";
      $scope.is_validated = 'all';
      $scope.layerName;

      $scope.LAYER_DOWNLOAD_FROMATS = [
        {name: 'json'},
        {name: 'kml'},
        {name: 'gif'},
        {name:'png'},
        {name:'csv'}
      ]

      var viewparams = {
      disaster_type: null,
      district: null,
      is_validated:$scope.is_validated,
      toString: function()
      {
            var view_params;
            if(this.disaster_type && this.disaster_type != -1)
            view_params = 'disaster_type='+this.disaster_type;
            if(this.district && this.district != -1)
            view_params = view_params ? view_params+' AND '+ "district='"+this.district+"'":
                          "district='"+this.district+"'";
            if(this.is_validated != 'all')
            {
            var validate_conditn = this.is_validated == 0 ? ' is NULL' : ' is not NULL ';
            view_params = view_params ? view_params+' AND '+ "validation_id "+ validate_conditn:
                          "validation_id "+validate_conditn;
            }
            if($window.start_date && $window.end_date)
            {
            view_params = view_params ? view_params+' AND '+ "reported_date between '"+$window.start_date+"'"
            +' AND '+ ''+$window.end_date+''
            : "reported_date between '"+$window.start_date+"'"
            +"AND '"+$window.end_date+"'";
            }

            console.log('view param ', this.is_validated);
            return view_params;

      }
      };

      function createWMSLayer(map)
      {
       incidentLayer = new ol.layer.Tile({
       source: createWMSSource()
       })

      }

      function createWMSSource()
      {

       view_params = viewparams.toString();
       var wms_params;

       if(view_params)
       wms_params = {'LAYERS': 'cfr:cfr_v9', 'TILED': true, 'CQL_FILTER':view_params};
       else
       wms_params = {'LAYERS': 'cfr:cfr_v9', 'TILED': true};

       console.log('disaster_type: ', view_params);
       //"disaster_type=2 AND district='Colombo'"
       incidentSource = new ol.source.TileWMS(({
       url: "http://localhost:8080/geoserver/wms",
       params: wms_params,
       serverType: 'cfr'
       }))

       return incidentSource;
      }


      function urlEncode()
      {
        return jQuery.param( viewparams );
      }

      $scope.init = function initMap()
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

      createWMSLayer(map);
      map.addLayer(incidentLayer);

      var element = document.querySelector( '#popup' );

      popup = new ol.Overlay({
          element: element,
          positioning: 'bottom-center',
          stopEvent: false
      });

      map.on('click', function(evt) {
         get_feature_info(evt);

      })

      }
function get_feature_info(evt){
//popup.hide();
popup.setOffset([0, 0]);

var feature = map.forEachFeatureAtPixel(evt.pixel, function(feature, layer) {
    return feature;
});
console.log(feature);
if (feature) {

    var coord = feature.getGeometry().getCoordinates();
    var props = feature.getProperties();
    var info = "<h2><a href='" + props.caseurl + "'>" + props.casereference + "</a></h2>";
        info += "<p>" + props.locationtext + "</p>";
        info += "<p>Status: " + props.status + " " + props.statusdesc + "</p>";
    // Offset the popup so it points at the middle of the marker not the tip
    popup.setOffset([0, -22]);
    popup.show(coord, info);

} else {

    var url = incidentLayer
                .getSource()
                .getGetFeatureInfoUrl(
                    evt.coordinate,
                    map.getView().getResolution(),
                    map.getView().getProjection(),
                    {
                        'INFO_FORMAT': 'application/json',
                        'propertyName': 'NAME,AREA_CODE,DESCRIPTIO'
                    }
                );

        $http(
        {method: 'POST',
        url: url,
        dataType: "jsonp",
        contentType: "application/json; charset=utf-8",
        crossDomain : true,
        data:{}
        }
        ).success(function(data) {
               console.log('data ', data);
               /*var feature = data.features[0];
                var props = feature.properties;
                var info = "<h2>" + props.NAME + "</h2><p>" + props.DESCRIPTIO + "</p>";
                popup.show(evt.coordinate, info);*/
        });

    /*request({
        url: url,
        type: 'json',
    }).then(function (data) {
        var feature = data.features[0];
        var props = feature.properties;
        var info = "<h2>" + props.NAME + "</h2><p>" + props.DESCRIPTIO + "</p>";
        popup.show(evt.coordinate, info);
    });*/

}
}

      $scope.layerFilter = function layerFilter()
      {

         layer=map.getLayers().getArray()[1];
         layer.setSource(createWMSSource());

      }

      $scope.getFilterData = function getFilterData(selectedValue, filter_type)
      {
         if(filter_type == 'disaster')
         viewparams.disaster_type = selectedValue;
         else if(filter_type == 'district')
         viewparams.district = selectedValue;
         else if(filter_type == 'validation')
         viewparams.is_validated = selectedValue;

      }



      $scope.fetch_url = function fetch_url(format)
      {
         var url;
         var view_params = viewparams.toString();
         view_params = view_params ? '&CQL_FILTER='+view_params : '';
         console.log(view_params);
         if(format=='gif')
         url = "http://localhost:8080/geoserver/cfr/wms?service=WMS&version=1.1.0&request=GetMap&layers=cfr:cfr_v9&styles=&bbox=79.83528,6.035,800.0,9.66667&width=768&height=330&srs=EPSG:4326&format=image%2Fgif"+view_params;
         else if(format=='kml')
         url = "http://localhost:8080/geoserver/cfr/wms/kml?layers=cfr:cfr_v9";
         else if(format=='json')
         url = "http://localhost:8080/geoserver/cfr/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=cfr:cfr_v9&maxFeatures=50&outputFormat=application%2Fjson";
         else if(format=='csv')
         url = "http://localhost:8080/geoserver/cfr/wms?typename=cfr%3cfr_v9&outputFormat=csv&version=1.0.0&request=GetFeature&service=WFS";
         else if(format=='png')
         url = "http://localhost:8080/geoserver/cfr/wms?service=WMS&version=1.1.0&request=GetMap&layers=cfr:cfr_v9&styles=&bbox=79.83528,6.035,800.0,9.66667&width=768&height=330&srs=EPSG:4326&format=image%2Fpng";
       return url;
      }

});


mapApp.controller('DashboardController', function DashboardController($scope, $http, $window, $cookies) {

$scope.total_incidents;
$scope.non_confirmed;
$scope.confirmed;
$scope.province_inc;

var map;
var incidentLayer;
var incidentSource;
var filter_options = {};

$http(
{method: 'POST',
url: '/dashboard/get_summary/',
dataType: "json",
contentType: "application/json; charset=utf-8",
data:{}
}
).success(function(data) {

   $scope.total_incidents = data['total_incidents'];
   $scope.non_confirmed = data['non_confirmed_count'];
   $scope.confirmed = data['confirmed_inc_count'];
   $scope.province_inc = JSON.parse(data['province_data']);
   $scope.chart_data = JSON.parse(data['chart_data']);
   setChartData($scope.chart_data);
   console.log($scope.chart_data);
});


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

  createWMSLayer(map);
  map.addLayer(incidentLayer);
}

  function createWMSLayer(map)
  {
   incidentLayer = new ol.layer.Tile({
   source: createWMSSource()
   })

  }

  function createWMSSource()
  {

   incidentSource = new ol.source.TileWMS(({
   url: "http://localhost:8080/geoserver/wms",
   params: {'LAYERS': 'cfr:cfr_v9', 'TILED': true},
   serverType: 'cfr'
   }))

   return incidentSource;
  }

$scope.options = {
        chart: {
            type: 'pieChart',
            width: 600,
            height: 600,
            margin : {
                    top: 20,
                    right: 20,
                    bottom: 40,
                    left: 0
                },
            x: function(d){return d.disaster_type__english;},
            y: function(d){return d.count;},
            showLabels: true,
            transitionDuration: 500,
            useInteractiveGuideline: true,
            refreshDataOnly: true,
            deepWatchData: true,
            labelThreshold: 0.01,
            title: {
            enable: true,
            text: 'Chart Title'
            },
            legend: {
                margin: {
                    top: 10,
                    right: 35,
                    bottom: 5,
                    left: 0
                }
            },

        }
    };

function setChartData(data)
{
         $scope.data = data;

        $scope.api.updateWithData($scope.data);
        $scope.api.refresh();
}

})


mapApp.controller('ChartController', function ChartController($scope, $http, $window, $cookies) {

$scope.selectedDistrict = 'Colombo';

$scope.draw_chart = function draw_chart()
{

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
      setChartData(data);

    });
}

$scope.draw_chart();
$scope.options = {
        chart: {
            type: 'pieChart',
            width: 400,
            height: 400,
            margin : {
                    top: 20,
                    right: 20,
                    bottom: 40,
                    left: 0
                },
            x: function(d){return d.disaster_type;},
            y: function(d){return d.count;},
            showLabels: true,
            transitionDuration: 500,
            useInteractiveGuideline: true,
            refreshDataOnly: true,
            deepWatchData: true,
            labelThreshold: 0.01,
            title: {
            enable: true,
            text: 'Chart Title'
            },
            legend: {
                margin: {
                    top: 10,
                    right: 35,
                    bottom: 5,
                    left: 0
                }
            },

        }
    };

function setChartData(data)
{

         $scope.data = data;

        $scope.api.updateWithData($scope.data_district_pie);
        $scope.api.refresh();


}

})

