window.App = angular.module('App', []);

App.controller('LineChartController', function($scope){
  // var input = [
  //   {x: 10, y: 0},
  // ];
  
  $scope.data = [
		{
		"winner": 1
		},
		{
		"winner": 2
		},		
		{
		"winner": 1
		}		
	];
 
  var p1_progress = [];
  var p1_points=0;
  p1_progress.push({x:0,y:115});
for (var i = 0; i < $scope.data.length; i++) {
  if($scope.data[i].winner ==1) p1_points += 1;
  var new_point = {x: (i+1)*10, y: 115-p1_points*10};
  p1_progress.push(new_point);
}
    
  $scope.points_1 = p1_progress;
 
  $scope.linePath1 = function(){
    var pathParts = [], currentPoint, i;
    
    for (i = 0; i < $scope.points_1.length; i++) {
      currentPoint = $scope.points_1[i];
      pathParts.push(currentPoint.x + "," + currentPoint.y);
    }

    return "M" + pathParts.join(" L");
  };
});


// $(function() {
	// $('.btn').on('click', function() {
	//    var appElement = document.querySelector('[ng-controller=LineChartController]');
	//    var $scope = angular.element(appElement).scope();

	//   $scope.$apply(function() {
	//     $scope.points_1 = [{x: 30, y: 50},
	//     {x: 100, y: 80},
	//     {x: 200, y: 40},
	//     {x: 280, y: 50}]
	//   });
	// });
// });
  
//   var p2_progress = [];
//   var p2_points=0;
//   p2_progress.push({x:0,y:115});
// for (var j = 0; j < $scope.data.length; j++) {

//   if($scope.data[j].winner == 2) p2_points += 1;
//   var new_point_p2 = {x: (j+1)*10, y: 115-p2_points*10};
//   p2_progress.push(new_point_p2);
// }
    
//   $scope.points_2 = p2_progress;
  
//     $scope.linePath2 = function(){
//     var pathParts = [], currentPoint, j;
    
//     for (j = 0; j < p2_progress.length; j++) {
//       currentPoint = p2_progress[j];
//       pathParts.push(currentPoint.x + "," + currentPoint.y);
//     }

//     return "M" + pathParts.join(" L");
//   }; 
// });