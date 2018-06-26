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
