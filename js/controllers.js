function PhotosController($scope, $http) {
    $http.get('photos.json').success(function(data, status, headers, config) {
        $scope.album = data;
    });
    $scope.rootURL = "http://soulflyer.co.uk/photos";
    //fillBlanks($scope);
}

function fillBlanks($scope){

    alert("hi");
}
