Write-Host "Processing: ASRock AMD Socket AM4 Extreme Motherboard Network Drivers" -ForegroundColor Cyan

$ExtremeAM4NICDrivers = Invoke-WebRequest("")
Invoke-Expression $($ExtremeAM4NICDrivers.Content)

