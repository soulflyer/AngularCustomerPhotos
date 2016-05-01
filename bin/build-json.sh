#!/bin/bash
NODIVECENTRE=false
DIVECENTRE="none"
DIVECENTREFBID="320658371441269"
DIVECENTREPROMOPIC="images/Divecentre.png"
DIVECENTREURL="http://soulflyer.co.uk"
BUILDZIP=false
PHOTOLIST=$(/Users/iain/bin/selectedpics)
JSONDIR="/Users/iain/Pictures/Published/json"
ZIPDIR="/users/iain/Pictures/Published/zip"
PICDIR="/Users/iain/Pictures/Published/large"

outp=/dev/stdout

OPTIND=1

while getopts "znu:f:i:p:d:l:?" opt; do
    case $opt in
        z)
            BUILDZIP=true
            ;;
        n)
            NODIVECENTRE=true
            ;;
        u)
            DIVECENTREURL=$OPTARG
            ;;
        d)
            DIVECENTRE=$OPTARG
            ;;
        i)
            DIVECENTREFBID=$OPTARG
            echo "Dive centre changed, make sure fb id matches" >&2
            ;;
        p)
            DIVECENTREPROMOPIC=$OPTARG
            ;;
        l)
            PHOTOLIST=$OPTARG
            ;;
        f)
            outp=$OPTARG
            ;;
    esac
done


shift $((OPTIND-1))
#Fuck knows why I'm checking for -- at this point...
[ "$1" = "--" ] && shift

echo $1

if [ $1 ]
then
    outp="$JSONDIR"/"$1"
fi

if [ "$DIVECENTRE" = "Sailing Club" ]
then
    echo "sailing club divers"
    DIVECENTREPROMOPIC="images/sailingpromo.jpg"
    DIVECENTREURL="http://www.sailingclubdivers.com"
    DIVECENTREFBID="123788904350090"
fi

if [ "$DIVECENTRE" == "Rainbow" ]
then
    echo "Rainbow divers"
    DIVECENTREPROMOPIC="images/RainbowPromo.png"
    DIVECENTREURL="http://divevietnam.com"
    DIVECENTREFBID="358956457475087"
fi

if [ "$DIVECENTRE" == "Alpha" ]
then
    echo "Alpha dive centre"
    DIVECENTREPROMOPIC="images/alpha.png"
    DIVECENTREURL="http://alphadive.center"
fi

# echo "  Photolist: $PHOTOLIST"
echo "Dive centre: $DIVECENTRE"
echo "  Promo pic: $DIVECENTREPROMOPIC"
echo "      FB ID: $DIVECENTREFBID"
echo "BUILDZIP is $BUILDZIP"
# echo "     extras: $@"

echo "{" > "$outp"
echo "  \"nodivecentre\": ${NODIVECENTRE}," >> "$outp"
echo "  \"divecentreFacebookID\": ${DIVECENTREFBID}," >> "$outp"
echo "  \"divecentre\": \"${DIVECENTRE}\"," >> "$outp"
echo "  \"divecentrePromoPic\": \"${DIVECENTREPROMOPIC}\"," >> "$outp"
echo "  \"divecentreURL\": \"${DIVECENTREURL}\"," >> "$outp"
echo "  \"photos\": [" >> "$outp"

FIRST=1
for picture in $PHOTOLIST
do
    if [ $FIRST -eq 1 ]
    then
        FIRST=0
    else
        echo "      ," >> "$outp"
    fi
    echo "    {" >> "$outp"
    echo "      \"url\": \"$picture\"" >> "$outp"
    echo "    }" >> "$outp"
done
echo "  ]" >> "$outp"
echo "}" >> "$outp"

if [ $BUILDZIP = true ]
then
    for picture in $PHOTOLIST
    do
        #add to zip file
        echo $PICDIR/$picture
        zip -jqdc "$ZIPDIR"/"$1".zip "$PICDIR"/"$picture"
    done
fi
