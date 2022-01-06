#!/bin/bash

# run as sudo

CURRENT=`pwd`
echo "Current directory:  " $CURRENT

TEXROOT=`kpsewhich -var-value TEXMFHOME`
echo "LaTeX home directory:  " $TEXROOT

echo "Making a few directories if they do not exist..."
mkdir -p $TEXROOT/fonts
mkdir -p $TEXROOT/tex
mkdir -p $TEXROOT/dvips

echo "Copying USGS LaTeX style files..."
cp -R fonts $TEXROOT/.
cp -R tex $TEXROOT/.
cp -R dvips $TEXROOT/.

echo "Installing Univers font..."
cd $TEXROOT/dvips/funivers
updmap --sys --enable Map=funivers.map
updmap-sys

echo "Rebuild ls-R filename databases used by TeX..."
texhash --verbose $TEXROOT

echo "Returning to the starting directory:  " $CURRENT
cd $CURRENT

LOCATION=`kpsewhich usgsreporta.sty`
echo "Location of USGS LaTeX style files:  " $LOCATION
