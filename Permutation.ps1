[CmdletBinding()]
param()

function Add-Permutation {
    param(
        [Array]$GeneratedPermutations,
        [Array]$ToPermute,
        [int]$ArrLength
    )

    if ($ArrLength -eq 1) {
        $GeneratedPermutations += $ToPermute
    } else {
        $ArrLength = $ArrLength - 1
        Add-Permutation -ToPermute $ToPermute -ArrLength $ArrLength
        for ($i = 0, $i -lt $ArrLength, $i++) {
            $mod = $ArrLength % 2
            if($mod -eq 0) {
                # Swap $i and $Length
                $temp = $ToPermute[$i]
                $ToPermute[$i] = $ToPermute[$ArrLength]
                $ToPermute[$ArrLength] = $temp
            } else {
                # Swap 0 and $Length
                $temp = $ToPermute[0]
                $ToPermute[0] = $ToPermute[$ArrLength]
                $ToPermute[$ArrLength] = $temp
            }
            Add-Permutation -GeneratedPermutations $GeneratedPermutations -ToPermute $ToPermute -ArrLength $ArrLength
        }
    }
}

$ToPermute = 1..3
$GeneratedPermutations = @()
Add-Permutation -GeneratedPermutations $GeneratedPermutations -ToPermute $ToPermute -ArrLength $ToPermute.Length