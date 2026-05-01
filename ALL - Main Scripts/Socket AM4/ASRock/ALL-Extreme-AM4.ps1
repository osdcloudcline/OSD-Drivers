Write-Host "Processing: ASRock AMD Socket AM4 Extreme Motherboard Drivers" -ForegroundColor Cyan
Write-Host

Write-Host "Processing: Network Card - Ethernet Drivers" -ForegroundColor Cyan
Write-Host

$ExtremeAM4NICDrivers = Invoke-WebRequest("https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Extreme%20Motherboards/Extreme-AM4.ps1")
Invoke-Expression $($ExtremeAM4NICDrivers.Content)

Write-Host 
Write-Host "Completed: Network Card - Ethernet Drivers" -ForegroundColor Green


Write-Host "Processing: Network Card - WLAN Drivers" -ForegroundColor Cyan
Write-Host

$ExtremeAM4WLANDrivers = Invoke-WebRequest("")
Invoke-Expression $($ExtremeAM4WLANDrivers.Content)

Write-Host 
Write-Host "Completed: Network Card - WLAN Drivers" -ForegroundColor Green


Write-Host "Processing: Bluetooth Drivers" -ForegroundColor Cyan
Write-Host

$ExtremeAM4BTDrivers = Invoke-WebRequest("")
Invoke-Expression $($ExtremeAM4BTDrivers.Content)

Write-Host 
Write-Host "Completed: Bluetooth Drivers" -ForegroundColor Green


Write-Host "Processing: Storage Drivers" -ForegroundColor Cyan
Write-Host

$ExtremeAM4StorageDrivers = Invoke-WebRequest("")
Invoke-Expression $($ExtremeAM4StorageDrivers.Content)

Write-Host 
Write-Host "Completed: Storage Drivers" -ForegroundColor Green

Write-Host
Write-Host "Completed: ASRock AMD Socket AM4 Extreme Motherboard Drivers" -ForegroundColor Green
