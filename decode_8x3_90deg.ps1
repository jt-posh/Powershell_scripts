#decode 8x3 90 degree rotation

$flag = "aKpo_iu}l{eyrh_!fge_uCnp"
$out = ""

for ($i = 0 ; $i -le ($flag.Length/3) ; $i += 1){
    $out += $flag[$i+16]
    $out += $flag[$i+8]
    $out += $flag[$i]
}

$out 
