customerphotos.config(function ($routeProvider,$locationProvider) {
    $locationProvider.html5Mode(true);
    $routeProvider.
        when("/", {
            templateUrl: "/customerphotos/partials/find.html",
            controller:  "FindController"
        }).
        when("/info",{
            templateUrl: "/customerphotos/partials/info.html",
            controller:  "InfoController"
        }).
        when("/divecentre",{
            templateUrl: "/customerphotos/partials/divecentre.html",
            controller:  "DivecentreController"
        }).
        when("/:divecentreid/staff",{
            templateUrl: "/customerphotos/partials/staff.html",
            controller:  "StaffController"
        }).
        when("/:albumid", {
            templateUrl: "/customerphotos/partials/album.html",
            controller:  "AlbumController"
        }).
        when("/:albumid/download",{
            templateUrl: "/customerphotos/partials/download.html",
            controller:  "DownloadController"
        }).
        when("/:albumid/:pictureid",{
            templateUrl: "/customerphotos/partials/picture.html",
            controller:  "PictureController"
        }).
        otherwise({
            redirectTo: '/'
        });
});
