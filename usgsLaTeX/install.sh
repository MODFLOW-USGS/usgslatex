#!/bin/bash

# run as sudo

CURRENT=`pwd`
echo "\nCurrent directory:\n  " $CURRENT

TEXROOT=`kpsewhich -var-value TEXMFHOME`
echo "\nLaTeX home directory:\n  " $TEXROOT

echo "\rcopying USGS LaTeX style files..."
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
