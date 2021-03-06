(function() {
  "use strict";

  angular.module("app").controller("packCtrl", function($scope, $http){
    $scope.personalClothing = [];
    $scope.setup = function(){
      $http.get('api/v1/clothing_selections.json').then(function(response){
        $scope.clothing_selections = response.data;
      });
    };

    $scope.togglePack = function(garment){
      garment.packed = !garment.packed
    };

    $scope.personalClothingSelection = function(person){

      return $scope.personalClothing[person];
    };

    $scope.addEssentials = function( essentials, person){

      if(!scope.personalClothing[person]){
        $scope.personalClothing[person] = [];
      }
      var outfit = {
          name: 'Essentials',
        garments: essentials
      };
      $scope.personalClothing[person].push(outfit);
    }

    $scope.addOutfit = function(outfit, garments, person){
      if(!scope.personalClothing[person]){
        $scope.personalClothing[person] = [];
      }
      outfit.garments = garments;
      $scope.personalClothing[person].push(outfit);
    }

    $scope.addNewPerson = function(newName, newGender, newAge){
      var newPerson = {
        name: newName,
        gender: newGender,
        age: newAge
      };

      $http.post('/api/v1/persons.json', newPerson).then(function(response)
        {
          $scope.persons.push(response.data);
      }, function(response){
        $scope.errors = response.data.errors;
      });

    };

    $scope.addNewGarment = function(newName){
      var newGarment = {
        name: newName,
        packed: false
      };

      $http.post('/api/v1/clothing_selections.json', newGarment).then(function(response)
        {
          $scope.clothing_selections.push(response.data);
      }, function(response){
        $scope.errors = response.data.errors;
      });

    };


    window.scope = $scope;



  });

})();