#!/bin/zsh
if screencapture -i /tmp/screenshot
then
	open `curl -F "filename=upload.jpg;image/jpeg;" -F "imagedata=@/tmp/screenshot" https://jaxbot.me/share.php\?token\=\`cat ~/.vim/.token\``
	rm /tmp/screenshot
fi
