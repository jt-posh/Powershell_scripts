$task = Get-ScheduledTask
$record = @()
$out = @()
$hostname = HOSTNAME.EXE
$timestamp = Get-Date -Format o

$task | % {
    $record = New-Object psobject -Property @{
        "@timestamp" = $timestamp
        "host.hostname" = $hostname
        "action" = $_.Actions -replace "`0",""
        "author" = $_.Author -replace "`0",""
        "cimclass" = $_.CimClass -replace "`0",""
        "ciminstance" = $_.CimInstanceProperties -replace "`0",""
        "cimsstem" = $_.CimSystemProperties -replace "`0",""
        "taskdate" = $_.Date -replace "`0",""
        "description" = $_.Description -replace "`0",""
        "documentation" = $_.Documentation -replace "`0",""
        "principal" = $_.Principal -replace "`0",""
        "security" = $_.SecurityDescriptor -replace "`0",""
        "settings" = $_.Settings -replace "`0",""
        "source" = $_.Source -replace "`0",""
        "state" = $_.State -replace "`0",""
        "taskname" = $_.TaskName -replace "`0",""
        "taskpath" = $_.TaskPath -replace "`0",""
        "triggers" = $_.Triggers -replace "`0",""
    }
    $out += $record

}
$out