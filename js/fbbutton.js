window.fbAsyncInit = function() {
    FB.init({
        // appId for localhost
        // appId      : '659375807506663',
        // appId for soulflyer.co.uk
        appId      : '897493126927870',
        xfbml      : true,
        version    : 'v2.2'
    });
};

(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

var buttonPressed = function(){
    postImage("http://soulflyer.co.uk/photos/medium/2014/09/04-Bute/DIW_8563.jpg");
};

var postImage = function(imageURL,divecentre){
    console.log('Attempting to log in to FaceBook');
    usermessage = prompt("Posting to FaceBook, Add a message if you like\nHit return to just post the picture");

    if (usermessage != null){
        if (usermessage != "") {
            usermessage = usermessage + "\n";
        }
        var message = usermessage;
        console.log(message);
        if (!divecentre){
            divecentre=320658371441269;
            console.log(divecentre);
        }

        FB.login(function(response){
            if (response.authResponse){
                var access_token = FB.getAuthResponse()['accessToken'];
                console.log('Acess Token = ' + access_token);
                FB.api('me/photos', 'post',
                       { message: message,
                         url: imageURL,
                         place: divecentre
                       },
                       function(response2){
                           if (!response2 || response2.error){
                               alert('error posting to facebook');
                           }else{
                               alert('Posted pic to Facebook');
                           }
                       });
            } else {
                console.log('User cancelled login');
            }
        }, {scope: 'publish_actions'});
    }

};
