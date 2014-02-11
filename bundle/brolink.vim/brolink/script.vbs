Set objShell = WScript.CreateObject("WScript.Shell")
isHidden = 0 'change 0 to 1 to show the CMD prompt
objShell.Run "%comspec% /c brolink.bat", isHidden