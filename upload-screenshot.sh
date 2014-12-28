#!/bin/zsh
screencapture -i /tmp/screenshot
open `curl -F "filename=upload.jpg;image/jpeg;" -F "imagedata=@/tmp/screenshot" https://jaxbot.me/share.php\?token\=\`cat ~/.vim/.token\``
rm /tmp/screenshot
