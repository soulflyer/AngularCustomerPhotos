customerphotos.controller("PhotosController",
                          function($scope, $routeParams, $http) {
    $http.get($routeParams.albumid).success(function(data, status, headers, config) {
        $scope.album = data;
    });
    $scope.rootURL = "http://soulflyer.co.uk/photos";
    //fillBlanks($scope);
});
