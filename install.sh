#!/bin/bash

OLDPWD=`pwd`
cd `dirname $0`
CURRENTPWD=`pwd`
cd $OLDPWD

echo -e "\033[1;33m正在安装字体..."
sudo cp "$CURRENTPWD/fonts/Zfull-GB.ttf" "/System/Library/Fonts/Zfull-GB.ttf"
sudo cp "$CURRENTPWD/fonts/Zfull-BIG5.ttf" "/System/Library/Fonts/Zfull-BIG5.ttf"
sudo chown root:wheel "/System/Library/Fonts/Zfull-GB.ttf"
sudo chown root:wheel "/System/Library/Fonts/Zfull-BIG5.ttf"
sudo chmod 644 "/System/Library/Fonts/Zfull-GB.ttf"
sudo chmod 644 "/System/Library/Fonts/Zfull-BIG5.ttf"

echo -e "\033[1;33m正在替换字体配置文件..."
sudo cp "$CURRENTPWD/configs/CTPresetFallbacks.plist" "/System/Library/Frameworks/CoreText.framework/Versions/A/Resources/CTPresetFallbacks.plist"
sudo cp "$CURRENTPWD/configs/DefaultFontFallbacks.plist" "/System/Library/Frameworks/CoreText.framework/Versions/A/Resources/DefaultFontFallbacks.plist"
sudo chown root:wheel "/System/Library/Frameworks/CoreText.framework/Versions/A/Resources/CTPresetFallbacks.plist"
sudo chmod 644 "/System/Library/Frameworks/CoreText.framework/Versions/A/Resources/CTPresetFallbacks.plist"
sudo chown root:wheel "/System/Library/Frameworks/CoreText.framework/Versions/A/Resources/DefaultFontFallbacks.plist"
sudo chmod 644 "/System/Library/Frameworks/CoreText.framework/Versions/A/Resources/DefaultFontFallbacks.plist"

sudo atsutil databases -remove
killall Finder

echo -e "\033[1;33m安装完成，请重启电脑。"
