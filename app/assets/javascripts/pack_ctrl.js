(function() {
  "use strict";

  angular.module("app").controller("packCtrl", function($scope){

    $scope.essentials = [
      {
        text: "Shoes"
      }
    ]




    $scope.deleteEssential = function(index){
      $scope.essentials.splice(index, 1)
    };

    window.scope = $scope;



  });

}());