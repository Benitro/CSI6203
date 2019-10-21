
#baseTriangle function defined here

Function baseTriangle()
{
    param ($b, $h)
    $area=[float]($b * $h / 2)
    Write-Output "The area for triangle with base: $b and height: $h is: $area"
}

$b=1
$h=1

#For number of iteration is less than 100, print baseTriangle output, and add 1 to height and base

For ( $i=0; $i -lt 100; $i++ ) {
    baseTriangle $b $h
    if ($h -lt 10) {$h=$h+1}
    elseif  ( $h -le 10 ) {
        $h=1 
        $b=$b+1
        }
}
