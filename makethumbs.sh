#!/bin/bash
#
#
#

IMAGEMAGICKBIN="/sw/bin"

SOURCEDIR="/path/to/fullsize/images"
THUMBSDIR="/path/to/thumbnail/dir"
QUALITY=7
RESIZE="200x150"

if [ ! -w $SOURCEDIR ] 
then
    echo "SOURCEDIR is not writeable...exiting"
    exit 1
fi

if [ ! -e $THUMBSDIR ]
then
    echo "no THUMBDIR present, creating..."
fi


for i in $SOURCEDIR
do
   $IMAGEMAGICKBIN/convert -quality $QUALITY -resize $RESIZE $INPUTIMAGE $THUMBSDIR/$INPUTIMAGE-thumb.jpg
done

