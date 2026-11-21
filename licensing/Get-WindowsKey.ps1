function Get-WindowsKey {
    $regPath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
    $digitalProductId = (Get-ItemProperty -Path $regPath).DigitalProductId
    $chars = "BCDFGHJKMPQRTVWXY2346789"
    $key = ""
    $isWin8OrNewer = [math]::Truncate($digitalProductId[66] / 6) -band 1
    $digitalProductId[66] = ($digitalProductId[66] -band 0xF7) -bor (($isWin8OrNewer -band 2) * 4)

    for ($i = 24; $i -ge 0; $i--) {
        $current = 0
        for ($j = 14; $j -ge 0; $j--) {
            $current = $current * 256
            $current = $digitalProductId[$j + 52] + $current
            $digitalProductId[$j + 52] = [math]::Truncate($current / 24)
            $current = $current % 24
        }
        $key = $chars[$current] + $key
    }

    if ($isWin8OrNewer -eq 1) {
        $keypart1 = $key.Substring(1, $current)
        $keypart2 = $key.Substring($current + 1)
        $key = $keypart1 + "N" + $keypart2
    }

    for ($i = 5; $i -lt $key.Length; $i += 6) {
        $key = $key.Insert($i, "-")
    }

    return $key
}

Get-WindowsKey
