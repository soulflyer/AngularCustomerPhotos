customerphotos.config(function ($routeProvider,$locationProvider) {
    $locationProvider.html5Mode(true);
    $routeProvider.
        when("/", {
            templateUrl: "/customerphotos/partials/find.html",
            controller: "FindController"
        }).
        when("/info",{
            templateUrl: "/customerphotos/partials/info.html",
            controller: "InfoController"
        }).
        when("/:albumid", {
            templateUrl: "/customerphotos/partials/album.html",
            controller: "PhotosController"
        }).
        when("/:albumid/:pictureid",{
            templateUrl: "/customerphotos/partials/picture.html",
            controller: "PictureController"
        }).
        otherwise({
            redirectTo: '/'
        });
});
