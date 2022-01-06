#!/bin/bash

# run as sudo

CURRENT=`pwd`
echo "\nCurrent directory:\n  " $CURRENT

TEXROOT=`kpsewhich -var-value TEXMFHOME`
echo "\nLaTeX home directory:\n  " $TEXROOT

echo "\nmaking a few directories if they do not exist..."
mkdir -p $TEXROOT/fonts
mkdir -p $TEXROOT/tex
mkdir -p $TEXROOT/dvips

echo "\ncopying USGS LaTeX style files..."
cp -R fonts $TEXROOT/.
cp -R tex $TEXROOT/.
cp -R dvips $TEXROOT/.

echo "\ninstalling Univers font..."
cd $TEXROOT/dvips/funivers
texhash
updmap -sys --enable Map=funivers.map
updmap-sys

echo "\nreturning to the starting directory:\n  " $CURRENT
cd $CURRENT

LOCATION=`kpsewhich usgsreporta.sty`
echo "\nLocation of USGS LaTeX style files:\n  " $LOCATION
