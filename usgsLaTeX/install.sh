#!/bin/bash

# run as sudo

CURRENT=`pwd`
echo "Current directory:  " $CURRENT

CI=${CI:-default}
echo "CI:  " $CI

if [[ $CI == "default" ]]; then
    echo "Installing for current user"
    TEXLOCAL=`kpsewhich -var-value TEXMFHOME`
else
    echo "Installing for all users"
    TEXLOCAL=`kpsewhich -var-value TEXMFLOCAL`
fi
#echo "Installing for all users"
#TEXLOCAL=`kpsewhich -var-value TEXMFLOCAL`
#echo "Installing for current user"
#TEXLOCAL=`kpsewhich -var-value TEXMFHOME`

echo "LaTeX home directory:  " $TEXLOCAL

echo "Making a few directories if they do not exist..."
mkdir -p $TEXLOCAL/fonts
mkdir -p $TEXLOCAL/tex
mkdir -p $TEXLOCAL/dvips
mkdir -p $TEXLOCAL/bibtex

echo "Copying USGS LaTeX style files..."
cp -R fonts $TEXLOCAL/.
cp -R tex $TEXLOCAL/.
cp -R dvips $TEXLOCAL/.
cp -R bibtex $TEXLOCAL/.

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
