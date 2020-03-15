SecEdit.exe /export /areas user_rights /cfg C:\temp\sec.txt
$sec = Get-Content C:\temp\sec.txt
$out = @()
$record = @()
$hostname = HOSTNAME.EXE
$timestamp = Get-Date -Format o
foreach ($line in $sec) {
    if (($line[0] -eq "[") -or ($line -match "signature") -or ($line -match "Revision")-or ($line -match "Unicode")){
        continue
    }
    $split = $line -split "="
    $key = $split[0]
    $value = $split[1]
    $valuesplit = $value -split ","
 #       for ($x = 0; $x -lt $valuesplit.count; $x++){
 #           "val$x" = $valuesplit[$x]
 #       }
    $record = New-Object psobject -Property @{
        "key" = $key
        "value" = $value
        "@timestamp" = $timestamp
        "host.hostname" = $hostname
    }
    $out += $record

}
$out | ConvertTo-Json
Remove-Item c:\temp\sec.txt