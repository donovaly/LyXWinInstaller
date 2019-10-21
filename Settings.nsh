/*
Settings for LyX installer

These typically need to be modified for each LyX release
*/

# Make the installer as small as possible
# comment this for testing builds since it will reduce the time to create an installer
# a lot - for the cost of a much greater file size.
# So assure it is active for release builds!
SetCompressor /SOLID lzma

#--------------------------------
# Version number

!define APP_VERSION_MAJOR 2
!define APP_VERSION_MINOR 3
!define APP_VERSION_REVISION 3
!define APP_VERSION_EMERGENCY "" # use "1" for an emergency release of LyX otherwise ""
!define APP_EMERGENCY_DOT "" # use "." for an emergency release of LyX otherwise ""
!define APP_VERSION_BUILD 1 # Start with 1 for the installer releases of each version

!define APP_VERSION "${APP_VERSION_MAJOR}.${APP_VERSION_MINOR}.${APP_VERSION_REVISION}${APP_EMERGENCY_DOT}${APP_VERSION_EMERGENCY}" # Version to display

!define COPYRIGHT_YEAR 2019

#--------------------------------
# Installer file name

# Typical names for the release are "LyX-232-Installer-1.exe" etc.

!ifndef ExeFile
  !define ExeFile "${APP_NAME}-${APP_VERSION_MAJOR}${APP_VERSION_MINOR}${APP_VERSION_REVISION}${APP_VERSION_EMERGENCY}-Installer-${APP_VERSION_BUILD}.exe"
!endif
!ifndef BundleExeFile
  !define BundleExeFile "${APP_NAME}-${APP_VERSION_MAJOR}${APP_VERSION_MINOR}${APP_VERSION_REVISION}${APP_VERSION_EMERGENCY}-Bundle-${APP_VERSION_BUILD}.exe"
!endif

#--------------------------------
# installer bit type - for a 32bit or 64bit LyX

# just uncomment this line for a 64bit installer:
#!define MULTIUSER_USE_PROGRAMFILES64

#--------------------------------
# File locations
# !!! you need to adjust them to the folders in your Windows system !!!

!define FILES_LYX "D:\LyXPackage2.3\LyX"
!define FILES_DEPS "D:\LyXGit\Master\lyx-windows-deps-msvc2017"
!define FILES_QT "C:\Qt\Qt5.12.5\5.12.5\msvc2017"
!define ClassFileDir "${FILES_LYX}\Resources\tex"
!define DVIPostFileDir "${FILES_DEPS}\tex"

#--------------------------------
# MiKTeX and ImageMagick

!define MiKTeXRepo "ftp://ftp.tu-chemnitz.de/pub/tex/systems/win32/miktex/tm/packages/"

!define MiKTeXDeliveredVersion "2.9"
!define ImageMagickVersion "7.0.8"
 
# definitions for the Complete installer
!if ${SETUPTYPE} == BUNDLE
 !define MiKTeXInstall "$INSTDIR\external\basic-miktex-2.9.7219-x64.exe"
!endif
