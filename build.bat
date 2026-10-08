@ECHO OFF
REM Building AHMED SCANNER

setlocal enabledelayedexpansion

SET PACKAGE=%CD%\ahmed_scanner
SET DIST=%CD%\dist
SET PYI=pyinstaller

:: Cleaning all old versions
RMDIR /S /Q build

:: BUILD SCANNER
ECHO Compiling AHMED SCANNER ...
%PYI% ahmed_scanner.spec
if !errorlevel! neq 0 GOTO ERROR
ECHO Compiling AHMED UPGRADER ...
%PYI% ahmed_upgrader.spec
if !errorlevel! neq 0 GOTO ERROR

:: Copy Executables and other files to the package folder
move .\dist\ahmed_scanner.exe %PACKAGE%\
move .\dist\ahmed_upgrader.exe %PACKAGE%\
mkdir %PACKAGE%\tools
copy .\tools\pe-sieve32.exe %PACKAGE%\tools
copy .\tools\pe-sieve64.exe %PACKAGE%\tools

:ERROR
ECHO An error occurred. Build interrupted.

:END