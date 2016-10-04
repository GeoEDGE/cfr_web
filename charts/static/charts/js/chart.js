
var chartApp = angular.module("chartApp", ["ngCookies", "nvd3", "ngPrint"]);

chartApp.controller("ChartController", function ChartController($scope, $http, $window, $cookies) {

$scope.selectedDistrict = "Colombo";

//draw chart
$scope.draw_chart = function draw_chart(chart_type)
{

$http(
    {method: "POST",
    url: "/charts/chart_data",
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    headers: {
                  "X-CSRFToken": $cookies['csrftoken']
    },
    data:JSON.stringify({filter_query: chart_type, from_date: $window.start_date,
    end_date: $window.end_date, district: $scope.selectedDistrict
    })
    }
    ).success(function(data) {
      console.log(data);
      setChartData(data, chart_type);

    });
}

//init chart load
$scope.draw_chart("date_icount");
$scope.draw_chart("district_icount");

$scope.$watch("selectedDistrict", function(){
  header_el = angular.element(document.querySelectorAll("#pie_chart_header"));
  header_el.text("Report for Incident count Vs. District, " + $scope.selectedDistrict);

 });

// Bar chart options
$scope.options = {
    chart: {
        type: "discreteBarChart",
        height: 250,
        x: function(d){return (d.date);},
        y: function(d){return parseInt(d.count);},
        showValues: true,
        transitionDuration: 200,
        xAxis: {
            axisLabel: "Date",
            rotateLabels: -20
        },
        yAxis: {
            axisLabel: "No. of Incidents",
            axisLabelDistance: 30
        }
    }
}


// Pie chart options
$scope.options_district_pie = {
        chart: {
            type: "pieChart",
            width: 400,
            height: 400,
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
            text: "Chart Title"
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

// set chart data
function setChartData(data, chart_type)
{

if(chart_type == "date_icount"){
        $scope.data = [
                {
                    values: data,
                    color: "#ff7f0e",
                    strokeWidth: 2,
                }
            ];

        $scope.api.updateWithData($scope.data);
        $scope.api.refresh();
}
else if(chart_type == "district_icount"){
         $scope.data_district_pie = data;

        $scope.api_disaster_icount.updateWithData($scope.data_district_pie);
        $scope.api_disaster_icount.refresh();

        }
}

$scope.print_chart = function print_chart()
{
 $window.print();
}

})

