#!/bin/bash

# run as sudo

CURRENT=`pwd`
echo "Current directory:  " $CURRENT

TEXROOT=`kpsewhich -var-value TEXMFHOME`
echo "LaTeX home directory:  " $TEXROOT

echo "making a few directories if they do not exist..."
mkdir -p $TEXROOT/fonts
mkdir -p $TEXROOT/tex
mkdir -p $TEXROOT/dvips

echo "copying USGS LaTeX style files..."
cp -R fonts $TEXROOT/.
cp -R tex $TEXROOT/.
cp -R dvips $TEXROOT/.

echo "installing Univers font..."
cd $TEXROOT/dvips/funivers
texhash
updmap -sys --enable Map=funivers.map
updmap-sys

echo "returning to the starting directory:  " $CURRENT
cd $CURRENT

LOCATION=`kpsewhich usgsreporta.sty`
echo "Location of USGS LaTeX style files:  " $LOCATION
