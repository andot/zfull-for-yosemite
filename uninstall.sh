#!/bin/bash

OLDPWD=`pwd`
cd `dirname $0`
CURRENTPWD=`pwd`
cd $OLDPWD

echo -e "\033[1;33m正在还原字体配置文件..."
sudo cp "$CURRENTPWD/backup/CTPresetFallbacks.plist" "/System/Library/Frameworks/CoreText.framework/Versions/A/Resources/CTPresetFallbacks.plist"
sudo cp "$CURRENTPWD/backup/DefaultFontFallbacks.plist" "/System/Library/Frameworks/CoreText.framework/Versions/A/Resources/DefaultFontFallbacks.plist"
sudo chown root:wheel "/System/Library/Frameworks/CoreText.framework/Versions/A/Resources/CTPresetFallbacks.plist"
sudo chmod 644 "/System/Library/Frameworks/CoreText.framework/Versions/A/Resources/CTPresetFallbacks.plist"
sudo chown root:wheel "/System/Library/Frameworks/CoreText.framework/Versions/A/Resources/DefaultFontFallbacks.plist"
sudo chmod 644 "/System/Library/Frameworks/CoreText.framework/Versions/A/Resources/DefaultFontFallbacks.plist"

echo -e "\033[1;33m正在卸载字体..."
killall Finder
sudo rm -Rf "/System/Library/Fonts/Zfull-GB.ttf"
sudo rm -Rf "/System/Library/Fonts/Zfull-BIG5.ttf"
sudo atsutil databases -remove

echo -e "\033[1;33m卸载完成，请重启电脑。"
