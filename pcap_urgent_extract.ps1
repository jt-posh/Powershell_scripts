$data = Import-Csv .\pcap4.csv | select -ExpandProperty "Urgent pointer" #pcap4.csv was a wireshark csv export with urgent pointer field as a column
$out = ""
$out += $data | ForEach-Object{[String]::Format("{0:x}", [int]$_)}
$out1 = (((($out -join "") -replace " ","") -split "([a-z0-9]{2})"  | ?{ $_.length -ne 0 }) -join " ") -split " " | FOREACH {[CHAR]([CONVERT]::toint16($_,16))}
$out1 = ($out1 -join "") -replace "`0",""
[Text.Encoding]::Utf8.GetString([Convert]::FromBase64String($out1))
