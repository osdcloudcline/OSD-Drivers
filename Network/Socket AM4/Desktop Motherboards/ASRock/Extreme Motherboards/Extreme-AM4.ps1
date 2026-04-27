$NICDrivers = @(
    @{Name = "ASRock Socket AM4 Extreme Motherboard Intel Ethernet Network Card Drivers"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Extreme%20Motherboards/ASRock-Extreme-Intel-NetworkDrivers.zip"}
)

$DriverFileNames = @(
    @{FileName = "ASRock Socket AM4 Extreme Motherboard Intel Ethernet Network Card Drivers - ASRock-Extreme-Intel-NetworkDrivers.zip"} 
)

Import-Module -Name OSD -Force
Import-Module -Name 7Zip4Powershell -Force

$destination = "C:\download\drivers\Socket AM4\ASRock\Extreme\Ethernet"

foreach($Driver in $NICDrivers){
    Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
    Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
    Write-Host "Completed: $($Driver.Name) downloaded`n" -ForegroundColor Green
}

foreach($FileItem in $DriverFileNames){
    $expanddir = "C:\download\drivers\Socket AM4\ASRock\Extreme\Ethernet\extract"
    # Fixed: Changed $Driver.Name to $FileItem.FileName since $Driver is out of scope
    Write-Host "Processing: $($FileItem.FileName) extraction" -ForegroundColor Cyan
    
    Expand-7Zip -ArchiveFileName "$destination\$($FileItem.FileName)" -TargetPath $expanddir
    Write-Host "Completed: $($FileItem.FileName) extracted`n" -ForegroundColor Green
}
