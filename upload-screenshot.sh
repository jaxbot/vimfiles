#!/bin/zsh
screencapture -i /tmp/screenshot
convert /tmp/screenshot -resize 50% /tmp/screenshot-half
open `curl -F "filename=upload.jpg;image/jpeg;" -F "imagedata=@/tmp/screenshot-half" https://jaxbot.me/share.php\?token\=\`cat ~/.vim/.token\``
rm /tmp/screenshot
rm /tmp/screenshot-half
