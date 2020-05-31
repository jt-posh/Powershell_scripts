$in = "icnht{ndfa(/`z{/{gj/{}n|gr"
$bin = [system.Text.Encoding]::Default.GetBytes($in) | %{[System.Convert]::ToString($_,2).PadLeft(8,'0') }
$out = ""
$text = ""
for ($a = 0 ; $a -lt $bin.Length; $a++){
    $nibble = ""
    for ($b=4; $b -le 7; $b++){
        if ($bin[$a][$b] -eq "1"){
            $nibble += "0"
        } else {
            $nibble += "1"
        }
        #$nibble += $bin[$a][$b]
    }
    $static = ($bin[$a][0..3]) -join ""
    "Bin " + $bin[$a]
    "Mod " + $static + $nibble
    $comb = $static + $nibble
    "Letter " +  [char]([convert]::ToInt32("$comb",2))
    $out += $static + $nibble + " "
    $text += [char]([convert]::ToInt32("$comb",2))
}
$out 
$text 
