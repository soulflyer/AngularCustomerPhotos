echo "Copying files to soulflyer"
rsync -vaikL  --exclude=.DS_Store --exclude=.sass-cache --exclude=.git \
    --exclude=zip --exclude=json \
    /Users/iain/Code/AngularCustomerPhotos/ \
        jphuquoc@soulflyer.co.uk:CustomerPhotos/
