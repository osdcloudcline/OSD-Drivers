$NICDrivers = @(
    @{Name = "ASRock Socket LGA 1700 AQUA Motherboard Ethernet Network Card Drivers"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20LGA1700/ASRock/AQUA%20Motherboards/ASRock-LGA1700-AQUA-EthernetDrivers1.zip"},
    @{Name = "ASRock Socket LGA 1700 AQUA Motherboard Ethernet Network Card Drivers"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20LGA1700/ASRock/AQUA%20Motherboards/ASRock-LGA1700-AQUA-EthernetDrivers2.zip"}
)

$DriverFileNames = @(
    @{FileName = "ASRock-LGA1700-AQUA-EthernetDrivers1.zip"},
    @{FileName = "ASRock-LGA1700-AQUA-EthernetDrivers2.zip"}
)

Import-Module -Name OSD -Force
Import-Module -Name 7Zip4Powershell -Force

$destination = "C:\download\drivers\Socket LGA 1700\ASRock\AQUA\Ethernet"

foreach($Driver in $NICDrivers){
    Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
    Write-Host
    Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
    Write-Host "Completed: $($Driver.Name) downloaded`n" -ForegroundColor Green
}

foreach($FileItem in $DriverFileNames){
    $expanddir = "C:\download\drivers\Socket LGA 1700\ASRock\AQUA\Ethernet\extract"
    # Fixed: Changed $Driver.Name to $FileItem.FileName since $Driver is out of scope
    Write-Host "Processing: $($FileItem.FileName) extraction" -ForegroundColor Cyan
    Write-Host
    Expand-7Zip -ArchiveFileName "$destination\$($FileItem.FileName)" -TargetPath $expanddir
    Write-Host "Completed: $($FileItem.FileName) extracted`n" -ForegroundColor Green
}
