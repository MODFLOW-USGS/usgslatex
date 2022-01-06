#!/bin/bash

# run as sudo

CURRENT=`pwd`
echo "Current directory:  " $CURRENT

if [[ -z "$CI" ]]; then
    echo "Installing for current user"
    TEXLOCAL=`kpsewhich -var-value TEXMFHOME`
else
    echo "Installing for all users"
    TEXLOCAL=`kpsewhich -var-value TEXMFLOCAL`
fi

echo "LaTeX home directory:  " $TEXLOCAL

echo "Making a few directories if they do not exist..."
mkdir -p $TEXLOCAL/fonts
mkdir -p $TEXLOCAL/tex
mkdir -p $TEXLOCAL/dvips

echo "Copying USGS LaTeX style files..."
cp -R fonts $TEXLOCAL/.
cp -R tex $TEXLOCAL/.
cp -R dvips $TEXLOCAL/.

echo "Installing Univers font..."
cd $TEXLOCAL/dvips/funivers
updmap --sys --enable Map=funivers.map
updmap-sys

echo "Rebuild ls-R filename databases used by TeX..."
texhash --verbose $TEXLOCAL

echo "Returning to the starting directory:  " $CURRENT
cd $CURRENT

LOCATION=`kpsewhich usgsreporta.sty`
echo "Location of USGS LaTeX style files:  " $LOCATION
