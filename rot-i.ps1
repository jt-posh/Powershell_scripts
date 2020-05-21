# Script written for CTF to decode the dynamic cipher that rotates -1 based on the index of the letter
#this will not preserve upper/lowercase currently, converts to lower (just getting it working for a flag)


$encode = "Tig hdthurm DBH qcyhldpek utgg ggzmb etr geksmcjj mef qi ynl rxoqk dv lay yeyqadvhv hlqwq dbhpjvv. Vhqfnuhj rtz zxdlfrr, jhtwzo ymd rxrhzbicszz giycd wjjqphbvvh yu bqo uaqgudwgn kc shf lrike. Dsq taqx rip xpd mqrontn oyc vg hflb_do_y_bjv_hnlmmaoyf_tged_kio13. Ig bsz zwufpp hwyj pcod AxbftFljl qwceqnr ew t nyogotjpj tx xayrdnabyey fvjdszgf, M nvxn jah hxrjx odb qedksi evc edqq lykz nca ASF qukftphnbd!"
$text=$encode.ToLower()                                    # easier to deal with all same case
$out =""                                                   # clear variable
for ( $i = 0 ; $i -le $text.Length ; $i++ ) {              # run for loop until the end of the string
    $t = [int]$text[$i]                                    # assign the current letter to a variable in ascii                      
    if ($t -ge 97 -and $t -le 122){                        # if a lowercase letter do these things ascii 97-122
        $charlimit = $i % 26                               # get the index of the letter to -index from ascii number ( rotate ) make sure the number is not greater than the alphabet
        $rot=$t-$charlimit                                 # rotate the ascii char -$i
        if ($rot -lt 97){                                  # if the rotation goes below letter a (97) then add 26 to go to z (122)
            $rot +=26
        }
    } else {                                               # if not between lowercase ascii just print with no changes
        $rot=$t
    }
    $out += [char]$rot                                     # add the current letter derotatted to string four output
}
$out                                                       # output the final string
