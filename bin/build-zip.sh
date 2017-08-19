#!/bin/bash
ZIPDIR="/users/iain/Pictures/Published/zip"
PICDIR="/Users/iain/Pictures/Published/large"
#PHOTOLIST=$(/Users/iain/bin/selectedpics)
PHOTOLIST=$_
echo "Parameters " $PHOTOLIST
for picture in $PHOTOLIST
do
    #add to zip file
    echo "$picture"
    zip -jq "$ZIPDIR"/"$1".zip "$PICDIR"/"$picture"
done
