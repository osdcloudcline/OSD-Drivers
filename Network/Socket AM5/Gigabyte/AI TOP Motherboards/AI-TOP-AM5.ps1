$NICDrivers = @(
    @{Name = "Gigabyte Socket AM5 AI TOP Motherboard Intel Ethernet Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AI%20TOP%20Motherboards/Gigabyte-AM5-AI-TOP-EthernetDrivers-Windows10.zip"},
    @{Name = "Gigabyte Socket AM5 AI TOP Motherboard Intel Ethernet Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM5/Gigabyte/AI%20TOP%20Motherboards/Gigabyte-AM5-AI-TOP-EthernetDrivers-Windows11.zip"}
)

$DriverFileNames = @(
    @{FileName = "Gigabyte-AM5-AI-TOP-EthernetDrivers-Windows10.zip"},
    @{FileName = "Gigabyte-AM5-AI-TOP-EthernetDrivers-Windows11.zip"}  
)

Import-Module -Name OSD -Force
Import-Module -Name 7Zip4Powershell -Force

$destination = "C:\download\drivers\Socket AM5\Gigabyte\AI TOP\Ethernet"

foreach($Driver in $NICDrivers){
    Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
    Write-Host
    Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
    Write-Host "Completed: $($Driver.Name) downloaded`n" -ForegroundColor Green
}

foreach($FileItem in $DriverFileNames){
    $expanddir = "C:\download\drivers\Socket AM5\Gigabyte\AI TOP\Ethernet\extract"
    # Fixed: Changed $Driver.Name to $FileItem.FileName since $Driver is out of scope
    Write-Host "Processing: $($FileItem.FileName) extraction" -ForegroundColor Cyan
    Write-Host
    Expand-7Zip -ArchiveFileName "$destination\$($FileItem.FileName)" -TargetPath $expanddir
    Write-Host "Completed: $($FileItem.FileName) extracted`n" -ForegroundColor Green
}
