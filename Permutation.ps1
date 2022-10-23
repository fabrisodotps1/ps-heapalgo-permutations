[CmdletBinding()]
param()

function Add-Permutation {
    param(
        [Array]$ToPermute,
        [int]$ArrLength
    )
    $GeneratedPermutations = @()

    if ($ArrLength -eq 1) {
        $GeneratedPermutations += $ToPermute
        return $GeneratedPermutations
    } else {
        $ArrLength = $ArrLength - 1
        Add-Permutation -ToPermute $ToPermute -ArrLength $ArrLength
        $i = 0
        while ($i -lt $ArrLength) {
            if ($ArrLength % 2 -eq 0) {
                $Temp = $ToPermute[$i]
                $ToPermute[$i] = $ToPermute[$ArrLength]
                $ToPermute[$ArrLength] = $Temp
            } else {
                $Temp = $ToPermute[0]
                $ToPermute[0] = $ToPermute[$ArrLength]
                $ToPermute[$ArrLength] = $Temp
            }
            Add-Permutation -ToPermute $ToPermute -ArrLength $ArrLength
            $i++
        }
    }
}

$ToPermute = "A","B"
$perm = Add-Permutation -ToPermute $ToPermute -ArrLength $ToPermute.Length
$perm