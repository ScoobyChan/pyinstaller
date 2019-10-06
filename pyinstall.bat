@echo off
set Dir=%~dp0
set tempDir=%~dp0temp
set installDir=C:\Python

if EXIST "%installDir%/python.exe" goto END

rem :CHECKPY
rem python --version 3>NUL
rem if errorlevel 1 (
rem     echo Not available
rem     GOTO INSTALLED
rem     rem Go to Ask
rem ) else (
rem     echo Associated
rem     GOTO END
rem     rem Check Path
rem     rem ask if you want to add to path
rem     rem ASk for python Path if not in path
rem )


rem :CHECKTEMP
rem if EXIST "%tempDir%" GOTO INSTALLDIR
rem echo making Temp Directory
rem mkdir %tempDir%

rem :INSTALLDIR
rem if EXIST "%installDir%" GOTO DOWNLOAD
rem echo making Install Directory
rem mkdir %installDir%

rem :DOWNLOAD
rem powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://www.python.org/downloads/windows/','%tempDir%/pyurl.txt')"
rem pushd "%tempDir%"

rem set findtext=Latest
rem set findfile=pyurl.txt
rem rem Credits: https://ss64.com/nt/for_cmd.html
rem for /f "tokens=8" %%a in ('findstr Latest %findfile%') do (
rem 	set s="%%a"
rem 	goto Exi
rem )

rem :Exi
rem set VERSION=%s:</a></li>=%
rem del "%tempDir%\pyurl.txt"

rem :DOWNLOADPY
rem rem Download Python
rem echo Downloading Python %VERSION% from https://www.python.org/
rem powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://www.python.org/ftp/python/%VERSION%/python-%VERSION%.exe','%tempDir%/pyinstall.exe')"
rem echo Installing Python %VERSION%
rem pyinstall.exe /quiet TargetDir=%installDir% PrependPath=1 Include_test=0 Shortcuts=0 Include_launcher=0
rem pushd "%Dir%"
rem del "%tempDir%\pyinstall.exe"
rem rmdir "%tempDir%"

rem if EXIST "%installDir%/python.exe" echo Installed

rem :PATHADD
rem echo Adding to path

rem setx /M PATH %installDir%;%PATH%
rem setx /M PATH %installDir%\Scripts;%PATH%

rem GOTO END

rem :INSTALLED
rem set /p menu=Would you like to install Python? [y/n]: 
rem if "%menu%"=="y" (
rem 	echo Yes
rem 	goto CHECKTEMP
rem ) else if "%menu%"=="n" (
rem 	echo Good Bye
rem 	goto END
rem )
rem REM Incorrect answer - go back
rem GOTO INSTALLED

:END
echo Python is installed
if %PATH% | find /C /I "%installDir%"=="1" echo hello
pause