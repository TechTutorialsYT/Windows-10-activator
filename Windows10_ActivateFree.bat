@echo off
setlocal

echo Please wait as we activate windows for free... DO NOT close this command prompt as it may brick your PC.
pause

for /f "tokens=2 delims==" %%a in ('wmic os get Caption /value') do set "edition=%%a"

if not defined edition (
  echo Unable to determine Windows edition.
  exit /b 1
)

echo Edition: "%edition%"

set key=
if "%edition%"=="Microsoft Windows 10 Home" set "key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99"
if "%edition%"=="Microsoft Windows 10 Home N" set "key=3KHY7-WNT83-DGQKR-F7HPR-844BM"
if "%edition%"=="Microsoft  Windows 10 Home Single Language" set "key=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH"
if "%edition%"=="Microsoft Windows 10 Home Country Specific" set "key=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR"
if "%edition%"=="Microsoft Windows 10 Pro" set "key=W269N-WFGWX-YVC9B-4J6C9-T83GX"
if "%edition%"=="Microsoft  Windows 10 Pro N" set "key=MH37W-N47XK-V7XM9-C7227-GCQG9"
if "%edition%"=="Microsoft Windows 10 Education" set "key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
if "%edition%"=="Microsoft Windows 10 Education N" set "key=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ"
if "%edition%"=="Microsoft Windows 10 Enterprise" set "key=NPPR9-FWDCX-D2C8J-H872K-2YT43"
if "%edition%"=="Microsoft Windows 10 Enterprise N" set "key=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4"

if not defined key (
  echo Unable to find a key for this edition of Windows.
  echo Edition: "%edition%"
  pause
  exit /b 1
)

echo Product key: %key%
pause

echo Installing product key...
slmgr /ipk %key%

echo Setting KMS server...
slmgr /skms kms8.msguides.com

echo Activating Windows...
slmgr /ato

echo Resetting KMS server to default...
slmgr /skms localhost

echo Done
pause
