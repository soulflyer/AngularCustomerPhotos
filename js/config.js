customerphotos.config(function ($routeProvider,$locationProvider) {
    $locationProvider.html5Mode(true);
    $routeProvider.
        when("/", {
            templateUrl: "partials/find.html",
            controller:  "FindController"
        }).
        when("/info",{
            templateUrl: "partials/info.html",
            controller:  "InfoController"
        }).
        when("/divecentre",{
            templateUrl: "partials/divecentre.html",
            controller:  "DivecentreController"
        }).
        when("/:divecentreid/staff",{
            templateUrl: "partials/staff.html",
            controller:  "StaffController"
        }).
        when("/:albumid", {
            templateUrl: "partials/album.html",
            controller:  "AlbumController"
        }).
        when("/:albumid/download",{
            templateUrl: "partials/download.html",
            controller:  "DownloadController"
        }).
        when("/:albumid/:pictureid",{
            templateUrl: "partials/picture.html",
            controller:  "PictureController"
        }).
        otherwise({
            redirectTo: '/'
        });
});
