
var reportApp = angular.module("reportApp", ["ngCookies", "AngularPrint"]);

reportApp.controller("ReportController", function ReportController($scope, $http, $window, $cookies) {

$window.start_date;
$window.end_date;
$scope.selectedDistrict = "Colombo";
$scope.filter_data = [];
$scope.incidentDistrictHeader;

// load incident data
$scope.loadData = function loadData(filter_type)
{

    $http(
    {method: "POST",
    url: "/reports/inc_date_data/"+filter_type,
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    headers: {
                  "X-CSRFToken": $cookies["csrftoken"]
    },
    data:JSON.stringify({from_date: $window.start_date, end_date: $window.end_date, district: $scope.selectedDistrict
    , is_export: false})
    }
    ).success(function(data) {
       console.log(data);
       $scope.filter_data = data;
       select_headers(filter_type);
    });

}
// watch district change event
$scope.$watch("selectedDistrict", function(){
  header_el = angular.element(document.querySelectorAll("#incident_district_header"));
  header_el.text("Report for Incident count Vs. District, " + $scope.selectedDistrict);

 });

// customize headers
function select_headers(filter_type)
{
    if(filter_type == "date_icount"){
    $scope.table_head_1 = "Date"
    $scope.table_head_2 = "Incident Count"
    }
    else if(filter_type == "district_disaster")
    {
    $scope.table_head_1 = "Disaster Type"
    $scope.table_head_2 = "Incident Count"
    }
}

// export report data
$scope.report_export = function report_export(filter_type)
{
console.log($scope.filter_data);


$http(
    {method: "POST",
    url: "/reports/inc_date_data/"+filter_type,
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    headers: {
                  "X-CSRFToken": $cookies["csrftoken"]
    },
    data:JSON.stringify({from_date: $window.start_date, end_date: $window.end_date, district: $scope.selectedDistrict,
    is_export: true})
    }
    ).success(function(data) {
       console.log(data);

       csv_download(data);
    });
}

function csv_download(data)
{

var anchor = angular.element("<a/>");
anchor.css({display: "none"});
angular.element(document.body).append(anchor);

anchor.attr({
    href: "data:attachment/csv;charset=utf-8," + encodeURI(data),
    target: "_blank",
    download: "incident_data.csv"
})[0].click();

anchor.remove();
}

// set print page header
$scope.set_print_date = function set_print_date()
{
  header_el = angular.element(document.querySelectorAll("#incident_date_header"));
  header_el.text("Date" + $window.start_date);
}

})

reportApp.run( function run( $http, $cookies){

    // For CSRF token compatibility with Django
    $http.defaults.headers.post["X-CSRFToken"] = $cookies.get("csrftoken");

})

reportApp.config(function() {
  var $cookies;
  angular.injector(["ngCookies"]).invoke(["$cookies", function(_$cookies_) {
    $cookies = _$cookies_;
  }]);

});