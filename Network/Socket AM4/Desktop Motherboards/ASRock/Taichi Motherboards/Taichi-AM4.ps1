$NICDrivers = @ (
@{Name = "ASRock Socket AM4 Taichi Motherboard Ethernet Network Card Drivers"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Taichi%20Motherboards/ASRock-Taichi-Intel-LANDrivers.zip"}
)

Import-Module -Name OSD -Force

foreach($Driver in $NICDrivers){
$destination = "C:\download\drivers\Socket AM4\ASRock\Taichi\Ethernet"
Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
Write-Host
  Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
Write-Host "Completed: $($Driver.Name) downloaded`n" -ForegroundColor Green
}
