### Get-OperatingSystem.ps1 ###
Param($ComputerName = "LocalHost")
$cmd=gci -Path 'hklm:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\'
$cmd
#Invoke-Command -cn $ComputerName -ScriptBlock {$cmd}