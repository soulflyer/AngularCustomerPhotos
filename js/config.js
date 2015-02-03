customerphotos.config(function ($routeProvider) {
    $routeProvider.
        when("/:albumid", {
            templateUrl: "partials/album.html",
            controller: "PhotosController"
        }).
        otherwise({
            redirectTo: '/parking'
        });
});
