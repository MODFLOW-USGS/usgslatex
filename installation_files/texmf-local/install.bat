# Install script must be run from same drive
# as TEXROOT.  I learned this the hard way...
set TEXROOT=C:\texlive\texmf-local
echo TEXROOT=%TEXROOT%

xcopy fonts /E /F %TEXROOT%\fonts\
xcopy tex /E /F %TEXROOT%\tex\
xcopy dvips /E /F %TEXROOT%\dvips\

cd %TEXROOT%\dvips\funivers
texhash
updmap -sys --enable Map=funivers.map
updmap-sys

kpsewhich usgsreporta.sty

pause
