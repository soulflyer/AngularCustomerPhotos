customerphotos.controller(
    "PictureController",
    function ($scope, $routeParams, $http) {
        $http.get("json/" + $routeParams.albumid).success(function(data, status, headers, config) {
            $scope.album = data;
            $scope.currentpic=$scope.album.photos[$routeParams.pictureid];
            $scope.albumid=$routeParams.albumid;
            pictureidint=parseInt($routeParams.pictureid);
            piccount=($scope.album.photos.length - 1);
            if(pictureidint > 0){
                $scope.prevpicnumber=pictureidint - 1;
            }else{
                $scope.prevpicnumber=pictureidint;
            }
            if(pictureidint < piccount){
                $scope.nextpicnumber=pictureidint + 1;
            }else{
                $scope.nextpicnumber=pictureidint;
            }
        });
    });
