#!/bin/bash
# bin/fullsize-zip.sh Favorites Favorites-Full
# Reads from Favorites in json dir and writes to Favorites-Full in the zip dir
# Don't use the same name unless you want to overwrite the zip that
# is probably already there.
ZIPDIR="/users/iain/Pictures/Published/zip"
PICDIR="/Users/iain/Pictures/Published/fullsize"
JSONDIR="/Users/iain/Pictures/Published/json"
INFILE="$JSONDIR/$1"
shift
OUTFILE=$1
shift
echo "Parameters " $INFILE " " $OUTFILE""
PHOTOLIST=`cat $INFILE | grep url | sed 's/ *\\"url\\": \\"//' | sed 's/\\"//'`

for picture in $PHOTOLIST
do
    #add to zip file
    echo "$picture"
    zip -jq "$ZIPDIR"/"$OUTFILE".zip "$PICDIR"/"$picture"
done
