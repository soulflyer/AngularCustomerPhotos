#!/bin/bash
NODIVECENTRE=false
DIVECENTRE="Rainbow"
DIVECENTREFBID="358956457475087"
DIVECENTREPROMOPIC="images/RainbowPromo.png"
DIVECENTREURL="http://divevietnam.com"
PHOTOLIST=$(/Users/iain/bin/selectedpics)
JSONDIR="/Users/iain/Pictures/Published/json"
outp=/dev/stdout

OPTIND=1

while getopts "nu:f:i:p:d:l:?" opt; do
    case $opt in
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


# echo "  Photolist: $PHOTOLIST"
# echo "Dive centre: $DIVECENTRE"
# echo "  Promo pic: $DIVECENTREPROMOPIC"
# echo "      FB ID: $DIVECENTREFBID"
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
