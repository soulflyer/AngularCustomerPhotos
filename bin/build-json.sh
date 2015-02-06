#!/bin/bash
DIVECENTRE="Rainbow"
DIVECENTREFBID="358956457475087"
DIVECENTREPROMOPIC="images/Divecentre.png"
PHOTOLIST=`/Users/iain/bin/selectedpics`
outp=/dev/stdout

OPTIND=1

while getopts "f:i:p:d:l:?" opt; do
  case $opt in
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
[ "$1" = "--" ] && shift

# echo "  Photolist: $PHOTOLIST"
# echo "Dive centre: $DIVECENTRE"
# echo "  Promo pic: $DIVECENTREPROMOPIC"
# echo "      FB ID: $DIVECENTREFBID"
# echo "     extras: $@"

echo "{" > $outp
echo "  \"divecentreFacebookID\": ${DIVECENTREFBID}," > $outp
echo "  \"divecentre\": ${DIVECENTRE}," > $outp
echo "  \"divecentrePromoPic\": ${DIVECENTREPROMOPIC}," > $outp
echo "  \"photos\": [" > $outp

for picture in $PHOTOLIST
do
    echo "    {" > $outp
    echo "      $picture" > $outp
    echo "    }," > $outp
done
echo "  ]" > $outp
echo "}" > $outp
