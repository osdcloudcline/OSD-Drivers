$NICDrivers = @(
    @{Name = "ASRock Socket LGA 1700 Phantom Gaming Motherboard Ethernet Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20LGA1700/ASRock/Phantom%20Gaming%20Motherboards/ASRock-LGA1700-PhantomGaming-Intel-EthernetDrivers1.zip"},
    @{Name = "ASRock Socket LGA 1700 Phantom Gaming Motherboard Ethernet Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20LGA1700/ASRock/Phantom%20Gaming%20Motherboards/ASRock-LGA1700-PhantomGaming-Intel-EthernetDrivers2.zip"},
    @{Name = "ASRock Socket LGA 1700 Phantom Gaming Motherboard Ethernet Network Card Drivers 3"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20LGA1700/ASRock/Phantom%20Gaming%20Motherboards/ASRock-LGA1700-PhantomGaming-Intel-EthernetDrivers3.zip"},
    @{Name = "ASRock Socket LGA 1700 Phantom Gaming Motherboard Ethernet Network Card Drivers 4"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20LGA1700/ASRock/Phantom%20Gaming%20Motherboards/ASRock-LGA1700-PhantomGaming-Intel-EthernetDrivers4.zip"},
    @{Name = "ASRock Socket LGA 1700 Phantom Gaming Motherboard Ethernet Network Card Drivers 5"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20LGA1700/ASRock/Phantom%20Gaming%20Motherboards/ASRock-LGA1700-PhantomGaming-Realtek-EthernetDrivers5.zip"}
   
)

$DriverFileNames = @(
    @{FileName = "ASRock-LGA1700-PhantomGaming-Intel-EthernetDrivers1.zip"}, 
    @{FileName = "ASRock-LGA1700-PhantomGaming-Intel-EthernetDrivers2.zip"},
    @{FileName = "ASRock-LGA1700-PhantomGaming-Intel-EthernetDrivers3.zip"},
    @{FileName = "ASRock-LGA1700-PhantomGaming-Intel-EthernetDrivers4.zip"},
    @{FileName = "ASRock-LGA1700-PhantomGaming-Realtek-EthernetDrivers5.zip"}
)

Import-Module -Name OSD -Force
Import-Module -Name 7Zip4Powershell -Force

$destination = "C:\download\drivers\Socket LGA 1700\ASRock\Phantom Gaming\Ethernet"

foreach($Driver in $NICDrivers){
    Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
    Write-Host
    Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
    Write-Host "Completed: $($Driver.Name) downloaded`n" -ForegroundColor Green
}

foreach($FileItem in $DriverFileNames){
    $expanddir = "C:\download\drivers\Socket LGA 1700\ASRock\Phantom Gaming\Ethernet\extract"
    # Fixed: Changed $Driver.Name to $FileItem.FileName since $Driver is out of scope
    Write-Host "Processing: $($FileItem.FileName) extraction" -ForegroundColor Cyan
    Write-Host
    Expand-7Zip -ArchiveFileName "$destination\$($FileItem.FileName)" -TargetPath $expanddir
    Write-Host "Completed: $($FileItem.FileName) extracted`n" -ForegroundColor Green
}
