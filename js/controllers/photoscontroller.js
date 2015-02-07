customerphotos.controller("PhotosController",
                          function($scope, $routeParams, $http) {
    $http.get("json/" + $routeParams.albumid).success(function(data, status, headers, config) {
        $scope.album = data;
        $scope.albumid=$routeParams.albumid;
    });
//    $scope.rt = "http://soulflyer.co.uk/photos";
    //fillBlanks($scope);
});
