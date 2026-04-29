$NICDrivers = @(
    @{Name = "MSI Socket AM5 MEG Motherboard Intel Ethernet Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/MSI/MEG%20Motherboards/MSI-MEGSeries-AM5-10GSuperLAN1-EthernetDrivers.zip"},
    @{Name = "MSI Socket AM5 MEG Motherboard Intel Ethernet Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/MSI/MEG%20Motherboards/MSI-MEGSeries-AM5-10GSuperLAN2-EthernetDrivers.zip"},
    @{Name = "MSI Socket AM5 MEG Motherboard Intel Ethernet Network Card Drivers 3"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/MSI/MEG%20Motherboards/MSI-MEGSeries-AM5-Intel-EthernetDrivers.zip"},
    @{Name = "MSI Socket AM5 MEG Motherboard Intel Ethernet Network Card Drivers 4"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/MSI/MEG%20Motherboards/MSI-MEGSeries-AM5-Realtek-EthernetDrivers.zip"}
   
)

$DriverFileNames = @(
    @{FileName = "MSI-MEGSeries-AM5-10GSuperLAN1-EthernetDrivers.zip"},
    @{FileName = "MSI-MEGSeries-AM5-10GSuperLAN2-EthernetDrivers.zip"}, 
    @{FileName = "MSI-MEGSeries-AM5-Intel-EthernetDrivers.zip"},
    @{FileName = "MSI-MEGSeries-AM5-Realtek-EthernetDrivers.zip"}
)

Import-Module -Name OSD -Force
Import-Module -Name 7Zip4Powershell -Force

$destination = "C:\download\drivers\Socket AM5\MSI\MEG\Ethernet"

foreach($Driver in $NICDrivers){
    Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
    Write-Host
    Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
    Write-Host "Completed: $($Driver.Name) downloaded`n" -ForegroundColor Green
}

foreach($FileItem in $DriverFileNames){
    $expanddir = "C:\download\drivers\Socket AM5\MSI\MEG\Ethernet\extract"
    # Fixed: Changed $Driver.Name to $FileItem.FileName since $Driver is out of scope
    Write-Host "Processing: $($FileItem.FileName) extraction" -ForegroundColor Cyan
    Write-Host
    Expand-7Zip -ArchiveFileName "$destination\$($FileItem.FileName)" -TargetPath $expanddir
    Write-Host "Completed: $($FileItem.FileName) extracted`n" -ForegroundColor Green
}
