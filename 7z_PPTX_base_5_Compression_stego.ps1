<#
####
CTF Script

This takes a pptx file that has base 5 setgo under the slides to pull out a flag

https://link.springer.com/content/pdf/10.1007%2F978-3-642-23300-5_27.pdf
Option 1 OOXML Stego by Compression

Take Answer to https://www.rapidtables.com/ 

Base 5 to Hex

CyberChef

From Hex to get flag
####
#>
$zip1 =& 'C:\Program Files\7-Zip\7z.exe' l <File>.pptx -slt | ConvertFrom-String -Delimiter "=" -PropertyNames key,value 
$out = @()
$record = @()
foreach ($line in $zip1){
    if ($line -match "Path"){
        $file = (($line -split "\\")[2] -split ".xml")[0]
    }elseif ($line -match "Method"){
        if ($file -notmatch "Layout" -and $file -notmatch "Master" -and $file -notmatch "notes"){
            if ($line.value -match "Store") {
                    $method = "4"
            }elseif ($line.value -match "Deflate") {
                $def = $line.value -split ":"
                if ($def[1] -match "Fastest"){
                    $method = "3"
                }elseif ($def[1] -eq "Fast") {
                    $method = "0"                
                }elseif ($def[1] -eq "Maximum") {
                    $method = "2"
                }else{
                    $method = "1"
                }
            }else{
                $method="no match"
            }     
            $record = New-Object PSObject -Property @{
                "file_name" = [int]($file -split "ide")[1]
                "Method_orig" = $line.value
                "method" = [int]$method
            }
        }
    }else{
        Continue
    }
    if($record.file_name -ne "0" -and $line.key -ne "Path"){
        $out += $record
    }
}
$post = $out | sort file_name -Unique
$answer = "" 
foreach ($a in $post.method){
    $answer += $a
}
$answer 
