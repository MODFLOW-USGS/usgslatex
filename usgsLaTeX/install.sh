#!/bin/bash

# run as sudo

LOCAL=${1:-local}
echo "Installation option:  " $LOCAL

CURRENT=`pwd`
echo "Current directory:  " $CURRENT

if [[ $LOCAL == "--all-users" ]]; then
    echo "Installing for all users"
    TEXLOCAL=`kpsewhich -var-value TEXMFLOCAL`
else
    echo "Installing for current user"
    TEXLOCAL=`kpsewhich -var-value TEXMFHOME`
fi

echo "LaTeX home directory:  " $TEXLOCAL

echo "Making a few directories if they do not exist..."
mkdir -p $TEXLOCAL/fonts
mkdir -p $TEXLOCAL/tex
mkdir -p $TEXLOCAL/dvips
mkdir -p $TEXLOCAL/bibtex

echo "Copying USGS LaTeX style files..."

echo "Copy fonts -> " $TEXLOCAL/.
cp -v -R fonts $TEXLOCAL/.

echo "Copy tex -> " $TEXLOCAL/.
cp -v -R tex $TEXLOCAL/.

echo "Copy dvips -> " $TEXLOCAL/.
cp -v -R dvips $TEXLOCAL/.

echo "Copy bibtex -> " $TEXLOCAL/.
cp -v -R bibtex $TEXLOCAL/.

echo "Installing Univers font..."
cd $TEXLOCAL/dvips
updmap -sys --enable Map=funivers.map
updmap-sys

echo "Rebuild ls-R filename databases used by TeX..."
mktexlsr --verbose

echo "Returning to the starting directory:  " $CURRENT
cd $CURRENT

echo "Evaluate if USGS style files are available"
LOCATION=`kpsewhich usgsreporta.sty`
echo "Location of USGS LaTeX style files:  " $LOCATION
