#!/bin/sh
# Force Bourne shell in case tcsh is default.
#
 
#
# Reads the bundle type
#
 
echo "========================================================"
echo "    Bundle creation script"
echo "========================================================"
echo ""
echo " 1 > Create bundle"
echo " 0 > Exit"
 
read command
 
case $command in
 
  1) ;;
 
  2) ;;
 
  0) exit 0;;
 
  *) echo "Invalid command"
     exit 0;;
 
esac
 
#
# Creates the bundle
#
 
Fpath=Coldroot/Cold 
appname=Cold
appfolder=$appname.app
macosfolder=$appfolder/Contents/MacOS
plistfile=$appfolder/Contents/Info.plist
appfile=Cold
 
PkgInfoContents="APPLMAG#"
 
#
if ! [ -e $Fpath ]
then
  echo "$appfile does not exist"
elif [ -e $appfolder ]
then
  echo "$appfolder already exists"
else
  echo "Creating $appfolder..."
  mkdir $appfolder
  mkdir $appfolder/Contents
  mkdir $appfolder/Contents/MacOS
  mkdir $appfolder/Contents/Resources
 
  cp $Fpath $macosfolder/$appname
 
# Copy the resource files to the correct place
  cp *.bmp $appfolder/Contents/Resources
  cp icon3.ico $appfolder/Contents/Resources
  cp icon3.png $appfolder/Contents/Resources
  cp macicon.icns $appfolder/Contents/Resources
  cp docs/*.* $appfolder/Contents/Resources
#
# Create PkgInfo file.
  echo $PkgInfoContents >$appfolder/Contents/PkgInfo
#
# Create information property list file (Info.plist).
  echo '<?xml version="1.0" encoding="UTF-8"?>' >$plistfile
  echo '<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">' >>$plistfile
  echo '<plist version="1.0">' >>$plistfile
  echo '<dict>' >>$plistfile
  echo '  <key>LSUIElement</key>' >>$plistfile
  echo '  <true/>' >>$plistfile
  echo '  <key>CFBundleDevelopmentRegion</key>' >>$plistfile
  echo '  <string>English</string>' >>$plistfile
  echo '  <key>CFBundleExecutable</key>' >>$plistfile
  echo '  <string>'$appname'</string>' >>$plistfile
  echo '  <key>CFBundleIconFile</key>' >>$plistfile
  echo '  <string>macicon.icns</string>' >>$plistfile
  echo '  <key>CFBundleIdentifier</key>' >>$plistfile
  echo '  <string>org.magnifier.magnifier</string>' >>$plistfile
  echo '  <key>CFBundleInfoDictionaryVersion</key>' >>$plistfile
  echo '  <string>6.0</string>' >>$plistfile
  echo '  <key>CFBundlePackageType</key>' >>$plistfile
  echo '  <string>APPL</string>' >>$plistfile
  echo '  <key>CFBundleSignature</key>' >>$plistfile
  echo '  <string>MAG#</string>' >>$plistfile
  echo '  <key>CFBundleVersion</key>' >>$plistfile
  echo '  <string>1.0</string>' >>$plistfile
  echo '</dict>' >>$plistfile
  echo '</plist>' >>$plistfile
fi