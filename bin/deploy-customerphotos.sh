echo "Copying files to soulflyer"
rsync -vaikL  --exclude=.DS_Store --exclude=.sass-cache --exclude=.git \
    /Users/iain/Code/Play/angular/CustomerPhotos/ \
        jphuquoc@soulflyer.co.uk:CustomerPhotos/
