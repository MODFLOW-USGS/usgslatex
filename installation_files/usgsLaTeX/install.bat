rem Install script must be run from same drive
rem as TEXROOT.  I learned this the hard way...

cd > result.txt
set /p CURRENT=<result.txt
echo Current directory=%CURRENT%

rem kpsewhich -var-value TEXMFHOME > result.txt
rem set /p TEXROOT=<result.txt
rem echo TEXROOT=%TEXROOT%

rem set TEXROOT=C:\texlive\texmf-local
rem echo TEXROOT=%TEXROOT%

rem xcopy fonts /E /F %TEXROOT%\fonts\
rem xcopy tex /E /F %TEXROOT%\tex\
rem xcopy dvips /E /F %TEXROOT%\dvips\

rem cd %TEXROOT%\dvips\funivers
rem texhash
rem updmap -sys --enable Map=funivers.map
rem updmap-sys

echo Return to %CURRENT%
cd %CURRENT%

rem kpsewhich usgsreporta.sty

pause
