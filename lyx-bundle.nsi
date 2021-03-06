﻿/*
NSIS Script - LyX 2.3 Installer for Windows
Author: Uwe Stöhr
Compatible with NSIS 3.0
*/

# Do a Cyclic Redundancy Check to make sure the installer
# was not corrupted by the download.
CRCCheck force

# make it a Unicode installer
Unicode true

# enable support for high DPI resolution
ManifestDPIAware true

!ifndef SETUPTYPE
 !define SETUPTYPE BUNDLE
!endif

# installer settings like version numbers
!include settings.nsh

# declarations of LyX's registry keys, installer variant and global variables
!include include\declarations.nsh

# configuration of standard NSIS header files
!include include\nsis.nsh

# list of files to be included in the installer
!include include\filelist.nsh

# detect third-party programs like Inkscape and LaTeX
!include include\detection.nsh

# set up the installer pages
!include include\gui.nsh

# sets the install sections and checks the system on starting the un/installer
!include include\init.nsh

# install LyX and needed third-party programs like Python etc.
!include setup\install.nsh

# loads a function to modify Windows environment variables 
!include include\EnvVarUpdate.nsh

# uninstall LyX and all programs that were installed together with LyX
!include setup\uninstall.nsh

# configure LyX (set start menu and write registry entries)
!include setup\configure.nsh

# provides downloads of external programs
#!include gui\external.nsh

#--------------------------------
# Output file

Outfile "${SETUP_EXE}"

# sign the installer executable
!finalize 'signing.bat ${SETUP_EXE}'
