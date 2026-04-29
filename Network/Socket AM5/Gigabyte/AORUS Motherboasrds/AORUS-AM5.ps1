$NICDrivers = @(
    @{Name = "Gigabyte Socket AM5 AORUS Motherboard Intel Ethernet Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AORUS%20Motherboasrds/Gigabyte-AM5-AORUS-B650-EthernetDrivers1.zip"},
    @{Name = "Gigabyte Socket AM5 AORUS Motherboard Intel Ethernet Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AORUS%20Motherboasrds/Gigabyte-AM5-AORUS-B650-EthernetDrivers2.zip"},
    @{Name = "Gigabyte Socket AM5 AORUS Motherboard Intel Ethernet Network Card Drivers 3"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AORUS%20Motherboasrds/Gigabyte-AM5-AORUS-B650-EthernetDrivers3.zip"},
    @{Name = "Gigabyte Socket AM5 AORUS Motherboard Intel Ethernet Network Card Drivers 4"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AORUS%20Motherboasrds/Gigabyte-AM5-AORUS-X670-EthernetDrivers1.zip"},
    @{Name = "Gigabyte Socket AM5 AORUS Motherboard Intel Ethernet Network Card Drivers 5"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AORUS%20Motherboasrds/Gigabyte-AM5-AORUS-X670-EthernetDrivers2.zip"},
    @{Name = "Gigabyte Socket AM5 AORUS Motherboard Intel Ethernet Network Card Drivers 6"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AORUS%20Motherboasrds/Gigabyte-AM5-AORUS-X670-EthernetDrivers3.zip"},
    @{Name = "Gigabyte Socket AM5 AORUS Motherboard Intel Ethernet Network Card Drivers 7"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AORUS%20Motherboasrds/Gigabyte-AM5-AORUS-X670-EthernetDrivers4.zip"},
    @{Name = "Gigabyte Socket AM5 AORUS Motherboard Intel Ethernet Network Card Drivers 8"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AORUS%20Motherboasrds/Gigabyte-AM5-AORUS-X670-EthernetDrivers5.zip"},
    @{Name = "Gigabyte Socket AM5 AORUS Motherboard Intel Ethernet Network Card Drivers 9"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AORUS%20Motherboasrds/Gigabyte-AM5-AORUS-X670-EthernetDrivers6.zip"},
    @{Name = "Gigabyte Socket AM5 AORUS Motherboard Intel Ethernet Network Card Drivers 10"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AORUS%20Motherboasrds/Gigabyte-AM5-AORUS-X870-EthernetDrivers1.zip"},
    @{Name = "Gigabyte Socket AM5 AORUS Motherboard Intel Ethernet Network Card Drivers 11"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AORUS%20Motherboasrds/Gigabyte-AM5-AORUS-X870-EthernetDrivers2.zip"},
    @{Name = "Gigabyte Socket AM5 AORUS Motherboard Intel Ethernet Network Card Drivers 12"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AORUS%20Motherboasrds/Gigabyte-AM5-AORUS-X870E-EthernetDrivers1.zip"},
    @{Name = "Gigabyte Socket AM5 AORUS Motherboard Intel Ethernet Network Card Drivers 13"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AORUS%20Motherboasrds/Gigabyte-AM5-AORUS-X870E-EthernetDrivers2.zip"}
)

$DriverFileNames = @(
    @{FileName = "Gigabyte-AM5-AORUS-B650-EthernetDrivers1.zip"},
    @{FileName = "Gigabyte-AM5-AORUS-B650-EthernetDrivers2.zip"},  
    @{FileName = "Gigabyte-AM5-AORUS-B650-EthernetDrivers3.zip"},
    @{FileName = "Gigabyte-AM5-AORUS-X670-EthernetDrivers1.zip"},
    @{FileName = "Gigabyte-AM5-AORUS-X670-EthernetDrivers2.zip"},
    @{FileName = "Gigabyte-AM5-AORUS-X670-EthernetDrivers3.zip"},
    @{FileName = "Gigabyte-AM5-AORUS-X670-EthernetDrivers4.zip"},
    @{FileName = "Gigabyte-AM5-AORUS-X670-EthernetDrivers5.zip"},
    @{FileName = "Gigabyte-AM5-AORUS-X670-EthernetDrivers6.zip"},
    @{FileName = "Gigabyte-AM5-AORUS-X870-EthernetDrivers1.zip"},
    @{FileName = "Gigabyte-AM5-AORUS-X870-EthernetDrivers2.zip"},
    @{FileName = "Gigabyte-AM5-AORUS-X870E-EthernetDrivers1.zip"},
    @{FileName = "Gigabyte-AM5-AORUS-X870E-EthernetDrivers2.zip"}
)

Import-Module -Name OSD -Force
Import-Module -Name 7Zip4Powershell -Force

$destination = "C:\download\drivers\Socket AM5\Gigabyte\AORUS\Ethernet"

foreach($Driver in $NICDrivers){
    Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
    Write-Host
    Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
    Write-Host "Completed: $($Driver.Name) downloaded`n" -ForegroundColor Green
}

foreach($FileItem in $DriverFileNames){
    $expanddir = "C:\download\drivers\Socket AM5\Gigabyte\AORUS\Ethernet\extract"
    # Fixed: Changed $Driver.Name to $FileItem.FileName since $Driver is out of scope
    Write-Host "Processing: $($FileItem.FileName) extraction" -ForegroundColor Cyan
    Write-Host
    Expand-7Zip -ArchiveFileName "$destination\$($FileItem.FileName)" -TargetPath $expanddir
    Write-Host "Completed: $($FileItem.FileName) extracted`n" -ForegroundColor Green
}
