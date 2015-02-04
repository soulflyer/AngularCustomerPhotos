customerphotos.config(function ($routeProvider) {
    $routeProvider.
        when("/:albumid", {
            templateUrl: "partials/album.html",
            controller: "PhotosController"
        }).
        when("/:albumid/:pictureid",{
            templateUrl: "partials/picture.html",
            controller: "PictureController"
        }).
        otherwise({
            redirectTo: '/parking'
        });
});
