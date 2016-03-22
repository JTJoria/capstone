(function() {
  "use strict";

  angular.module("app").controller("situationsCtrl", function($scope, $http){

    $scope.setup = function(situations){
      $scope.situations = situations
    };

    $scope.isChecked = function(person_id, situation_id){
      for(var i = 0; i < $scope.situations.length; i++){
        if ($scope.situations[i].people_id == person_id && 
          $scope.situations[i].situation_id == situation_id){
          return true;
        }
      }
      return false;
    };
    $scope.addSituation = function(person_id, situation_id, trip_id){
      console.log(person_id, situation_id, trip_id);
      if (!$scope.isChecked(person_id, situation_id)){
        console.log('add')
        $http.post('/trips/' + trip_id + '/situations/addsituation?situation_id=' + situation_id + '&people_id=' + person_id).then(function(response){
            var sit = {
              people_id: person_id,
              situation_id: situation_id,
              trip_id: trip_id
            };
            $scope.situations.push(sit);      
      
            }, function(error){
              console.log (error);
            });
      }else{
        console.log('delete')
        $http.delete('/trips/' + trip_id + '/situations/removesituation?situation_id=' + situation_id + '&people_id=' + person_id).then(function(response){
          for(var i = 0; i < $scope.situations.length; i++){
            if ($scope.situations[i].people_id == person_id && 
              $scope.situations[i].situation_id == situation_id){
              $scope.situations.splice(i,1);
            }
          }
          }, function(error){

         });
      }
    }
  });
})();